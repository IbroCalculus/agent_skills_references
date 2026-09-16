# Dart Frog Reference & Cheat Sheet

## Directory & URL Mapping

| File Path | URL Route | Parameters |
| :--- | :--- | :--- |
| `routes/index.dart` | `GET /` | None |
| `routes/posts/index.dart` | `GET, POST /posts` | None |
| `routes/posts/[id].dart` | `GET, PUT, DELETE /posts/:id` | `String id` passed to `onRequest` |
| `routes/auth/login.dart` | `POST /auth/login` | None |

---

## Dependency Injection Flow

```
Client Request
      │
      ▼
_middleware.dart (providers injected into RequestContext)
      │
      ▼
onRequest(RequestContext context)
      │
      ├── context.read<AuthService>()
      └── context.read<Database>()
```

---

## Shelf vs Dart Frog

- **Dart Frog**: Built on top of Shelf by Very Good Ventures. Provides file-system routing, built-in dependency injection, and hot reload CLI.
- **Shelf**: The lower-level pipeline framework (`shelf`, `shelf_router`). Ideal when custom network pipelines or embedding into bespoke executables is required.
