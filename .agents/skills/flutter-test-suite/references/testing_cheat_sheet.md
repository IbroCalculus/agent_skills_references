# Flutter Testing Cheat Sheet

## Test Commands

```bash
# Run all unit and widget tests
flutter test

# Run tests with code coverage output
flutter test --coverage

# Run a specific test file
flutter test test/features/auth/auth_provider_test.dart
```

---

## Test Types & Priorities

| Priority | Test Type | Target Layer | Tooling |
| :--- | :--- | :--- | :--- |
| **High** | Unit Test | Domain logic, State Notifiers | `test`, `flutter_riverpod`, `mocktail` |
| **High** | Repository Test | Data transformation, Error mapping | `mocktail`, `http/testing` |
| **Medium** | Widget Test | User interaction, error UI display | `flutter_test`, `WidgetTester` |
| **Selective** | Integration Test | End-to-end critical user journeys | `integration_test` |
