---
name: fastapi-clean-architecture
description: Architect enterprise FastAPI codebases using clean Layer-Based or Feature-First structures, decoupling routers, services, database models, and Pydantic schemas.
---

# FastAPI Clean Architecture

Use this skill when scaffolding new FastAPI services, organizing endpoints, separating business logic from HTTP handlers, and establishing repository/service layer patterns.

## Architectural Principles

1. **Strict Separation of Concerns**:
   - **`routers/`**: HTTP transport layer. Receives requests, triggers dependency injection, calls the service layer, and returns formatted responses. NO SQL queries or direct business rules.
   - **`services/`**: Core business domain logic, calculation rules, orchestrating repositories and external API calls.
   - **`models/`**: Database entities (SQLAlchemy / SQLModel / ODM). Defines database tables, relationships, and foreign keys.
   - **`schemas/`**: Pydantic DTOs for request input validation and response shaping.
     > **Golden Rule**: `Model = Database entity. Schema = API transport contract.`
   - **`database/`**: Engine instantiation, session makers, Base declaration, and session dependencies (`get_db`).
   - **`core/`**: Global configuration, environment settings (`BaseSettings`), security tokens, and constants.
   - **`dependencies/`**: Reusable FastAPI dependency callables (current user auth, permissions, DB sessions).

2. **Feature-First vs. Layer-Based Organization**:
   - **Layer-Based** (Ideal for small to medium services):
     ```
     app/
     ├── core/
     ├── database/
     ├── models/
     ├── schemas/
     ├── services/
     ├── routers/
     └── main.py
     ```
   - **Feature-First** (Ideal for complex, multi-domain platforms):
     ```
     app/
     ├── core/
     ├── database/
     ├── features/
     │   ├── users/
     │   │   ├── models.py
     │   │   ├── schemas.py
     │   │   ├── service.py
     │   │   └── router.py
     │   └── orders/
     │       └── ...
     └── main.py
     ```

3. **Dependency Injection**:
   - Pass services and repositories to routers via `Depends()`.
   - Keep services testable by allowing mocked databases and external integrations to be injected.
