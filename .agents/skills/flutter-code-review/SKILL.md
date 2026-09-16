---
name: flutter-code-review
description: Review Flutter code for correctness, architecture, state management, performance, security, maintainability, and test coverage.
---

# Flutter Code Review

## Purpose

Review Flutter code systematically and identify:

- correctness issues
- architectural problems
- state-management problems
- UI/business-logic coupling
- asynchronous programming issues
- performance problems
- security issues
- testing gaps
- maintainability problems

## Initial Investigation

Before making recommendations:

1. Inspect the project structure.
2. Read `pubspec.yaml`.
3. Identify the state-management solution.
4. Identify the architecture being used.
5. Identify the relevant feature.
6. Inspect related models, repositories, providers,
   controllers, and widgets.
7. Inspect existing tests.

## Architecture Review

Check whether responsibilities are appropriately separated.

Look for:

- business logic inside widgets
- API calls directly inside UI code
- database operations inside widgets
- duplicated business logic
- inappropriate dependencies between layers
- unnecessarily large files
- unclear ownership of state

Prefer the architecture already established by the project.

Do not introduce a new architecture merely because it is
different from your preferred architecture.

## State Management

When Riverpod is used:

- Check provider responsibilities.
- Check whether providers are appropriately scoped.
- Check loading states.
- Check error states.
- Check unnecessary rebuilds.
- Check whether business logic is unnecessarily placed
  inside widgets.
- Check for duplicated state.

## Async Code

Check:

- unnecessary sequential awaits
- missing error handling
- unhandled Futures
- race conditions
- operations occurring after widget disposal
- inappropriate loading-state management
- unnecessary repeated network requests

## Security

Check for:

- hardcoded secrets
- exposed API keys
- insecure token storage
- sensitive information in logs
- unsafe URL handling
- inappropriate trust of client-side data
- insecure authentication flows

## Testing

Check whether important behavior is tested.

Consider:

- unit tests
- provider tests
- repository tests
- widget tests
- integration tests

Identify important untested behavior.

Do not demand tests for trivial code merely to increase
test-count metrics.

## Reporting

For each finding, provide:

1. Severity
2. Location
3. Problem
4. Why it matters
5. Recommended fix

Use these severity levels:

- Critical
- High
- Medium
- Low
- Informational
