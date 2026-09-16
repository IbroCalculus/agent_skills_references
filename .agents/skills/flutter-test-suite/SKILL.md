---
name: flutter-test-suite
description: Write pragmatic unit tests, Riverpod ProviderContainer tests, mockito/mocktail repository tests, and WidgetTester UI tests for Flutter apps.
---

# Flutter Test Suite

## Purpose

Guide the creation of maintainable, high-value automated tests for Flutter applications. Emphasizes testing real business logic, state transitions in Riverpod providers, failure cases in data repositories, and critical UI interactions without generating low-value fluff tests.

---

## Supporting Resources in this Skill

- **Testing Cheat Sheet**: [`references/testing_cheat_sheet.md`](./references/testing_cheat_sheet.md)
- **Riverpod Provider Test**: [`examples/provider_test_example.dart`](./examples/provider_test_example.dart)
- **Repository Mocktail Test**: [`examples/repository_test_example.dart`](./examples/repository_test_example.dart)
- **WidgetTester Component Test**: [`examples/widget_test_example.dart`](./examples/widget_test_example.dart)

---

## Testing Principles

1. **Test Meaningful Behavior, Not Implementations**:
   - Do not write trivial tests just to inflate test coverage numbers.
   - Test critical failure branches: network timeouts, 401 unauthorized, malformed JSON, empty list states.
2. **Isolate Providers using `ProviderContainer`**:
   - In Riverpod tests, never instantiate widgets just to test provider logic.
   - Use `ProviderContainer(overrides: [...])` to test `AsyncNotifier` states directly in pure unit tests.
3. **Mock Boundary Datasources**:
   - Use `mocktail` or `mockito` to mock external network/database boundaries. Keep domain entities and business rules real.
4. **Widget Testing Rules**:
   - Always pump widgets inside a `MaterialApp` and `ProviderScope`.
   - Use `tester.pumpAndSettle()` for animations, or `tester.pump(duration)` for timed delays.
