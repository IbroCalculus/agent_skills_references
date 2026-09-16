---
name: dart-conduit-backend
description: Build high-throughput, multi-isolate HTTP backends with Conduit (formerly Aqueduct), featuring parallel isolate pipelines, built-in ORM for PostgreSQL, and OAuth 2.0.
---

# Conduit High-Throughput Server Framework

## Purpose

Guide the development of enterprise-grade, multi-core HTTP web applications using Conduit. Covers multi-isolate execution channels (`ApplicationChannel`), PostgreSQL object-relational mapping (`ManagedObject`), OAuth 2.0 authentication, and OpenAPI contract generation.

---

## Supporting Resources in this Skill

- **Isolate Architecture Guide**: [`references/conduit_isolate_architecture.md`](./references/conduit_isolate_architecture.md)
- **Controller Implementation**: [`examples/conduit_controller_example.dart`](./examples/conduit_controller_example.dart)
- **Application Channel Template**: [`templates/conduit_channel.dart.tpl`](./templates/conduit_channel.dart.tpl)

---

## Core Conduit Architecture

1. **Multi-Isolate Concurrency**:
   - Conduit spawns an independent Dart isolate per CPU core. Each isolate runs its own instance of `ApplicationChannel` to handle incoming HTTP requests simultaneously without thread contention.
2. **Channel Lifecycle**:
   - `prepare()`: Configures database connections, ORM contexts, and shared services.
   - `entryPoint`: Constructs the router and request controller pipeline.
3. **ManagedObject & ORM**:
   - Declare table contracts via `ManagedObject<T>` and `_T` table definitions.
   - Execute queries via `Query<T>(context)..where(...)..fetch()`.
