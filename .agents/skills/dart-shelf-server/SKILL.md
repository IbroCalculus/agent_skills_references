---
name: dart-shelf-server
description: Build modular, low-overhead HTTP web servers and middleware pipelines in pure Dart using the foundational Shelf ecosystem (shelf, shelf_router, shelf_static).
---

# Shelf HTTP Web Server Ecosystem

## Purpose

Guide the design and implementation of lightweight, composable HTTP services using Google's foundational `package:shelf`. Covers middleware pipelines, `shelf_router` endpoint definitions, static file serving, CORS, and WebSocket handling.

---

## Supporting Resources in this Skill

- **Pipeline & Middleware Architecture**: [`references/shelf_pipeline_guide.md`](./references/shelf_pipeline_guide.md)
- **Complete Server Implementation**: [`examples/shelf_server_example.dart`](./examples/shelf_server_example.dart)
- **Custom Middleware Template**: [`templates/custom_middleware.dart.tpl`](./templates/custom_middleware.dart.tpl)

---

## Core Shelf Concepts

1. **The Pipeline (`Pipeline()`)**:
   - Shelf operates as an onion-style pipeline. Handlers process requests and return responses; Middleware intercepts requests on entry and responses on exit.
   - Example:
     ```dart
     final handler = const Pipeline()
         .addMiddleware(logRequests())
         .addMiddleware(corsMiddleware())
         .addHandler(router.call);
     ```
2. **Routing via `shelf_router`**:
   - Define verbs directly: `router.get('/health', _healthCheck)`.
   - Dynamic parameters: `router.get('/users/<id>', (Request req, String id) => ...)`.
3. **Response Headers & JSON**:
   - Explicitly specify `content-type: application/json` or use helper wrappers when returning structured payloads.
