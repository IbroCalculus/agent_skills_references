---
name: dart-serverpod
description: Build scalable, full-stack Dart backends with Serverpod, featuring PostgreSQL ORM, auto-generated Flutter client SDKs, WebSocket streaming, authentication, and background tasks.
---

# Serverpod Full-Stack Backend Framework

## Purpose

Guide the architecture and implementation of full-stack Dart backends using Serverpod. Enforces type-safe client-server contracts, PostgreSQL model definitions (`.spy.yaml`), endpoint design, streaming WebSockets, caching, and task scheduling.

---

## Supporting Resources in this Skill

- **Quick Reference & Workflow**: [`references/serverpod_cheatsheet.md`](./references/serverpod_cheatsheet.md)
- **Sample Endpoint Implementation**: [`examples/endpoint_example.dart`](./examples/endpoint_example.dart)
- **Model Definition Template**: [`templates/model_definition.spy.yaml.tpl`](./templates/model_definition.spy.yaml.tpl)

---

## Architecture Flow

```
Flutter Client App
      │ (Type-Safe Client SDK: client.user.getProfile(id))
      ▼ (HTTP / WebSockets)
Serverpod Server (Dart)
      ├── Endpoints (Business Logic)
      ├── Serializers / Models (.spy.yaml)
      ├── Background Future Calls
      └── Redis Cache
      │
      ▼ (PostgreSQL ORM)
PostgreSQL Database
```

---

## Core Serverpod Rules

1. **Model First Design (`.spy.yaml`)**:
   - Define database tables and serializable classes in `lib/src/models/*.spy.yaml`.
   - Run `serverpod generate` to automatically create ORM code on the server and client models in the client package.
2. **Endpoints Inherit from `Endpoint`**:
   - Place endpoints in `lib/src/endpoints/*_endpoint.dart`.
   - All public methods in an Endpoint class are automatically exposed to the client SDK with type safety.
   - The first argument of every endpoint method MUST be `Session session`.
3. **Database Operations via Session**:
   - Never write raw SQL strings unless unavoidable. Use the generated ORM:
     ```dart
     final user = await User.db.findById(session, userId);
     await User.db.insertRow(session, newUser);
     ```
4. **Scheduled & Background Tasks via Future Calls**:
   - Inherit from `FutureCall` for async jobs (e.g. sending emails, cleaning expired sessions).
   - Trigger with `session.serverpod.futureCallWithDelay('myCall', data, delay)`.
