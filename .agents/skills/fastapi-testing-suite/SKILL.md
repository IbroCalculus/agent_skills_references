---
name: fastapi-testing-suite
description: Write comprehensive integration and unit tests for FastAPI endpoints using pytest, TestClient/httpx.AsyncClient, dependency overrides, and isolated in-memory test databases.
---

# FastAPI Testing Suite

Use this skill when writing automated integration tests, unit tests, and regression tests for FastAPI applications.

## Core Rules & Best Practices

1. **Dependency Overriding**:
   - Never run tests against a live production or staging database.
   - Use `app.dependency_overrides[get_db] = override_get_db` to point the application to an isolated SQLite in-memory database (`sqlite:///:memory:` or temporary test file).
   - Clear overrides in teardown (`app.dependency_overrides.clear()`).

2. **Test Client Selection**:
   - For synchronous endpoints: Use `starlette.testclient.TestClient(app)`.
   - For async endpoints and websockets: Use `httpx.AsyncClient(transport=ASGITransport(app=app), base_url="http://test")`.

3. **Fixtures & Clean State**:
   - Define a `pytest` fixture in `conftest.py` that recreates the schema (`Base.metadata.create_all`) and drops it (`Base.metadata.drop_all`) per test session or module.

4. **Authentication Mocking**:
   - Override `get_current_user` directly to bypass token creation when testing business endpoints, and write dedicated tests for the auth router itself.
