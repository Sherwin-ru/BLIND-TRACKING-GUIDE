BTG CORE VOICE-FIRST ARCHITECTURE
BACKBONE IMPLEMENTATION — PHASE 1
DO NOT SKIP ARCHITECTURAL ANALYSIS

PROJECT:
Blind Tracking Guide (BTG)
Package:
com.blindtracking.guide

============================================================
MISSION
============================================================

Transform the existing Blind Tracking Guide application into a
VOICE-FIRST ASSISTIVE APPLICATION for blind and visually impaired
users.

Voice must become the PRIMARY interaction mechanism.

A blind user must be able to operate the application's major
functions without depending on visually locating and clicking UI
elements.

Touch interaction MUST remain available as a fallback.

This implementation is the BACKBONE of the application.

Therefore:

DO NOT perform a superficial implementation.

DO NOT simply add more if/else statements to VoiceAssistantService.

DO NOT create duplicate implementations of existing features.

DO NOT rewrite working modules unnecessarily.

Build a clean, centralized, extensible voice-control architecture
that can later support:

1. Full application voice control
2. Proactive voice guidance
3. Turn-by-turn navigation guidance
4. AI Vision safety guidance
5. Obstacle warnings
6. Context-aware assistance
7. Wake-word activation
8. Emergency/safety prioritization

============================================================
CURRENT PROJECT STATUS
============================================================

The existing application already contains working functionality,
including:

- Firebase Authentication
- Firebase Realtime Database
- User Profile
- Emergency Contacts
- Home Address
- Room database
- Room migrations
- GPS/location tracking
- LocationService
- LocationRepository
- SOS/Emergency functionality
- MapLibre
- GraphHopper routing
- Home Address navigation
- Voice Assistant
- Android Text-to-Speech
- Speech recognition
- "Where am I?" with human-readable location
- PIN spoken digit-by-digit
- AI Vision
- OCR
- Barcode scanning
- Notifications
- 16 KB page-size compatibility

The application has already been tested successfully.

PRESERVE ALL OF THESE.

============================================================
ABSOLUTE RULES
============================================================

Before modifying ANY code:

1. Inspect the entire project.
2. Understand the current architecture.
3. Identify all existing voice-related functionality.
4. Identify all existing navigation routes/screens.
5. Identify all existing ViewModels/use cases/repositories/services.
6. Identify how GPS is currently exposed.
7. Identify how AI Vision is currently exposed.
8. Identify how SOS is currently exposed.
9. Identify how Profile/Home Address is currently exposed.
10. Identify the current Text-to-Speech implementation.
11. Identify the current speech-recognition implementation.
12. Identify all existing voice commands.

Do NOT start coding until the existing architecture has been
understood.

Do NOT create duplicate:
- Location services
- Navigation services
- TTS engines
- Speech recognizers
- SOS handlers
- AI Vision engines
- Profile repositories
- Home Address repositories

Reuse existing implementations.

============================================================
CORE ARCHITECTURE
============================================================

Implement the following conceptual architecture:

                 USER
                   │
                   ▼
          Speech Recognition
                   │
                   ▼
          Voice Input Normalizer
                   │
                   ▼
           Voice Command Parser
                   │
                   ▼
          Voice Intent / Command
                   │
                   ▼
        Voice Command Dispatcher
                   │
        ┌──────────┼───────────┐
        ▼          ▼           ▼
     Profile    Navigation    SOS
        │          │           │
        ├────── AI Vision ─────┤
        │          │           │
        └──── Location ────────┘
                   │
                   ▼
          Guidance Event System
                   │
                   ▼
          Priority Manager
                   │
                   ▼
          Speech Queue Manager
                   │
                   ▼
             Text-to-Speech
                   │
                   ▼
                  USER

The architecture must allow future modules to publish guidance
events without directly speaking through TextToSpeech.

============================================================
PART 1 — VOICE COMMAND MODEL
============================================================

Create a centralized VoiceCommand model using sealed classes,
enums, or an equivalent type-safe design appropriate for the
existing architecture.

At minimum support:

NAVIGATION:
- OPEN_NAVIGATION
- START_NAVIGATION
- NAVIGATE_HOME
- STOP_NAVIGATION
- REPEAT_NAVIGATION_INSTRUCTION
- CURRENT_ROUTE_STATUS
- DISTANCE_TO_DESTINATION
- NEXT_TURN

LOCATION:
- WHERE_AM_I
- SHARE_LOCATION

PROFILE:
- OPEN_PROFILE
- EDIT_PROFILE
- SAVE_PROFILE

SETTINGS:
- OPEN_SETTINGS

AI VISION:
- START_AI_VISION
- STOP_AI_VISION
- READ_TEXT
- SCAN_BARCODE

EMERGENCY:
- ACTIVATE_SOS
- CANCEL_SOS
- EMERGENCY_STATUS

DEVICE:
- BATTERY
- TIME

APPLICATION:
- OPEN_HOME
- GO_BACK
- HELP
- REPEAT_LAST_RESPONSE
- STOP_SPEECH

GUIDANCE:
- START_GUIDANCE
- STOP_GUIDANCE
- RESUME_GUIDANCE
- PAUSE_GUIDANCE
- WHAT_IS_AHEAD
- WHAT_IS_NEXT

============================================================
PART 2 — NATURAL LANGUAGE COMMAND PARSER
============================================================

Create a dedicated:

VoiceCommandParser

It must convert recognized speech into structured VoiceCommand
objects.

Do NOT require exact phrases.

Examples:

"Where am I?"
"My location?"
"Tell me where I am"
"Where am I currently?"

→ WHERE_AM_I

"Take me home"
"Go home"
"Navigate home"
"I want to go home"
"Navigate to my home"

→ NAVIGATE_HOME

"Open navigation"
"Show navigation"
"Start navigation"

→ OPEN_NAVIGATION / START_NAVIGATION according to context.

"Stop navigation"
"Stop"

→ STOP_NAVIGATION

"What's my next turn?"
"What should I do next?"
"Next instruction"

→ NEXT_TURN

"How far is home?"
"How far until I get home?"

→ DISTANCE_TO_DESTINATION

"Open camera"
"Start vision"
"Start object detection"

→ START_AI_VISION

"Read this"
"Read text"
"Read what's in front of me"

→ READ_TEXT

"Scan barcode"
"Read barcode"

→ SCAN_BARCODE

"Emergency"
"SOS"
"Help me"

→ ACTIVATE_SOS

"Cancel SOS"
"Cancel emergency"

→ CANCEL_SOS

"Open profile"
"My profile"

→ OPEN_PROFILE

"Open settings"
"Settings"

→ OPEN_SETTINGS

"Battery"
"How much battery?"
"Battery percentage"

→ BATTERY

"What time is it?"
"Tell me the time"

→ TIME

"Help"
"What can I say?"
"Available commands"

→ HELP

"Repeat"
"Say that again"

→ REPEAT_LAST_RESPONSE

"Stop talking"
"Be quiet"
"Stop speaking"

→ STOP_SPEECH

The parser must:

- be case insensitive
- normalize whitespace
- tolerate punctuation
- tolerate common speech-recognition variations
- handle minor recognition errors where reasonably possible
- avoid false positives
- prioritize safety commands
- be deterministic and testable

Do NOT use an LLM/network API merely to parse basic commands.

The core command parser must work offline.

============================================================
PART 3 — COMMAND CONTEXT
============================================================

Commands must be context-aware.

Example:

"Stop"

while navigation is active:

→ STOP_NAVIGATION

"Stop"

while AI Vision is active:

→ STOP_AI_VISION

"Stop talking":

→ STOP_SPEECH

Do NOT execute ambiguous commands blindly when multiple meanings
are possible.

If necessary, ask a short clarification question.

Example:

"Do you want to stop navigation or stop vision assistance?"

============================================================
PART 4 — CENTRAL COMMAND DISPATCHER
============================================================

Create a centralized:

VoiceCommandDispatcher

or equivalent use-case-oriented dispatcher.

The dispatcher MUST NOT contain the actual implementation of
every feature.

It should invoke existing application logic.

Example:

NAVIGATE_HOME
→ existing Home Address navigation flow

WHERE_AM_I
→ existing Location + ReverseGeocodingService

ACTIVATE_SOS
→ existing SOS logic

START_AI_VISION
→ existing AI Vision functionality

READ_TEXT
→ existing OCR

SCAN_BARCODE
→ existing barcode functionality

OPEN_PROFILE
→ existing navigation route

OPEN_SETTINGS
→ existing settings route

BATTERY
→ existing battery functionality

TIME
→ existing time functionality

============================================================
PART 5 — VOICE RESPONSE SYSTEM
============================================================

Create a centralized voice-response layer.

Do NOT allow every feature to directly call TextToSpeech.

Conceptually:

Feature
   ↓
Guidance/Speech Event
   ↓
Speech Queue
   ↓
TextToSpeech

The speech system must guarantee:

- only one message speaks at a time
- higher-priority messages can interrupt lower-priority messages
- duplicate messages are suppressed
- messages can be queued
- speech can be cancelled
- speech can be repeated
- speech state is observable

============================================================
PART 6 — SPEECH PRIORITY
============================================================

Define priorities similar to:

CRITICAL
HIGH
NORMAL
LOW

Suggested priority:

CRITICAL:
- SOS
- immediate collision/obstacle warning
- emergency warning

HIGH:
- navigation turn
- route deviation
- dangerous road situation

NORMAL:
- location
- destination information
- normal guidance

LOW:
- battery
- time
- informational messages

If a CRITICAL message arrives while a LOW message is speaking:

1. stop/cancel the LOW message
2. speak the CRITICAL message immediately

Never allow competing TTS streams.

============================================================
PART 7 — DUPLICATE SPEECH SUPPRESSION
============================================================

Prevent repeated announcements.

Example:

AI Vision detects:

"Person ahead."

20 times within 5 seconds.

The user should NOT hear:

"Person ahead."
"Person ahead."
"Person ahead."
...

Create cooldown/debouncing logic.

However:

If the object becomes significantly closer or risk increases,
the warning may be announced again.

============================================================
PART 8 — GUIDANCE EVENT MODEL
============================================================

Create a centralized GuidanceEvent model.

Examples:

LOCATION_UPDATE
NAVIGATION_INSTRUCTION
TURN_APPROACHING
TURN_NOW
ROUTE_DEVIATION
DESTINATION_APPROACHING
ARRIVAL
OBSTACLE_WARNING
PERSON_DETECTED
VEHICLE_DETECTED
STAIRS_DETECTED
ROAD_WARNING
GPS_UNAVAILABLE
LOCATION_PERMISSION_REQUIRED
NETWORK_UNAVAILABLE
LOW_BATTERY
SOS_ALERT
SOS_CANCELLED
GENERAL_INFORMATION

Each event should contain appropriate metadata such as:

- priority
- message
- timestamp
- source
- optional distance
- optional direction
- optional confidence
- optional cooldown

============================================================
PART 9 — GUIDANCE ENGINE
============================================================

Create an architecture-ready:

VoiceGuidanceEngine

It must consume events from:

- GPS
- Navigation
- AI Vision
- SOS
- Device state
- Location
- Application state

and decide what should be spoken.

IMPORTANT:

In this phase, implement the architecture and integrate the
existing commands.

Do NOT yet create uncontrolled continuous AI Vision speech.

Do NOT create uncontrolled continuous GPS speech.

The next phase will implement proactive guidance safely.

============================================================
PART 10 — CURRENT "WHERE AM I?" FUNCTION
============================================================

Preserve the existing implementation.

"Where am I?" must continue to provide:

- locality/area
- city/district
- state when available
- PIN code
- digit-by-digit PIN pronunciation
- coordinates fallback if reverse geocoding fails

Example:

"You are currently near Samayapuram, Tiruchirappalli, Tamil Nadu.
Your PIN code is 6 2 1 1 1 2."

Do NOT break or replace this implementation.

============================================================
PART 11 — HOME NAVIGATION
============================================================

Preserve the existing working Home Address navigation.

"Navigate Home"

must:

1. retrieve the authenticated user's saved Home Address
2. geocode the address
3. obtain current GPS location
4. calculate route
5. display the route
6. provide voice navigation
7. handle off-route situations
8. announce arrival

Do not hardcode the destination.

============================================================
PART 12 — ACCESSIBILITY-FIRST UX
============================================================

The application must be usable without requiring the user to
visually locate UI controls.

For every major feature:

Voice command
    ↓
Action
    ↓
Voice confirmation

Examples:

"Open profile."

→ "Opening your profile."

"Open navigation."

→ "Opening navigation."

"Start vision."

→ "Starting vision assistance."

"Open settings."

→ "Opening settings."

"Go back."

→ "Going back."

============================================================
PART 13 — HELP SYSTEM
============================================================

The Help command must provide a concise spoken command guide.

Example:

"You can say Where am I, Navigate home, Open navigation,
Start vision, Read text, Scan barcode, Emergency, Cancel SOS,
Open profile, Open settings, Battery, Time, Share location,
Go back, or Repeat."

Do not make the response excessively long.

============================================================
PART 14 — UNKNOWN COMMANDS
============================================================

If speech is recognized but no command matches:

"I didn't understand that command. Say Help to hear available commands."

Do NOT crash.

Do NOT silently ignore the user.

============================================================
PART 15 — NO SPEECH / RECOGNITION FAILURE
============================================================

Handle:

- no speech
- timeout
- recognition failure
- microphone unavailable
- permission denied
- recognizer unavailable
- network recognition unavailable
- service interruption

Gracefully.

Provide an appropriate voice response when possible.

Never crash.

============================================================
PART 16 — PRIVACY AND SECURITY
============================================================

Voice control must NOT weaken security.

Do not expose:

- passwords
- authentication tokens
- Firebase credentials
- private user data

through logs or speech unnecessarily.

Do not allow unauthenticated access to:

- Home Address
- emergency contacts
- private profile data
- SOS data

============================================================
PART 17 — LIFECYCLE
============================================================

The implementation must correctly handle:

- Activity recreation
- configuration changes
- app backgrounding
- app foregrounding
- screen navigation
- service destruction
- speech cancellation
- resource cleanup

Do not leak:

- SpeechRecognizer
- TextToSpeech
- listeners
- coroutine scopes
- callbacks

Reuse existing lifecycle-safe architecture.

============================================================
PART 18 — BACKGROUND / WAKE WORD PREPARATION
============================================================

DO NOT implement a permanent wake-word listener in this phase.

However, design interfaces so that a future:

WakeWordEngine

can provide:

onWakeWordDetected()

which starts the existing voice-command pipeline.

The future architecture should be:

Wake Word
   ↓
Speech Recognition
   ↓
VoiceCommandParser
   ↓
VoiceCommandDispatcher

Do NOT use a permanent SpeechRecognizer loop.

============================================================
PART 19 — TOUCH FALLBACK
============================================================

Do NOT remove existing touch controls.

The user must be able to use:

Voice
OR
Touch

for the same major functionality.

Voice becomes the primary accessible path.

============================================================
PART 20 — TESTING
============================================================

Create comprehensive unit tests.

Minimum parser tests:

- Where am I
- My location
- Navigate home
- Take me home
- Go home
- Open navigation
- Stop navigation
- Next turn
- Distance to destination
- Start vision
- Stop vision
- Read text
- Scan barcode
- SOS
- Emergency
- Cancel SOS
- Open profile
- Open settings
- Battery
- Time
- Share location
- Go back
- Help
- Repeat
- Stop speaking
- Unknown command
- Case variations
- punctuation variations
- whitespace variations

Test contextual commands.

Test speech priority.

Test duplicate suppression.

Test speech cancellation.

Test command dispatch.

Test error handling.

Test that existing functionality remains intact.

============================================================
PART 21 — REGRESSION TESTS
============================================================

ALL existing tests must continue to pass.

In particular verify:

- Authentication
- Profile
- Home Address
- Firebase
- Room
- Room migration
- GPS
- LocationService
- SOS
- Emergency Contacts
- MapLibre
- GraphHopper
- Voice Assistant
- Reverse geocoding
- PIN formatting
- AI Vision
- OCR
- Barcode
- Notifications
- 16 KB compatibility

============================================================
PART 22 — BUILD VERIFICATION
============================================================

Run:

./gradlew clean assembleDebug

Then:

./gradlew testDebugUnitTest

Fix every compilation error.

Fix every test failure.

Do not hide failures.

Do not disable tests.

Do not remove existing tests just to obtain a passing result.

============================================================
PART 23 — STATIC / ARCHITECTURAL REVIEW
============================================================

Before declaring completion, inspect the final implementation and
verify:

- no duplicate voice engines
- no duplicate TTS engines
- no duplicate command parsing
- no hardcoded Home Address
- no hardcoded coordinates
- no destructive Room migration
- no security-rule weakening
- no unnecessary Firebase calls
- no uncontrolled infinite speech loop
- no uncontrolled SpeechRecognizer loop
- no memory leaks
- no lifecycle leaks
- no blocking work on the main thread

============================================================
PART 24 — FINAL REPORT
============================================================

At the end provide:

1. Architecture implemented
2. Files created
3. Files modified
4. Existing components reused
5. Voice commands supported
6. Command parser details
7. Dispatcher details
8. Speech queue details
9. Priority system
10. Duplicate suppression
11. GuidanceEvent model
12. GuidanceEngine status
13. Error handling
14. Lifecycle handling
15. Tests added
16. Total tests passed
17. Build result
18. Any remaining limitations
19. Exact manual device-test procedure

IMPORTANT:

Do NOT claim that the application is fully autonomous or fully
voice-guided yet unless the corresponding functionality has actually
been implemented and tested.

This phase establishes the BACKBONE.

STOP after completing this phase.

Do NOT automatically implement:
- wake word
- continuous AI Vision guidance
- autonomous obstacle announcements
- continuous GPS announcements

Those will be separate controlled phases built on this architecture.

============================================================
SUCCESS CRITERIA
============================================================

This phase is successful ONLY if:

1. The existing application still works.
2. Existing Voice Assistant commands still work.
3. Major BTG features can be triggered through the centralized
   voice-command system.
4. Commands are parsed reliably.
5. Commands are dispatched through a central architecture.
6. Speech is managed by a centralized priority-aware queue.
7. Duplicate speech is suppressed.
8. Critical safety messages can interrupt low-priority messages.
9. Errors do not crash the application.
10. Existing Room/Firebase/GPS/SOS/navigation functionality remains
    intact.
11. All tests pass.
12. Debug APK builds successfully.

DO NOT optimize for "number of files changed".

Optimize for:
CORRECTNESS
SAFETY
ACCESSIBILITY
RELIABILITY
MAINTAINABILITY
TESTABILITY
BACKWARD COMPATIBILITY