# Respect Existing Project Conventions

You must adhere to the following non-destructive rules on all Flutter and Dart tasks:

## 1. Inspect Before Prescribing
Before writing, modifying, or refactoring code:
1. Check `pubspec.yaml` to detect existing dependencies and libraries.
2. Inspect the current directory layout (`lib/`) to identify the established architecture.
3. Identify the state management library already in use (e.g., BLoC, Cubit, Riverpod, Provider, GetX, MobX, or vanilla `setState`/`ValueNotifier`).

## 2. Never Force Architectural Migrations
- **Do NOT** replace or rewrite an existing state management solution with another (e.g., do not replace BLoC with Riverpod, or Provider with BLoC) unless the developer **explicitly** requests a migration.
- If a project uses `flutter_bloc`, write new features using BLoC or Cubit.
- If a project uses `provider`, write new features using ChangeNotifier or Provider.
- If a project uses `get`, write new features using GetX controllers.
- If a project uses `flutter_riverpod`, write new features using Riverpod Notifiers.

## 3. Honor Established Folder Structure
- If the project uses a Layer-Based structure (`screens/`, `widgets/`, `models/`, `services/`), place new files in those existing layers.
- If the project uses Feature-First (`features/<feature_name>/...`), follow that established feature grouping.
- Do not introduce new top-level directories that contradict the existing repository pattern.

## 4. Match Idioms and Code Style
- Match the existing project's error handling style (e.g., `Result`/`Either`, custom `Failure` classes, or standard Exceptions).
- Match the existing routing solution (`go_router`, `auto_route`, or standard `Navigator.push`).
- Preserve existing linting and naming conventions.
