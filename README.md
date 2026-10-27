# Blind Tracking Guide (BTG) - Developer & Setup Manual

The **Blind Tracking Guide** is a modern, highly accessible Android application designed for visually impaired users. It features real-time voice guidance, offline artificial intelligence vision, turn-by-turn pedestrian GPS navigation, emergency SOS broadcasts, geofencing, and cloud caregiver synchronization.

---

## 🛠️ Technology Stack
*   **Language**: Kotlin (Android Studio)
*   **Architecture**: MVVM, Clean Architecture, Repository Pattern, Hilt Dependency Injection.
*   **UI Framework**: Jetpack Compose, Material 3, Premium Liquid Glass UI.
*   **Local Database**: SQLite Room DB.
*   **Cloud Backend**: Supabase PostgreSQL + Realtime channels.
*   **Offline speech engines**: Vosk Voice Recognition (Offline STT) and Piper TTS (Offline Speech Synthesis).
*   **AI Vision Core**: TensorFlow Lite Object Detection, Google ML Kit Face/Barcode/Text-OCR Scanners, and OpenCV helpers.
*   **Pedestrian Maps**: OpenStreetMap (OSM) rendering via MapLibre Native SDK, combined with GraphHopper walking routing.

---

## 📂 Codebase Directory Layout

```
app/src/main/java/com/blindtracking/guide/
├── BtgApp.kt                       <- Dagger-Hilt application declaration.
├── MainActivity.kt                 <- Single activity router launcher.
├── data/
│   ├── local/                      <- Room Entities, DAOs, and AppDatabase.
│   ├── remote/                     <- Supabase authentication, location sync, and APIs.
│   ├── routing/                    <- GraphHopper walking directions networks.
│   └── repository/                 <- Location, settings, routing, and vision storage interfaces.
├── domain/
│   ├── models/                     <- Domain entity representations.
│   └── repository/                 <- Abstraction boundaries.
├── di/
│   └── DatabaseModule.kt / NetworkModule.kt / RepositoryModule.kt <- Dagger-Hilt dependency modules.
├── services/
│   ├── foreground/                 <- Foreground location safety updates.
│   ├── geofence/                   <- Geofence entry and departure triggers.
│   ├── navigation/                 <- Step-by-step turn guidance managers.
│   ├── voice/                      <- Vosk command interpreter.
│   ├── health/                     <- Step count speeds and fall indicators.
│   └── backup/                     <- Local settings backup exporters.
├── ui/
│   ├── theme/                      <- Color schemes and Liquid Glass modifiers.
│   ├── screens/                    <- HomeScreen, LoginScreen, SettingsScreen.
│   ├── navigation/                 <- MapNavigationScreen, NearbyPlacesScreen.
│   ├── camera/                     <- AiCameraScreen, DetectionHistoryScreen.
│   ├── emergency/                  <- SosScreen, SafetyViewModel.
│   └── history/                    <- TimelineScreen, RouteHistoryScreen.
```

---

## 🚀 Installation & Build Instructions

1. **Prerequisites**: Android Studio Jellyfish (or newer) with SDK 34 support.
2. **Offline Vosk speech model setup**:
   * Download the Vosk english model (`model-en-us-0.15` or light version).
   * Place the model directories inside `app/src/main/assets/model/` prior to building.
3. **Compilation**:
   * Open the project in Android Studio.
   * Run the build Gradle task:
     ```bash
     ./gradlew assembleDebug
     ```
   * Deploy the debug APK to target emulators or physical test devices.
