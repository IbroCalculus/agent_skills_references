# Shelf Pipeline Architecture Guide

## Middleware Flow

```
Incoming HTTP Request
         │
         ▼
[Pipeline Middleware 1]  (e.g., Request Logging)
         │
         ▼
[Pipeline Middleware 2]  (e.g., CORS Header Injection)
         │
         ▼
[Pipeline Middleware 3]  (e.g., JWT Auth Verification)
         │
         ▼
[shelf_router Handler]   (Matches URL path and executes logic)
         │
         ▼
Response Returns (unwinding back through Middleware layers)
```

---

## Essential Packages

```yaml
dependencies:
  shelf: ^1.4.1
  shelf_router: ^1.1.4
  shelf_static: ^1.1.2
```
