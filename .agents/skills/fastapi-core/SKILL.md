---
name: fastapi-core
description: Scaffold and develop production-ready FastAPI applications utilizing the lifespan context manager, CORS middleware, global exception handlers, settings via pydantic-settings, and standard HTTP status conventions.
---

# FastAPI Core Application Development

Use this skill when initializing, configuring, or maintaining the foundational layers of a FastAPI application.

## Core Rules & Architecture

1. **Lifespan Over Deprecated Events**:
   - Always use `@asynccontextmanager` with `FastAPI(lifespan=lifespan)` for startup and shutdown routines (e.g. database connection pooling, cache warming, background workers).
   - NEVER use the deprecated `@app.on_event("startup")` or `@app.on_event("shutdown")`.

2. **Clean Entry Point (`main.py`)**:
   - `main.py` is the application entry point only. It must NOT contain business logic.
   - Its sole responsibilities:
     - Instantiate `FastAPI` with metadata (title, version, description, lifespan).
     - Register middleware (`CORSMiddleware`, logging, trusted hosts).
     - Register global exception handlers (`RequestValidationError`, `HTTPException`, unhandled errors).
     - Mount routers (`app.include_router(...)`).

3. **Strict Parameter Validation**:
   - Use `Path(...)` with constraints (`gt`, `ge`, `lt`, `le`, `regex`) for path parameters.
   - Use `Query(...)` with defaults, optional typing, and descriptions for search/filtering parameters.
   - Always leverage `typing.Annotated` for clean, reusable parameter declarations (e.g., `Annotated[int, Path(gt=0)]`).

4. **Explicit Status Codes**:
   - Use `starlette.status` or `fastapi.status` constants (e.g., `status.HTTP_200_OK`, `status.HTTP_201_CREATED`, `status.HTTP_204_NO_CONTENT`, `status.HTTP_404_NOT_FOUND`) rather than raw magic integers.

5. **Settings Management**:
   - Manage application configuration and environment variables via `pydantic-settings` (`BaseSettings`), caching the settings instance with `@lru_cache`.

---

## File Structure

```
app/
├── core/
│   ├── config.py           # BaseSettings definition with @lru_cache
│   └── exceptions.py       # Custom domain exceptions & global handlers
├── routers/
│   └── ...                 # Modular APIRouter packages
└── main.py                 # Lifespan, middleware, router mounts
```

## Anti-Patterns to Avoid
- Embedding database queries or business calculations directly inside `main.py`.
- Using raw string literals or magic numbers for HTTP status codes.
- Swallowing exceptions without returning structured error responses.
- Forgetting `CORSMiddleware` when building APIs intended for web clients.
