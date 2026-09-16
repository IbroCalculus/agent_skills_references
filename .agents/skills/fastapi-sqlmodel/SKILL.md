---
name: fastapi-sqlmodel
description: Build fast, type-safe FastAPI backends with SQLModel, combining Pydantic validation and SQLAlchemy ORM into unified models with declarative sessions.
---

# FastAPI SQLModel Development

Use this skill when building APIs with SQLModel (Tiangolo's unified library combining Pydantic and SQLAlchemy).

## Core Rules & Architecture

1. **Class Hierarchy for Models and Schemas**:
   - Do NOT mix API input/output models with database table models into a single class.
   - Use the standard SQLModel inheritance pattern:
     - `ItemBase(SQLModel)`: Shared fields between API schemas and DB tables.
     - `Item(ItemBase, table=True)`: Database table model with primary keys and foreign keys.
     - `ItemCreate(ItemBase)`: Request payload model (omits auto-generated IDs).
     - `ItemRead(ItemBase)`: Response model (includes ID and timestamps).
     - `ItemUpdate(SQLModel)`: Optional fields for PATCH requests.

2. **Session Injection**:
   - Provide `get_session()` dependency yielding a `sqlmodel.Session`.
   ```python
   def get_session() -> Generator[Session, None, None]:
       with Session(engine) as session:
           yield session
   ```

3. **Querying with SQLModel**:
   - Always use `select(Model).where(...)`.
   - Execute via `session.exec(statement).first()` or `session.exec(statement).all()`.
