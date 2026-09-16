# Native Permissions & Manifest Configuration

## Android Configuration (`android/app/src/main/AndroidManifest.xml`)

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- Biometrics -->
    <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
    
    <!-- Notifications (Android 13+) -->
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
    
    <!-- Internet & Network -->
    <uses-permission android:name="android.permission.INTERNET"/>
</manifest>
```

## iOS Configuration (`ios/Runner/Info.plist`)

```xml
<!-- Biometrics description -->
<key>NSFaceIDUsageDescription</key>
<string>Authenticate securely using Face ID to access your account</string>

<!-- Notifications -->
<key>UIBackgroundModes</key>
<array>
    <string>fetch</string>
    <string>remote-notification</string>
</array>
```
