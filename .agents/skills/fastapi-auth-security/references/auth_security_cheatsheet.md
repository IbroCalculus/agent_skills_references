# FastAPI Auth & Security Cheatsheet

## Dependencies
```bash
pip install "python-jose[cryptography]" pyjwt bcrypt passlib[bcrypt]
```

## UTC Datetime Warning
Always use `datetime.now(timezone.utc)` for JWT exp dates to avoid timezone misalignment bugs:
```python
from datetime import datetime, timedelta, timezone

expire = datetime.now(timezone.utc) + timedelta(minutes=15)
```

## Role-Based Access Control (RBAC) Dependency
```python
from fastapi import Depends, HTTPException, status

def require_role(required_role: str):
    def role_checker(token_data: dict = Depends(get_current_token_payload)):
        if token_data.get("role") != required_role:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Insufficient permissions for this resource"
            )
        return token_data
    return role_checker

# Usage in router:
@router.delete("/users/{user_id}", dependencies=[Depends(require_role("admin"))])
def delete_user(user_id: int):
    ...
```
