---
name: fastapi-sqlalchemy-orm
description: Configure and execute SQLAlchemy ORM workflows in FastAPI, including declarative models, database session dependencies, transactions, relationships, and modern SQLAlchemy 2.0 queries.
---

# FastAPI SQLAlchemy ORM

Use this skill when integrating relational databases (PostgreSQL, MySQL, SQLite) with FastAPI using SQLAlchemy.

## Core Rules & Architecture

1. **Session Lifecycle via Generator Dependency**:
   - Always manage database sessions using a Python generator function `get_db()`.
   - Wrap the yield in `try ... finally: db.close()` to guarantee that every connection is returned to the pool even when an exception occurs during request processing.
   ```python
   def get_db() -> Generator[Session, None, None]:
       db = SessionLocal()
       try:
           yield db
       finally:
           db.close()
   ```

2. **Modern SQLAlchemy 2.0 Query Syntax**:
   - Prefer 2.0 style syntax over legacy 1.x `query()` calls:
     ```python
     # Modern 2.0
     stmt = select(User).where(User.email == email)
     user = db.scalars(stmt).first()

     # Avoid Legacy 1.x
     user = db.query(User).filter(User.email == email).first()
     ```

3. **Separation of Schemas and Models**:
   - SQLAlchemy classes define database tables and schema constraints (`Column`, `relationship`, `ForeignKey`).
   - Pydantic models define JSON payload schemas (`from_attributes = True` / `orm_mode = True`).

4. **Transactional Safety**:
   - Always commit or rollback transactions predictably. Commit only after all mutations succeed.

## File Organization

```
app/
├── database/
│   ├── base.py            # Base = declarative_base()
│   ├── session.py         # engine, SessionLocal, get_db dependency
│   └── init_db.py         # table creation / migrations hook
├── models/
│   └── user.py            # SQLAlchemy table definitions
└── repositories/
    └── user_repo.py       # SQL queries and mutations
```
