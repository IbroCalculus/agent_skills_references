from typing import Annotated
from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel, ConfigDict


# === 1. Schemas (API Contracts) ===
class ItemCreate(BaseModel):
    title: str
    price: float


class ItemRead(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    id: int
    title: str
    price: float


# === 2. Repository (Data Access) ===
class ItemRepository:
    def __init__(self):
        self._db = {}
        self._counter = 1

    def create(self, title: str, price: float) -> dict:
        item = {"id": self._counter, "title": title, "price": price}
        self._db[self._counter] = item
        self._counter += 1
        return item

    def get_by_id(self, item_id: int) -> dict | None:
        return self._db.get(item_id)


_repo_instance = ItemRepository()


def get_item_repository() -> ItemRepository:
    return _repo_instance


# === 3. Service (Business Domain Logic) ===
class ItemService:
    def __init__(self, repo: ItemRepository):
        self.repo = repo

    def add_item(self, payload: ItemCreate) -> ItemRead:
        if payload.price <= 0:
            raise ValueError("Price must be strictly positive.")
        raw_item = self.repo.create(title=payload.title, price=payload.price)
        return ItemRead(**raw_item)

    def fetch_item(self, item_id: int) -> ItemRead:
        raw_item = self.repo.get_by_id(item_id)
        if not raw_item:
            raise LookupError(f"Item #{item_id} does not exist.")
        return ItemRead(**raw_item)


def get_item_service(repo: Annotated[ItemRepository, Depends(get_item_repository)]) -> ItemService:
    return ItemService(repo=repo)


# === 4. Router (HTTP Transport) ===
router = APIRouter(prefix="/items", tags=["Items"])


@router.post("/", response_model=ItemRead, status_code=status.HTTP_201_CREATED)
def create_item(
    payload: ItemCreate,
    service: Annotated[ItemService, Depends(get_item_service)],
):
    try:
        return service.add_item(payload)
    except ValueError as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=str(e))


@router.get("/{item_id}", response_model=ItemRead, status_code=status.HTTP_200_OK)
def read_item(
    item_id: int,
    service: Annotated[ItemService, Depends(get_item_service)],
):
    try:
        return service.fetch_item(item_id)
    except LookupError as e:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail=str(e))
