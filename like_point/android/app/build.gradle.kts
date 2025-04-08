import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

// โหลด keystore (ยังไม่ใช้ก็ไม่มีปัญหา)
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.example.like_point"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "29.0.13113456"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.like_point"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // ✅ Firebase BoM (ควบคุมเวอร์ชันของ Firebase libraries ให้อัตโนมัติ)
    implementation(platform("com.google.firebase:firebase-bom:33.11.0"))

    // ✅ Firebase modules ที่ใช้
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.firebase:firebase-auth")    
    implementation("com.google.firebase:firebase-firestore")
}
