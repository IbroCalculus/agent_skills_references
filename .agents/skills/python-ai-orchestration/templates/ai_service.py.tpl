from pydantic import BaseModel, Field


class QueryRequest(BaseModel):
    prompt: str
    stream: bool = False


class QueryResponse(BaseModel):
    response: str
    model: str
