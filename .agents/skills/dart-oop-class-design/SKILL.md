---
name: dart-oop-class-design
description: Design clean, type-safe Dart 3 domain models, algebraic data types, and library boundaries using class modifiers (sealed, base, final, interface, mixin), records, and exhaustive pattern matching.
---

# Dart OOP Class Design & Modifiers

## Purpose

Guide the idiomatic use of Dart 3 object-oriented design and class modifiers. Enforces proper domain modeling, algebraic data types (ADTs), exhaustiveness checking, and strict library boundary encapsulation.

---

## Supporting Resources in this Skill

- **Modifier Reference Matrix**: [`references/class_modifiers_matrix.md`](./references/class_modifiers_matrix.md)
- **Sealed Result / State Hierarchy**: [`examples/result_sealed_hierarchy.dart`](./examples/result_sealed_hierarchy.dart)
- **Records & Pattern Matching**: [`examples/records_and_patterns.dart`](./examples/records_and_patterns.dart)

---

## Class Modifier Rules (Dart 3+)

### 1. `sealed class` (Algebraic Data Types & Exhaustiveness)
- **Use when**: You have a known, closed set of subtypes (e.g., UI states, domain results, network events).
- **Behavior**: Cannot be extended, implemented, or mixed in outside the current library. Enables exhaustive switch statements without a `default:` fallback.

```dart
sealed class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthAuthenticated extends AuthState {
  final String userId;
  AuthAuthenticated(this.userId);
}
class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

// Exhaustive switch expression
String describe(AuthState state) => switch (state) {
  AuthInitial() => 'Initial',
  AuthLoading() => 'Loading...',
  AuthAuthenticated(:final userId) => 'User: $userId',
  AuthFailure(:final error) => 'Failed: $error',
};
```

### 2. `interface class` (Pure Implementation Contract)
- **Use when**: You want consumers to implement the interface, but forbid inheritance/extension (`extends`).
- **Behavior**: Can be implemented outside the library, but cannot be extended.

### 3. `base class` (Enforce Subclass Contract via `extends`)
- **Use when**: You provide a template method or stateful foundation that consumers MUST extend, but cannot implement as a raw mock interface.

### 4. `final class` (Close the Hierarchy)
- **Use when**: A class is complete, immutable, or security-sensitive and must NEVER be extended or implemented outside the library.

### 5. `mixin class`
- **Use when**: A class needs to serve both as a standard class and as a reusable `mixin` via `with`.

---

## Modern Dart 3 Records & Patterns

Use records instead of creating throwaway tuple/pair classes:

```dart
// Multi-value return using Record
(int statusCode, String body) fetchPayload() {
  return (200, '{"ok": true}');
}

// Destructuring pattern
final (code, message) = fetchPayload();
```
