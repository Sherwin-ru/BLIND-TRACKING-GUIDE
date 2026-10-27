[System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
$aabPath = "c:\Users\sherw\Downloads\bgt-main-codebase\bgt-main\app\build\outputs\bundle\release\app-release.aab"
$aabFile = Get-Item $aabPath

Write-Host "=========================================================="
Write-Host "AAB VERIFICATION REPORT FOR 16 KB PAGE-SIZE COMPATIBILITY"
Write-Host "=========================================================="
Write-Host ("AAB File: " + $aabFile.FullName)
Write-Host ("Size: {0:N0} bytes ({1:N2} MB)" -f $aabFile.Length, ($aabFile.Length / 1MB))
Write-Host ("Last Modified: " + $aabFile.LastWriteTime)
Write-Host ""

$zip = [System.IO.Compression.ZipFile]::OpenRead($aabFile.FullName)

# 1. Check BundleConfig.pb
Write-Host "--- 1. BUNDLE CONFIG CHECK (BundleConfig.pb) ---"
$bcEntry = $zip.GetEntry("BundleConfig.pb")
if ($bcEntry) {
    $s = $bcEntry.Open()
    $ms = New-Object System.IO.MemoryStream
    $s.CopyTo($ms)
    $bcBytes = $ms.ToArray()
    $s.Close()
    $ms.Close()
    
    $bundletoolVer = ""
    $str = [System.Text.Encoding]::ASCII.GetString($bcBytes)
    if ($str -match '(\d+\.\d+\.\d+)') {
        $bundletoolVer = $matches[1]
    }
    
    $has16kAlignment = $false
    for ($i = 0; $i -lt $bcBytes.Length - 5; $i++) {
        if ($bcBytes[$i] -eq 0x12 -and $bcBytes[$i+1] -eq 0x04 -and $bcBytes[$i+2] -eq 0x08 -and $bcBytes[$i+3] -eq 0x01 -and $bcBytes[$i+4] -eq 0x10 -and $bcBytes[$i+5] -eq 0x02) {
            $has16kAlignment = $true
            break
        }
    }
    Write-Host ("Bundletool version: " + $bundletoolVer)
    Write-Host ("PAGE_ALIGNMENT_16K flag present in BundleConfig.pb: " + $has16kAlignment)
    if ($has16kAlignment) {
        Write-Host "STATUS: PASS [BundleConfig requests 16 KB uncompressed alignment]"
    } else {
        Write-Host "STATUS: FAIL [Missing 16 KB page alignment configuration]"
    }
} else {
    Write-Host "BundleConfig.pb not found!"
}
Write-Host ""

# 2. Check ABIs
Write-Host "--- 2. ARCHITECTURES (ABIs) IN BUNDLE ---"
$abis = $zip.Entries | Where-Object { $_.FullName -like "base/lib/*" } | ForEach-Object {
    $parts = $_.FullName.Split('/')
    if ($parts.Length -ge 3) { $parts[2] }
} | Select-Object -Unique | Sort-Object
Write-Host ("ABIs found: " + ($abis -join ", "))
$obsoleteAbis = $abis | Where-Object { $_ -in @("mips", "mips64", "armeabi") }
if ($obsoleteAbis) {
    Write-Host ("STATUS: FAIL [Obsolete ABIs found: " + ($obsoleteAbis -join ", ") + "]")
} else {
    Write-Host "STATUS: PASS [Only standard Android ABIs present, zero obsolete ABIs]"
}
Write-Host ""

# 3. Check ELF headers of all .so files
Write-Host "--- 3. NATIVE LIBRARIES (.so) ELF 16 KB ALIGNMENT CHECK ---"
$soEntries = $zip.Entries | Where-Object { $_.FullName -like "*.so" }
$allAligned = $true
$checkedCount = 0

foreach ($entry in $soEntries) {
    $s = $entry.Open()
    $ms = New-Object System.IO.MemoryStream
    $s.CopyTo($ms)
    $bytes = $ms.ToArray()
    $s.Close()
    $ms.Close()

    if ($bytes.Length -lt 64) { continue }
    # Verify ELF magic
    if ($bytes[0] -ne 0x7F -or $bytes[1] -ne 0x45 -or $bytes[2] -ne 0x4C -or $bytes[3] -ne 0x46) { continue }
    
    $eiClass = $bytes[4] # 1=32bit, 2=64bit
    $checkedCount++

    if ($eiClass -eq 2) {
        # 64-bit ELF
        $e_phoff = [BitConverter]::ToUInt64($bytes, 32)
        $e_phentsize = [BitConverter]::ToUInt16($bytes, 54)
        $e_phnum = [BitConverter]::ToUInt16($bytes, 56)

        $libOk = $true
        $loadSegments = @()

        for ($p = 0; $p -lt $e_phnum; $p++) {
            $offset = $e_phoff + ($p * $e_phentsize)
            if ($offset + 56 -gt $bytes.Length) { break }

            $p_type = [BitConverter]::ToUInt32($bytes, $offset)
            if ($p_type -eq 1) { # PT_LOAD
                $p_offset = [BitConverter]::ToUInt64($bytes, $offset + 8)
                $p_vaddr = [BitConverter]::ToUInt64($bytes, $offset + 16)
                $p_align = [BitConverter]::ToUInt64($bytes, $offset + 48)

                $congruent = (($p_vaddr - $p_offset) % 16384) -eq 0
                $alignOk = ($p_align -ge 16384) -and $congruent

                $loadSegments += [PSCustomObject]@{
                    Align = $p_align
                    Offset = $p_offset
                    VAddr = $p_vaddr
                    Ok = $alignOk
                }
                if (-not $alignOk) { $libOk = $false; $allAligned = $false }
            }
        }

        $alignSummary = ($loadSegments | ForEach-Object {
            "LOAD[align=0x{0:X} ({1} KB), offset=0x{2:X}, vaddr=0x{3:X}, ok={4}]" -f $_.Align, ($_.Align / 1024), $_.Offset, $_.VAddr, $_.Ok
        }) -join "; "

        if ($libOk) {
            Write-Host ("[PASS 16KB] " + $entry.FullName)
            Write-Host ("      " + $alignSummary)
        } else {
            Write-Host ("[FAIL 16KB] " + $entry.FullName)
            Write-Host ("      " + $alignSummary)
        }
    } else {
        Write-Host ("[32-BIT OK] " + $entry.FullName)
    }
}

Write-Host ""
Write-Host ("Total native libraries checked: " + $checkedCount)
if ($allAligned) {
    Write-Host "ALL 64-BIT NATIVE LIBRARIES SATISFY 16 KB ELF ALIGNMENT!"
} else {
    Write-Host "ERROR: SOME 64-BIT NATIVE LIBRARIES FAILED 16 KB ELF ALIGNMENT!"
}
Write-Host ""

# 4. Check Bundle Signing
Write-Host "--- 4. BUNDLE SIGNING CHECK ---"
$rsaEntry = $zip.Entries | Where-Object { $_.FullName -like "META-INF/*.RSA" -or $_.FullName -like "META-INF/*.DSA" -or $_.FullName -like "META-INF/*.EC" }
if ($rsaEntry) {
    Write-Host ("Signed: YES. Signature file: " + $rsaEntry.FullName)
    $s = $rsaEntry.Open()
    $fs = [System.IO.File]::Create("scratch\BUNDLE_SIGN.RSA")
    $s.CopyTo($fs)
    $s.Close()
    $fs.Close()
    
    $keytoolOut = & "C:\Program Files\Java\jdk-21\bin\keytool.exe" -printcert -file "scratch\BUNDLE_SIGN.RSA"
    $sha1 = ($keytoolOut | Select-String "SHA1:").Line.Trim()
    $sha256 = ($keytoolOut | Select-String "SHA256:").Line.Trim()
    $owner = ($keytoolOut | Select-String "Owner:").Line.Trim()
    Write-Host ("Signer: " + $owner)
    Write-Host ("  " + $sha1)
    Write-Host ("  " + $sha256)
    
    if ($sha1 -match "09:A4:8F:87:31:BB:65:A6:22:FF:07:C0:6E:D9:FD:76:18:18:AD:EF") {
        Write-Host "STATUS: PASS [Signed with official Blind Tracking Guide release key expected by Google Play!]"
    } else {
        Write-Host "STATUS: WARNING [Key does not match production key]"
    }
} else {
    Write-Host "Signed: NO"
}
Write-Host ""

# 5. Check Manifest Version Code & Name
Write-Host "--- 5. BUNDLE MANIFEST VERSION CHECK ---"
$manifestEntry = $zip.GetEntry("base/manifest/AndroidManifest.xml")
if ($manifestEntry) {
    $manifestText = Get-Content "app/build/intermediates/bundle_manifest/release/processApplicationManifestReleaseForBundle/AndroidManifest.xml" -Raw
    if ($manifestText -match 'android:versionCode="(\d+)"') {
        Write-Host ("versionCode: " + $matches[1])
    }
    if ($manifestText -match 'android:versionName="([^"]+)"') {
        Write-Host ("versionName: " + $matches[1])
    }
    if ($manifestText -match 'android:targetSdkVersion="(\d+)"' -or $manifestText -match 'android:compileSdkVersion="(\d+)"') {
        Write-Host ("SDK info found in manifest")
    }
}
$zip.Dispose()
Write-Host "=========================================================="
