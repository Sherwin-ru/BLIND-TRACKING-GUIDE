PROMPT 7D — BTG FINAL VOICE-FIRST TESTING & STABILIZATION
===========================================================

OBJECTIVE

Perform final integration, regression testing, physical-device
verification and stabilization of the complete BTG voice-first system.

Do NOT introduce unrelated features.

Do NOT rewrite working architecture.

==================================================
1. COMPLETE USER JOURNEY
==================================================

Test the exact real-world workflow:

PHONE HOME SCREEN
        ↓
LONG-PRESS POWER
        ↓
BTG OPENS
        ↓
"Welcome to Blind Tracking Guide. How can I help you?"
        ↓
AUTOMATIC LISTENING
        ↓
"Where am I?"
        ↓
LOCATION SPOKEN
        ↓
AUTOMATIC LISTENING
        ↓
"Open profile"
        ↓
PROFILE OPENS
        ↓
"Go back"
        ↓
PREVIOUS SCREEN
        ↓
"Open settings"
        ↓
SETTINGS
        ↓
"Open navigation"
        ↓
NAVIGATION
        ↓
"Navigate home"
        ↓
VOICE GUIDANCE
        ↓
"How far is the destination?"
        ↓
DISTANCE SPOKEN
        ↓
"Stop navigation"
        ↓
NAVIGATION STOPPED
        ↓
"Start AI vision"
        ↓
AI VISION
        ↓
"Read text"
        ↓
TEXT SPOKEN
        ↓
"Stop AI vision"
        ↓
VISION STOPPED

The entire sequence must work without opening the Voice Assistant
screen.

==================================================
2. NO TOUCH TEST
==================================================

Perform a complete test where after pressing the Power button:

NO SCREEN TOUCHES ARE ALLOWED.

The user must perform all actions through voice.

If any essential feature requires a screen tap:

mark the test FAIL.

==================================================
3. VOICE ASSISTANT SCREEN TEST
==================================================

The Voice Assistant screen may still exist.

Verify:

- it does not control the global session
- closing it does not stop global voice control
- navigating away from it does not disable voice control

==================================================
4. LIFECYCLE TESTING
==================================================

Test:

- Home
- Background
- Foreground
- Screen rotation if supported
- Activity recreation
- App navigation
- Service destruction
- Returning to BTG

Verify:

No duplicate SpeechRecognizer.

No duplicate TTS.

No leaked listeners.

No microphone resource leak.

==================================================
5. ERROR TESTING
==================================================

Test:

Microphone denied
Microphone busy
No speech
Unknown command
Recognition timeout
Recognition error
TTS error
GPS unavailable
Network unavailable
Reverse geocoding failure

The application must not crash.

==================================================
6. REGRESSION
==================================================

Verify:

Firebase Authentication
Firebase RTDB
Profile
Emergency Contacts
Home Address
Room v7
Room migrations
GPS
Location tracking
MapLibre
GraphHopper
Home navigation
Reverse geocoding
PIN formatting
AI Vision
OCR
Barcode
SOS
Voice parser
Voice dispatcher
Speech queue
TTS

==================================================
7. BUILD
==================================================

Run:

./gradlew clean assembleDebug

Then:

./gradlew testDebugUnitTest

Do not delete tests.

Do not disable tests.

Do not hide failures.

==================================================
8. PHYSICAL DEVICE
==================================================

Device:

Nothing A059
Android 16

Report each test as:

PASS
FAIL
PARTIAL
PLATFORM LIMITATION

Do not claim a test passed simply because the code compiled.

==================================================
9. FINAL ACCEPTANCE CRITERIA
==================================================

The project is successful only when:

1. Long-press Power activates BTG.
2. BTG opens.
3. Welcome message is spoken.
4. Listening starts automatically.
5. User does not open Voice Assistant.
6. User does not press microphone.
7. Voice commands work from Home.
8. Voice commands work from Profile.
9. Voice commands work from Settings.
10. Voice commands work from Navigation.
11. Voice commands work from AI Vision.
12. Navigation is voice-operated.
13. AI Vision is voice-operated.
14. Location is spoken.
15. PIN is spoken digit-by-digit.
16. SOS remains functional.
17. TTS returns to listening after responses.
18. Critical messages have priority.
19. No crashes occur.
20. Existing functionality remains intact.

==================================================
FINAL REPORT
==================================================

Provide:

1. Root cause fixed.
2. Files created.
3. Files modified.
4. Final architecture.
5. VoiceSessionManager behavior.
6. VoiceInteractionService behavior.
7. Voice command coverage.
8. Navigation guidance.
9. AI Vision guidance.
10. Safety behavior.
11. Unit tests.
12. Build result.
13. Physical device results.
14. Known limitations.

Do not claim "fully voice controlled" unless the physical
Nothing A059 test actually confirms it.

END OF PROMPT 7D.