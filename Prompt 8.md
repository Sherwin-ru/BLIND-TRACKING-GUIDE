PROMPT 7B — BTG WHOLE-APP VOICE CONTROL
========================================

OBJECTIVE

Extend the working global VoiceSessionManager from Prompt 7A so that
voice commands operate throughout the ENTIRE BTG application.

The Voice Assistant screen must NOT be required.

==================================================
CORE REQUIREMENT
==================================================

Voice recognition must remain available while navigating between:

Home
Profile
Settings
Navigation
AI Vision
Emergency
History
Route History
Other BTG screens

The voice system must be application-level.

==================================================
VOICE COMMANDS
==================================================

Implement and verify:

APPLICATION:

"Open home"
"Go home"
"Go back"
"Help"
"What can I do?"
"Repeat"
"Stop speaking"

PROFILE:

"Open profile"
"Edit profile"
"Save profile"

SETTINGS:

"Open settings"

LOCATION:

"Where am I?"
"What is my location?"
"Tell me my location"
"Share my location"

NAVIGATION:

"Open navigation"
"Start navigation"
"Navigate home"
"Take me home"
"Go home"
"Stop navigation"
"Pause navigation"
"Resume navigation"
"Repeat navigation"
"What is the next turn?"
"How far is the destination?"
"What is my route status?"

AI VISION:

"Start AI vision"
"Open camera"
"Stop AI vision"
"Read text"
"Read this"
"Scan barcode"
"Scan this barcode"

EMERGENCY:

"SOS"
"Emergency"
"Activate SOS"
"Start SOS"
"Cancel SOS"
"Emergency status"

DEVICE:

"Battery"
"What is my battery?"
"What time is it?"

GUIDANCE:

"Start guidance"
"Stop guidance"
"Pause guidance"
"Resume guidance"
"What is ahead?"
"What is next?"

==================================================
COMMAND ARCHITECTURE
==================================================

All commands must follow:

VoiceSessionManager
        ↓
VoiceCommandParser
        ↓
VoiceCommandDispatcher
        ↓
Existing feature/service

Do NOT place command parsing inside Compose screens.

==================================================
CONTEXT-AWARE STOP
==================================================

"Stop" must resolve according to application state.

Navigation active:

StopNavigation

AI Vision active:

StopAiVision

TTS speaking:

StopSpeech

SOS active:

Do not cancel SOS unless existing safety logic explicitly permits it.

Emergency commands always have highest priority.

==================================================
SCREEN INDEPENDENCE TEST
==================================================

Test this exact sequence without touching the microphone:

"Open profile"
→ profile opens

"Edit profile"
→ edit mode

"Save profile"
→ profile saved

"Open settings"
→ settings opens

"Go back"
→ previous screen

"Open navigation"
→ navigation opens

"Navigate home"
→ home navigation starts

"Stop navigation"
→ navigation stops

"Start AI vision"
→ AI Vision starts

"Stop AI vision"
→ AI Vision stops

==================================================
CONTINUOUS COMMAND MODE
==================================================

After every command:

ACTION
→ spoken result
→ automatic listening

The user must not reopen Voice Assistant.

==================================================
ERROR HANDLING
==================================================

Unknown command:

"I didn't understand that command. Say Help for available commands."

Recognition failure:

"I couldn't hear you. Please try again."

Never crash.

==================================================
TESTING
==================================================

Create:

Prompt7WholeAppVoiceTest.kt

Test all major commands.

Run:

./gradlew clean assembleDebug testDebugUnitTest

==================================================
PHYSICAL DEVICE TEST
==================================================

On Nothing A059:

Long-press Power.

After BTG opens:

DO NOT TOUCH THE SCREEN.

Test:

"Where am I?"
"Open profile"
"Go back"
"Open settings"
"Open navigation"
"Navigate home"
"Stop navigation"
"Start AI vision"
"Stop AI vision"
"Battery"
"What time is it?"
"Help"

Every command must work without opening Voice Assistant.

==================================================
SUCCESS CONDITION
==================================================

The application must remain voice-operable across screen changes.

STOP AFTER PROMPT 7B.