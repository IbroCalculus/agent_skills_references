---
name: flutter-feature-architect
description: Scaffold and organize Flutter projects and features using Feature-First Clean Architecture, Layer-Based Architecture, or Feature-First modular patterns.
---

# Flutter Feature Architect

## Purpose

Enforce clean project organization and architectural boundaries in Flutter applications based on proven folder structuring patterns.

---

## Supporting Resources in this Skill

- **CLI Automation Script**: [`scripts/scaffold_feature.dart`](./scripts/scaffold_feature.dart)
  - Run with: `dart run .agents/skills/flutter-feature-architect/scripts/scaffold_feature.dart <feature_name> --type=<clean|feature|layer>`
- **Architecture Guide**: [`references/architecture_guide.md`](./references/architecture_guide.md)
  - Detailed design decision matrix and layer responsibilities.
- **Concrete Example**: [`examples/auth_feature/domain/auth_domain.dart`](./examples/auth_feature/domain/auth_domain.dart)
  - Reference implementation of domain model and contract.

---

## The Guiding Principle

> **"A folder is not for files that look alike. It is for files that serve the same purpose."**

- `login_screen.dart`, `login_controller.dart`, `login_repository.dart`, and `login_api.dart` look different, but they all belong to the **authentication feature**.
- `home_screen.dart`, `profile_screen.dart`, and `settings_screen.dart` are different screens, but they all share the responsibility of **presenting UI**.
- A folder structure is a deliberate design decision tailored to project scope, team size, and complexity.

### Non-Destructive Adaptation Rule:
- **Inspect first**: Check the existing directory tree in `lib/` and existing packages in `pubspec.yaml`.
- **Match existing patterns**: If an existing project uses a Layer-Based architecture (`screens/`, `models/`, `services/`), place new code in those layers. Do NOT forcefully restructure an existing codebase to Clean Architecture or Feature-First unless the developer explicitly asks for a migration.
- **Respect state management**: Use the state management pattern already present in the codebase (BLoC, Provider, Riverpod, GetX).

---

## 3 Supported Architecture Patterns

### 1. Feature-First + Clean Architecture (Recommended for Scalable & Enterprise Apps)

Combines modular feature isolation with Clean Architecture layers (`domain`, `data`, `presentation`).

```
lib/
├── core/
│   ├── constants/            # App-wide strings, assets, layout constants
│   ├── errors/               # Failure classes, Exceptions, Error handlers
│   ├── network/              # HTTP clients, interceptors, connectivity check
│   ├── services/             # Cross-cutting services (analytics, logging)
│   ├── theme/                # Color schemes, typography, app themes
│   └── utils/                # Formatters, extensions, helpers
├── features/
│   └── [feature_name]/
│       ├── data/
│       │   ├── datasources/  # Remote APIs, local DBs, Secure Storage
│       │   ├── models/       # DTOs, JSON serialization (fromJson/toJson)
│       │   └── repositories/ # Concrete implementations of domain interfaces
│       ├── domain/
│       │   ├── models/       # Pure business entities (immutable)
│       │   └── repositories/ # Abstract repository contracts
│       └── presentation/
│           ├── controllers/  # Riverpod Notifiers, BLoCs, or Cubits
│           ├── screens/      # Full-page route widgets
│           └── widgets/      # Feature-specific subcomponents
└── main.dart
```

### 2. Feature-First Architecture (For Medium Modular Apps)

Groups all components of a feature together without separating pure domain and data abstractions into sub-layers.

```
lib/
├── core/
├── features/
│   ├── auth/
│   │   ├── auth_screen.dart
│   │   ├── auth_controller.dart
│   │   ├── auth_service.dart
│   │   ├── auth_model.dart
│   │   └── widgets/
│   └── profile/
└── main.dart
```

### 3. Layer-Based Architecture (For Smaller Utility Apps & Prototypes)

Organizes code strictly by technical responsibility.

```
lib/
├── models/
├── providers/ / controllers/
├── screens/
├── services/
├── widgets/
└── main.dart
```

---

## Layer Responsibilities & Rules

### 1. Presentation Layer (`presentation/`)
- **Screens**: Full view widgets loaded by navigation routes. Contain scaffold, app bar, and assemble smaller widgets.
- **Widgets**: Reusable, small components. Kept stateless wherever possible.
- **Controllers / Notifiers**: Own UI state. React to user intents and invoke domain repositories.
- **Rule**: NEVER call HTTP clients, database operations, or raw SDKs inside widgets.

### 2. Domain Layer (`domain/`)
- **Entities / Models**: Pure Dart classes representing business concepts. Independent of external libraries (no Flutter UI imports).
- **Repositories (Interface)**: Abstract contracts defining what operations can be performed (e.g., `abstract class AuthRepository { Future<User> login(...); }`).
- **Rule**: The domain layer has ZERO dependencies on outer layers (UI, network libraries, databases).

### 3. Data Layer (`data/`)
- **DataSources**: Direct communication with external endpoints:
  - `RemoteDataSource`: REST APIs (`http`/`dio`), GraphQL, Firebase.
  - `LocalDataSource`: `flutter_secure_storage`, `hive`, `sqflite`, `shared_preferences`.
- **Models**: Data Transfer Objects (DTOs) with serialization (`fromJson`/`toJson`). Inherit from or map to Domain Entities.
- **Repository Implementations**: Implement domain contracts, coordinate between local and remote sources, and handle caching strategies.

---

## Golden Rules for Feature Scaffolding

1. **Uniform Naming**:
   - Files: `snake_case` (e.g., `user_profile_screen.dart`, `auth_repository.dart`).
   - Classes: `PascalCase` (e.g., `UserProfileScreen`, `AuthRepositoryImpl`).
2. **Explicit Dependency Injection**:
   - Pass dependencies via constructors or Riverpod providers. Avoid global mutable singletons.
3. **Failures Over Raw Exceptions**:
   - Convert lower-level exceptions (e.g., `SocketException`, `HttpException`) into domain `Failure` objects before surfacing to the presentation layer.
4. **Single Source of Truth**:
   - State belongs in the controller/notifier layer, not duplicated across multiple widget state fields.
