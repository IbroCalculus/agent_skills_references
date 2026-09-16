# Serverpod Reference & CLI Cheatsheet

## Setup Commands

```bash
# 1. Install Serverpod CLI globally
dart pub global activate serverpod_cli

# 2. Create a new full-stack project (generates server, client, and flutter app)
serverpod create my_app

# 3. Start local Postgres & Redis using Docker
cd my_app_server
docker compose up --build --detach

# 4. Generate models and client SDK after changing .spy.yaml or endpoints
serverpod generate

# 5. Run database migrations
serverpod create-migration
dart bin/main.dart --apply-migrations

# 6. Start server
dart bin/main.dart
```

---

## Endpoint Rules

- Method parameters must be primitive types or classes defined in `.spy.yaml`.
- Always return a typed `Future<T>` or `Stream<T>` for WebSocket streaming.
- Check authentication via `await session.authenticated`.
