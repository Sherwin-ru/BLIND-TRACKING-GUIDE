PROMPT 7A — BTG GLOBAL VOICE SESSION ARCHITECTURE
==================================================

OBJECTIVE

Fix the current fundamental problem in BTG:

Voice commands currently work only after the user opens the
"Voice Assistant" screen.

This is NOT acceptable.

The MAIN BTG APPLICATION must own the voice-control session.

The Voice Assistant screen must NOT be the controller of speech
recognition.

==================================================
REQUIRED USER FLOW
==================================================

The user:

1. Long-presses the Power button.
2. Android activates BTG VoiceInteractionService.
3. BTG opens MainActivity.
4. BTG says:

"Welcome to Blind Tracking Guide. How can I help you?"

5. After TTS finishes, BTG automatically starts listening.
6. User says a command.
7. BTG executes it.
8. BTG speaks the result.
9. BTG automatically starts listening again.

The user must NOT:

- open Voice Assistant
- click Voice Assistant
- click microphone
- visually find a button

==================================================
CURRENT PROBLEM
==================================================

The current architecture is effectively:

MainActivity
    ↓
Voice Assistant Screen
    ↓
Microphone button
    ↓
SpeechRecognizer
    ↓
Command

This must be changed to:

VoiceInteractionService
    ↓
MainActivity
    ↓
VoiceSessionManager
    ↓
Speech Recognition
    ↓
VoiceCommandParser
    ↓
VoiceCommandDispatcher
    ↓
Existing BTG feature
    ↓
TTS
    ↓
VoiceSessionManager
    ↓
Speech Recognition

==================================================
STEP 1 — INSPECT EXISTING PROJECT
==================================================

Before modifying anything:

1. Inspect the complete project.
2. Inspect VoiceInteractionService.
3. Inspect MainActivity.
4. Inspect VoiceSessionManager if already present.
5. Inspect VoiceAssistantScreen.
6. Inspect VoiceAssistantViewModel.
7. Inspect SpeechRecognizer implementation.
8. Inspect TextToSpeechManager.
9. Inspect VoiceCommandParser.
10. Inspect VoiceCommandDispatcher.
11. Inspect navigation.
12. Inspect existing Prompt 5/6 voice architecture.

Determine EXACTLY why recognition currently depends on
the Voice Assistant screen.

Do not guess.

==================================================
STEP 2 — GLOBAL VOICE SESSION
==================================================

Create or modify:

VoiceSessionManager.kt

It must be application-level.

It must NOT depend on:

VoiceAssistantScreen
VoiceAssistantComposable
VoiceAssistantViewModel
MicrophoneButton

It must manage:

- SpeechRecognizer
- recognition lifecycle
- TTS coordination
- listening state
- processing state
- error recovery
- command dispatch
- session start
- session stop

==================================================
STEP 3 — MAINACTIVITY INTEGRATION
==================================================

When MainActivity is launched from BTG VoiceInteractionService:

1. Detect voice-originated launch.
2. Initialize VoiceSessionManager.
3. Do NOT open Voice Assistant screen.
4. Keep the normal BTG Home screen.
5. Start the global voice session.
6. Speak:

"Welcome to Blind Tracking Guide. How can I help you?"

7. After TTS completion, start recognition.

==================================================
STEP 4 — AUTOMATIC LISTENING
==================================================

Implement:

GREETING
    ↓
LISTENING
    ↓
USER SPEAKS
    ↓
PROCESSING
    ↓
TTS
    ↓
LISTENING

After every successful command:

TTS completes
    ↓
automatically start listening again

No microphone button.

==================================================
STEP 5 — TTS AND RECOGNITION
==================================================

Never listen while BTG is speaking.

Use the existing TextToSpeechManager and
UtteranceProgressListener.

Required:

LISTENING
→ PROCESSING
→ SPEAKING
→ TTS COMPLETE
→ LISTENING

Prevent TTS audio from being recognized as user speech.

==================================================
STEP 6 — RECOGNITION ERRORS
==================================================

Handle:

ERROR_NO_MATCH
ERROR_SPEECH_TIMEOUT
ERROR_AUDIO
ERROR_CLIENT
ERROR_RECOGNIZER_BUSY
ERROR_NETWORK
ERROR_INSUFFICIENT_PERMISSIONS

Do not crash.

Recover temporary errors.

For microphone permission:

"Microphone permission is required for voice control."

Use safe retry/backoff.

Do not create an infinite rapid recognition loop.

==================================================
STEP 7 — SCREEN INDEPENDENCE
==================================================

VoiceSessionManager must continue independently of the current
Compose screen.

The user can navigate:

Home
→ Profile
→ Settings
→ Navigation
→ AI Vision
→ Emergency

without losing voice control.

==================================================
STEP 8 — PRESERVE EXISTING ARCHITECTURE
==================================================

Reuse:

VoiceCommandParser
VoiceCommandDispatcher
SpeechQueueManager
TextToSpeechManager
VoiceGuidanceEngine
VoiceInteractionService

Do NOT create duplicate versions.

Do NOT rewrite working business logic.

==================================================
STEP 9 — EXISTING VOICE ASSISTANT SCREEN
==================================================

Keep the Voice Assistant screen as an optional fallback or
diagnostic interface.

But:

NORMAL BTG VOICE OPERATION MUST NOT DEPEND ON IT.

==================================================
STEP 10 — TESTING
==================================================

Add tests for:

1. VoiceSessionManager initialization.
2. MainActivity voice launch.
3. Welcome message.
4. Automatic listening.
5. TTS → listening transition.
6. Recognition failure.
7. Permission failure.
8. Duplicate SpeechRecognizer prevention.
9. Lifecycle cleanup.

Run:

./gradlew clean assembleDebug

Then:

./gradlew testDebugUnitTest

Do not delete tests.

==================================================
PHYSICAL TEST
==================================================

Test on Nothing A059 / Android 16.

1. Go to phone home screen.
2. Long-press Power.
3. BTG opens.
4. BTG says:

"Welcome to Blind Tracking Guide. How can I help you?"

5. DO NOT TOUCH THE SCREEN.
6. Say:

"Where am I?"

The command must be recognized WITHOUT opening Voice Assistant.

If this fails, STOP.

Do not continue to later prompts until this is fixed.

==================================================
FINAL REPORT
==================================================

Report:

- exact current root cause
- files changed
- VoiceSessionManager changes
- MainActivity changes
- VoiceInteractionService changes
- tests
- build result
- physical device result

Do not claim success unless the physical test works.

STOP AFTER PROMPT 7A.