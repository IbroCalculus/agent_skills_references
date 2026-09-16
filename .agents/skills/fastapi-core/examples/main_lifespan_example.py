from contextlib import asynccontextmanager
from typing import Annotated
from fastapi import FastAPI, HTTPException, Path, Query, status
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel


@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup phase: initialize resources, DB pools, caches
    print("🚀 API starting up: Initializing resources...")
    yield
    # Shutdown phase: clean up connection pools, flush logs
    print("🛑 API shutting down: Cleaning up resources...")


app = FastAPI(
    title="Core API Service",
    version="1.0.0",
    description="Production-grade core FastAPI setup",
    lifespan=lifespan,
)

# CORS Middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class ItemResponse(BaseModel):
    id: int
    name: str
    price: float


items_db = {
    1: {"id": 1, "name": "Espresso Machine", "price": 299.99},
    2: {"id": 2, "name": "Coffee Beans", "price": 14.50},
}


@app.get(
    "/items/{item_id}",
    response_model=ItemResponse,
    status_code=status.HTTP_200_OK,
    tags=["Items"],
)
async def get_item(
    item_id: Annotated[int, Path(description="The ID of the item", gt=0)],
    include_details: Annotated[bool, Query(description="Include extended item details")] = False,
):
    item = items_db.get(item_id)
    if not item:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Item with ID {item_id} not found",
        )
    return item
