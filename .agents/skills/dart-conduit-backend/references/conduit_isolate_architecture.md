# Conduit Multi-Isolate Concurrency Guide

## Architecture

```
Incoming TCP Traffic (Port 8888)
               │
               ▼ (OS Load Balances across listener sockets)
  ┌────────────────────────┬────────────────────────┐
  │                        │                        │
  ▼                        ▼                        ▼
[Isolate 1]              [Isolate 2]              [Isolate 3]
ApplicationChannel       ApplicationChannel       ApplicationChannel
  ├─ Router                ├─ Router                ├─ Router
  ├─ Controllers           ├─ Controllers           ├─ Controllers
  └─ DB Context            └─ DB Context            └─ DB Context
```

---

## CLI Commands

```bash
# 1. Install Conduit CLI globally
dart pub global activate conduit

# 2. Create new Conduit project
conduit create my_conduit_api

# 3. Run database migrations
conduit db generate
conduit db upgrade

# 4. Start server across all available CPU isolates
conduit serve -n 4
```
