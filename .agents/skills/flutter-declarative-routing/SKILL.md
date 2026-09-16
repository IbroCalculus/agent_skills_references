---
name: flutter-declarative-routing
description: Implement declarative navigation and deep linking in Flutter using GoRouter, featuring typed route definitions, sub-routes, auth redirect guards, and StatefulShellRoute bottom bars.
---

# Flutter Declarative Routing (GoRouter)

## Purpose

Standardize navigation and URL handling in Flutter applications using `go_router`. Enforces deep link readiness, redirect protection (auth guards), shell-based persistent navigation bars, and query/path parameter decoding.

---

## Supporting Resources in this Skill

- **GoRouter Configuration Guide**: [`references/gorouter_guide.md`](./references/gorouter_guide.md)
- **Complete Router Implementation**: [`examples/app_router_example.dart`](./examples/app_router_example.dart)
- **Route Definition Template**: [`templates/route_definition.dart.tpl`](./templates/route_definition.dart.tpl)

---

## Core Routing Rules

1. **Named Route Constants**:
   - Never use raw route strings scattered across UI widgets (`context.go('/profile')`). Always define a typed `AppRoutes` class containing names and path constants.
2. **Sub-Routes for Hierarchical Navigation**:
   - Place child screens inside `routes: [...]` of the parent `GoRoute` when they logically belong under a parent stack (e.g. `/products/:id`).
3. **Redirect Logic (Auth Guards)**:
   - Perform redirect checks centrally in `redirect: (context, state)` of `GoRouter`.
   - Pass a `Listenable` (like a Riverpod auth notifier or ChangeNotifier) into `refreshListenable:` so routes re-evaluate automatically upon login/logout.
4. **StatefulShellRoute for Bottom Navigation**:
   - Use `StatefulShellRoute.indexedStack` when tabs must preserve scroll position and internal state when switching.
5. **Parameter Safety**:
   - Extract path parameters via `state.pathParameters['id']` and query parameters via `state.uri.queryParameters['filter']`.
