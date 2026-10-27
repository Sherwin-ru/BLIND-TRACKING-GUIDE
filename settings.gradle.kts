pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
        maven { url = java.net.URI("https://tiles.maplibre.org/repository/releases/") }
        maven { url = java.net.URI("https://jitpack.io") }
    }
}

rootProject.name = "Blind Tracking Guide"
include(":app")
