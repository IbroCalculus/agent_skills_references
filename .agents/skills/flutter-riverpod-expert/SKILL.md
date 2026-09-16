---
name: flutter-riverpod-expert
description: Implement state management using modern Riverpod (Notifier, AsyncNotifier, FutureProvider, StreamProvider), enforce proper provider scoping, handle AsyncValue states (loading/error/data), and avoid unnecessary rebuilds.
---

# Flutter Riverpod Expert

## Purpose

Provide production-grade state management implementations using Riverpod. Enforces the modern `Notifier` and `AsyncNotifier` paradigms, robust `AsyncValue` state handling, minimal widget rebuilds, and clean UI/state separation.

---

## Supporting Resources in this Skill

- **Best Practices & Anti-Patterns**: [`references/riverpod_best_practices.md`](./references/riverpod_best_practices.md)
- **AsyncNotifier Implementation**: [`examples/async_notifier_example.dart`](./examples/async_notifier_example.dart)
- **Provider Scoping & Families**: [`examples/provider_scoping_example.dart`](./examples/provider_scoping_example.dart)
- **Controller Boilerplate**: [`templates/notifier_controller.dart.tpl`](./templates/notifier_controller.dart.tpl)

---

## When to Use (Non-Destructive Constraint)

- **Trigger when**: `flutter_riverpod` is already installed in `pubspec.yaml`, or when creating a new project that specifies Riverpod, or when the user explicitly requests Riverpod.
- **Do NOT use when**: The project already uses another state management solution (`flutter_bloc`, `provider`, `get`, `mobx`). In those cases, adhere to the project's existing state management unless the developer explicitly asks to migrate.

---

## Core Riverpod Rules

1. **Prefer `AsyncNotifier` for Asynchronous Operations**:
   - For any state involving network, database, or async tasks, use `AsyncNotifier<T>` rather than manual booleans (`isLoading`) and `try/catch` strings.
2. **`ref.watch` vs `ref.read`**:
   - In widget `build()`: ALWAYS use `ref.watch(myProvider)` or `ref.watch(myProvider.select(...))` so the UI responds to changes.
   - Inside button callbacks / event handlers (`onPressed`): ALWAYS use `ref.read(myProvider.notifier).doAction()`. NEVER use `ref.watch` inside callbacks.
3. **Handle All Three `AsyncValue` Branches**:
   - In presentation widgets, use `.when()`:
     ```dart
     final asyncState = ref.watch(itemsProvider);
     return asyncState.when(
       data: (items) => ListView.builder(...),
       loading: () => const Center(child: CircularProgressIndicator()),
       error: (error, stack) => Center(child: Text('Error: $error')),
     );
     ```
4. **Use `.select()` to Prevent Unnecessary Rebuilds**:
   - If a widget only cares about a single field of a large state model, use `ref.watch(userProvider.select((state) => state.userName))`.
5. **No Business Logic in Widgets**:
   - Widgets only read state and trigger notifier methods. Validation, network calls, and data mapping belong inside the notifier or repositories.
