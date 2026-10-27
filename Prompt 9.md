PROMPT 7C — BTG VOICE GUIDANCE, NAVIGATION, AI VISION & SAFETY
===============================================================

OBJECTIVE

Build the proactive voice-guidance layer on top of the working
global voice-control architecture from Prompt 7A and 7B.

The purpose is to make BTG actively assist a blind user through speech.

Do not create a second TTS system.

Use the existing:

VoiceGuidanceEngine
GuidanceEvent
SpeechQueueManager
SpeechPriority
TextToSpeechManager

==================================================
1. NAVIGATION GUIDANCE
==================================================

When the user says:

"Navigate home"

BTG must:

1. Load saved Home Address.
2. Geocode it.
3. Obtain current GPS.
4. Calculate route.
5. Start navigation.
6. Begin voice guidance.

Speak useful instructions:

"Navigation to your home has started."

"Walk straight for 100 meters."

"Turn left in 20 meters."

"Turn right now."

"Route recalculated."

"You have arrived at your destination."

The map must not be required for basic navigation.

==================================================
2. NAVIGATION COMMANDS
==================================================

While navigation is active:

"Stop navigation"
"Pause navigation"
"Resume navigation"
"Repeat navigation"
"What is the next turn?"
"How far is the destination?"
"What is my route status?"

All must work without touching the screen.

==================================================
3. GPS GUIDANCE
==================================================

Use existing GPS/location architecture.

Do not continuously speak coordinates.

Only announce useful changes:

- turn
- route deviation
- destination approaching
- arrival
- GPS unavailable

==================================================
4. AI VISION
==================================================

User:

"Start AI vision"

→ AI Vision starts.

User:

"Read text"

→ OCR.

User:

"Scan barcode"

→ Barcode.

User:

"Stop AI vision"

→ stop.

Do not require Voice Assistant screen.

==================================================
5. PROACTIVE AI VISION GUIDANCE
==================================================

Use GuidanceEvent and SpeechQueueManager.

Do NOT announce every detected object repeatedly.

Example:

Person detected:

"Person ahead."

Do not repeat 20 times.

Use:

- confidence threshold
- cooldown
- distance/risk change

Only repeat when meaningful.

==================================================
6. SAFETY EVENTS
==================================================

CRITICAL:

SOS
Emergency
Immediate danger

HIGH:

Obstacle
Navigation hazard
Route danger

NORMAL:

Location
Battery
Time

LOW:

General information

Critical events must interrupt lower-priority speech.

==================================================
7. SOS
==================================================

Use the existing SafetyService.

Do not duplicate SOS logic.

Voice commands:

"Emergency"
"SOS"
"Activate SOS"
"Cancel SOS"
"Emergency status"

Preserve existing countdown and safety behavior.

==================================================
8. LOCATION
==================================================

Preserve:

ReverseGeocodingService
GeocodedAddress

"Where am I?"

must speak:

area
city/district
state
PIN digit-by-digit

Example:

"You are near Samayapuram, Tiruchirappalli, Tamil Nadu.
Your PIN code is 6 2 1 1 1 2."

==================================================
9. SPEECH QUEUE
==================================================

Use:

CRITICAL
HIGH
NORMAL
LOW

Never overlap TTS.

Critical messages preempt lower priority.

Duplicate announcements must be suppressed.

==================================================
10. TESTING
==================================================

Create tests for:

- navigation guidance
- next turn
- distance
- arrival
- route deviation
- GPS failure
- AI Vision announcements
- duplicate suppression
- speech priority
- SOS priority
- location speech
- PIN formatting

Run:

./gradlew clean assembleDebug testDebugUnitTest

==================================================
11. PHYSICAL TEST
==================================================

On Nothing A059:

Long-press Power.

Do not touch the screen.

Say:

"Navigate home."

Verify spoken navigation.

Then:

"What is the next turn?"

Then:

"How far is the destination?"

Then:

"Stop navigation."

Test:

"Start AI vision."

Then:

"Read text."

Then:

"Stop AI vision."

Test:

"Where am I?"

Verify human-readable location and digit-by-digit PIN.

==================================================
SUCCESS CONDITION
==================================================

BTG must actively guide the blind user through speech while preserving
the global voice-command architecture.

STOP AFTER PROMPT 7C.