# FastAPI Core Cheatsheet

## Lifespan Context Manager vs On Event
```python
# Modern Recommended (FastAPI 0.93+)
from contextlib import asynccontextmanager

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Setup
    yield
    # Teardown

app = FastAPI(lifespan=lifespan)

# Deprecated (Do not use)
@app.on_event("startup")
async def startup(): ...
```

## Parameter Annotations
```python
from typing import Annotated
from fastapi import Path, Query, Header, Cookie

# Path parameters with constraints
item_id: Annotated[int, Path(gt=0, le=10000, description="Item ID")]

# Query parameters with defaults
q: Annotated[str | None, Query(max_length=50)] = None
page: Annotated[int, Query(ge=1)] = 1
```

## Status Codes
Always import `from fastapi import status`:
- `status.HTTP_200_OK`: Default successful GET/PUT
- `status.HTTP_201_CREATED`: Successful POST creating a resource
- `status.HTTP_204_NO_CONTENT`: Successful DELETE
- `status.HTTP_400_BAD_REQUEST`: Malformed client payload
- `status.HTTP_401_UNAUTHORIZED`: Missing or invalid authentication
- `status.HTTP_403_FORBIDDEN`: Authenticated but insufficient permissions
- `status.HTTP_404_NOT_FOUND`: Resource missing
- `status.HTTP_422_UNPROCESSABLE_ENTITY`: Automatic Pydantic validation failure
