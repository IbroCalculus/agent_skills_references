---
name: flutter-core
description: General Flutter application development, project setup, lifecycle management, CLI commands, asset/dependency configuration, and adaptive convention detection (BLoC, Riverpod, Provider, GetX).
---

# Flutter Core (General Development & Adaptive Conventions)

## Purpose

Serve as the foundational skill for general Flutter application development. Covers app lifecycle management, Flutter CLI commands (`run`, `build`, `test`, `doctor`), asset and font registration, theme setup, and **adaptive convention detection** so that existing projects are never forcefully restructured.

---

## Supporting Resources in this Skill

- **Convention Detection Matrix**: [`references/project_detection_guide.md`](./references/project_detection_guide.md)
- **Standard App Entrypoint**: [`examples/main_scaffold.dart`](./examples/main_scaffold.dart)
- **Production `pubspec.yaml` Template**: [`templates/pubspec_config.yaml.tpl`](./templates/pubspec_config.yaml.tpl)

---

## The Golden Rule of Project Adaptation

> **Always adapt to the existing codebase. Never impose a foreign state management solution, folder structure, or routing pattern unless the developer explicitly asks for a migration.**

### Pre-Flight Investigation Workflow:
1. **Read `pubspec.yaml`**:
   - Check `dependencies` to identify:
     - **State Management**: `flutter_bloc` / `bloc` $\rightarrow$ use BLoC/Cubit; `flutter_riverpod` $\rightarrow$ use Riverpod; `provider` $\rightarrow$ use Provider; `get` $\rightarrow$ use GetX.
     - **Navigation**: `go_router`, `auto_route`, or standard imperative `Navigator`.
     - **Network**: `dio` vs `http`.
     - **Local DB**: `hive`, `sqflite`, `isar`, or `shared_preferences`.
2. **Inspect Existing Folder Layout in `lib/`**:
   - If Layer-Based (`screens/`, `models/`, `services/`), place new screens in `screens/`.
   - If Feature-First (`features/<feature>/...`), place new code within that feature's structure.
3. **Mirror Code Idioms**:
   - Follow the naming, error handling, and component separation conventions already present.

---

## Common Flutter CLI Workflows

```bash
# Analyze code for warnings and lints
flutter analyze

# Automatically apply mechanical fixes
dart fix --apply

# Clean build cache when experiencing build/dependency caching issues
flutter clean && flutter pub get

# Run application on connected device/emulator
flutter run

# Build release APK or App Bundle
flutter build apk --release
flutter build appbundle --release
```

---

## Asset & Font Registration in `pubspec.yaml`

Always register asset directories and custom Google/local fonts properly:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/icons/
    - assets/json/
```
