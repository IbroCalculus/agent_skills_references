---
name: flutter-device-services
description: Integrate native mobile capabilities in Flutter including biometric authentication (local_auth), encrypted credential persistence (flutter_secure_storage), local push notifications (awesome_notifications), and platform channels.
---

# Flutter Device Services (Hardware, Auth & Native)

## Purpose

Provide secure, production-ready integrations with mobile device hardware and platform features. Covers biometric fingerprint/face authentication, encrypted credential storage, local push notifications, and runtime permissions.

---

## Supporting Resources in this Skill

- **Platform Permissions Setup**: [`references/native_permissions_setup.md`](./references/native_permissions_setup.md)
- **Biometric Auth Service**: [`examples/biometric_auth_service.dart`](./examples/biometric_auth_service.dart)
- **Encrypted Storage Service**: [`examples/secure_storage_service.dart`](./examples/secure_storage_service.dart)
- **Notification Service**: [`examples/notification_service.dart`](./examples/notification_service.dart)

---

## Device Integration Rules

1. **Never Store Secrets in SharedPreferences**:
   - Authentication tokens, API keys, and sensitive user data MUST be stored using `flutter_secure_storage` (KeyStore on Android, Keychain on iOS).
2. **Graceful Biometric Fallback**:
   - Always check `canCheckBiometrics` and `isDeviceSupported()` before triggering biometric prompts.
   - Always provide a password/PIN fallback if biometrics fail or are not enrolled.
3. **Handle Permission Denials & Permanent Denials**:
   - When requesting permissions via `permission_handler`, handle `PermissionStatus.permanentlyDenied` by prompting the user to open app settings via `openAppSettings()`.
4. **Channel Isolation**:
   - Encapsulate `MethodChannel` and native event listening inside dedicated service classes with strong typed models.
