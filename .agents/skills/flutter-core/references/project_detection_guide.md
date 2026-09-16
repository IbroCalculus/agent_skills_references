# Existing Project Convention Detection Matrix

When opening any Flutter project, inspect `pubspec.yaml` and `lib/` to automatically detect established patterns:

## 1. State Management Detection

| Found in `pubspec.yaml` | Established Pattern | How to Code New Features |
| :--- | :--- | :--- |
| `flutter_bloc` or `bloc` | **BLoC / Cubit** | Create `*_bloc.dart` or `*_cubit.dart` with state/event classes. Use `BlocBuilder`, `BlocListener`, `BlocProvider`. |
| `flutter_riverpod` or `riverpod` | **Riverpod** | Create `Notifier` or `AsyncNotifier`. Use `ConsumerWidget`, `ref.watch`, `ref.read`. |
| `provider` | **Provider / ChangeNotifier**| Create `ChangeNotifier`. Use `ChangeNotifierProvider`, `Consumer<T>`, `context.watch<T>()`. |
| `get` or `get_state_manager` | **GetX** | Create `GetxController`. Use `Obx(() => ...)` or `GetBuilder`. |
| `mobx` or `flutter_mobx` | **MobX** | Create `@observable` stores with `Observer(builder: ...)`. |
| *(None of the above)* | **Vanilla Flutter** | Use `StatefulWidget` with `setState()` or `ValueNotifier<T>`. |

---

## 2. Navigation Routing Detection

| Found in `pubspec.yaml` | Established Routing Pattern |
| :--- | :--- |
| `go_router` | Use `GoRouter` declarative paths and `context.go(...)` / `context.push(...)`. |
| `auto_route` | Use `@RoutePage()` annotations and `context.router.push(...)`. |
| *(None of the above)* | Use standard imperative `Navigator.of(context).push(MaterialPageRoute(...))`. |

---

## 3. Architecture Structure Detection

| Directory Structure in `lib/` | Architecture Type | Action |
| :--- | :--- | :--- |
| `lib/features/<feature>/presentation/...` | **Feature-First Clean** | Add new features under `lib/features/<name>/` with domain/data/presentation layers. |
| `lib/features/<feature>/...` (flat) | **Feature-First Simple** | Add new features under `lib/features/<name>/`. |
| `lib/screens/`, `lib/models/`, `lib/services/` | **Layer-Based** | Place new screens under `lib/screens/`, models under `lib/models/`, etc. |
