# FastAPI Testing Best Practices

## Dependency Overriding Pattern
```python
import pytest
from fastapi.testclient import TestClient
from app.main import app
from app.database import get_db

@pytest.fixture
def test_client(db_session):
    def override_get_db():
        try:
            yield db_session
        finally:
            pass

    app.dependency_overrides[get_db] = override_get_db
    with TestClient(app) as client:
        yield client
    app.dependency_overrides.clear()
```

## Running Tests with Coverage
```bash
pytest -v --cov=app --cov-report=term-missing
```
