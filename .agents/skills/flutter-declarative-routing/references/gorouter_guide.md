# GoRouter Setup & Deep Linking Guide

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  go_router: ^14.0.0
```

---

## Navigation Methods Reference

| Method | Behavior | Best Used For |
| :--- | :--- | :--- |
| `context.go('/path')` | Replaces the current navigation stack completely with target route. | Top-level tab switching, redirects after login. |
| `context.push('/path')` | Pushes a new screen onto the current stack with a back button. | Detail pages, modal forms. |
| `context.pop()` | Pops the top-most route from the stack. | Back button actions, dismiss dialogs. |
| `context.goNamed('name')` | Navigates using the route's name instead of hardcoded URI string. | Type-safe parameter injection. |

---

## Deep Linking (Android & iOS)

### Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="https" android:host="yourapp.com" />
</intent-filter>
```
