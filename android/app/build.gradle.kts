plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // ✅ add this
}

android {
    namespace = "com.example.flutter_login1"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973" // ✅ update NDK version

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

        defaultConfig {
        applicationId = "com.example.flutter_login1"
        minSdk = 23 // ✅ Kotlin DSL uses `minSdk`, not minSdkVersion
        targetSdk = 33 // or flutter.targetSdkVersion if it's defined
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }


    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}


flutter {
    source = "../.."
}

