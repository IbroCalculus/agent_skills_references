---
name: dart-backend-api
description: Build scalable server-side REST APIs and microservices in pure Dart using Dart Frog and Shelf, featuring file-based routing, middleware, dependency injection, and standardized JSON responses.
---

# Dart Backend API (Dart Frog & Shelf)

## Purpose

Guide the architecture and development of server-side Dart applications using Dart Frog and Shelf. Enforces best practices for file-based routing, authentication/logging middleware, request-context dependency injection, and clean HTTP response modeling.

---

## Supporting Resources in this Skill

- **Quick Reference**: [`references/dart_frog_cheatsheet.md`](./references/dart_frog_cheatsheet.md)
- **Sample Route Implementation**: [`examples/todo_routes.dart`](./examples/todo_routes.dart)
- **Middleware Template**: [`templates/middleware.dart.tpl`](./templates/middleware.dart.tpl)

---

## Core Principles & Conventions

1. **Routing by Directory**:
   - In Dart Frog, filesystem structure mirrors URL paths.
   - `routes/index.dart` $\rightarrow$ `/`
   - `routes/api/users/index.dart` $\rightarrow$ `/api/users`
   - `routes/api/users/[id].dart` $\rightarrow$ `/api/users/:id` (dynamic route parameter)
2. **Context-Driven Dependency Injection**:
   - Provide databases, repositories, and authentication state through middleware using `context.provide<T>(() => instance)`.
   - Read instances inside route handlers using `context.read<T>()`.
3. **Explicit HTTP Method Handling**:
   - Never handle multiple HTTP verbs loosely. Check `context.request.method` explicitly using switch statements or pattern matching.
4. **Standardized Response Envelopes**:
   - Always return typed JSON responses with correct HTTP status codes (`HttpStatus.ok`, `HttpStatus.created`, `HttpStatus.badRequest`, `HttpStatus.unauthorized`, `HttpStatus.notFound`).

---

## Project Setup

```bash
# Install Dart Frog CLI globally
dart pub global activate dart_frog_cli

# Create a new server project
dart_frog create my_api
cd my_api

# Start local development server with hot reload
dart_frog dev
```

---

## Route Handler Architecture

```dart
import 'dart:io';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  return switch (context.request.method) {
    HttpMethod.get => _handleGet(context, id),
    HttpMethod.put => _handlePut(context, id),
    HttpMethod.delete => _handleDelete(context, id),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed)),
  };
}

Future<Response> _handleGet(RequestContext context, String id) async {
  final repo = context.read<ItemRepository>();
  final item = await repo.findById(id);
  
  if (item == null) {
    return Response.json(
      statusCode: HttpStatus.notFound,
      body: {'error': 'Item not found'},
    );
  }
  
  return Response.json(body: item.toJson());
}
```

---

## Middleware & Dependency Injection

Place `_middleware.dart` in any route directory to apply middleware cascades to that subtree:

```dart
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<DatabaseService>((_) => DatabaseService()));
}
```
