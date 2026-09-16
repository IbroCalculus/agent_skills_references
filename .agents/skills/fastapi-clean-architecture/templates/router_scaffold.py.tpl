from typing import Annotated
from fastapi import APIRouter, Depends, HTTPException, status

router = APIRouter(prefix="/resource", tags=["Resource"])


@router.get("/", status_code=status.HTTP_200_OK)
def list_resources():
    return []


@router.post("/", status_code=status.HTTP_201_CREATED)
def create_resource():
    return {"status": "created"}
