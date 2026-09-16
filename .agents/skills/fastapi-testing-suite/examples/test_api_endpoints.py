from collections.abc import Generator
from fastapi import FastAPI, status
from fastapi.testclient import TestClient
import pytest

app = FastAPI()


@app.get("/health", status_code=status.HTTP_200_OK)
def health_check():
    return {"status": "healthy"}


@app.post("/items", status_code=status.HTTP_201_CREATED)
def create_item(payload: dict):
    return {"id": 1, **payload}


@pytest.fixture
def client() -> Generator[TestClient, None, None]:
    with TestClient(app) as test_client:
        yield test_client


def test_health_check(client: TestClient):
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json() == {"status": "healthy"}


def test_create_item(client: TestClient):
    response = client.post("/items", json={"name": "Book", "price": 19.99})
    assert response.status_code == 201
    data = response.json()
    assert data["name"] == "Book"
    assert data["price"] == 19.99
