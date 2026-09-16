# FastAPI Architecture Guide

## Responsibility Matrix

| Layer | Responsibility | Allowed Dependencies | Prohibited Content |
| :--- | :--- | :--- | :--- |
| **Router** | Request deserialization, status codes, route grouping | Depends(Service), Schemas | Raw DB queries, domain validation logic |
| **Service** | Domain business logic, orchestrating calls, business validation | Repositories, Third-party clients | FastAPI Request/Response objects, HTTP exceptions |
| **Repository** | SQL/ORM queries, data mapping, filtering | SQLAlchemy Session, DB Models | HTTP parameters, FastAPI dependencies |
| **Schema** | API request/response shape, field validation | Pydantic BaseModel, Field | DB Session, SQLAlchemy Table references |
| **Model** | Relational table schema, foreign keys, relationships | SQLAlchemy Base, Column, relationship | Pydantic fields, serialization formats |

## Dependency Injection Rule of Thumb
Always declare service factories:
```python
def get_user_service(
    repo: Annotated[UserRepository, Depends(get_user_repository)],
) -> UserService:
    return UserService(repo=repo)
```
This guarantees that tests can easily override dependencies using:
```python
app.dependency_overrides[get_user_repository] = get_mock_user_repository
```
