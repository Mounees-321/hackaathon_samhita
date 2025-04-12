plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.chaquo.python") version "14.0.2"
}

android {
    namespace = "com.example.posturx"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.example.posturx"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }
}

chaquopy {
    python {
        version = "3.8" // Or use "3.10" if you prefer

        // Optional: Local Python for building wheels
        // buildPython = "/usr/bin/python3"

        pip {
            install("opencv-python")
            install("mediapipe")
        }
    }
}
