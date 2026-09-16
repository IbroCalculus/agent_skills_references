---
name: fastapi-auth-security
description: Implement secure authentication and authorization systems in FastAPI using OAuth2 with Password Bearer tokens, PyJWT, bcrypt password hashing, and role-based access control dependencies.
---

# FastAPI Authentication & Security

Use this skill when implementing user authentication, OAuth2 workflows, JWT token lifecycle (access/refresh tokens), password hashing, and endpoint authorization guards.

## Core Rules & Patterns

1. **OAuth2 with Password Bearer**:
   - Instantiate `OAuth2PasswordBearer(tokenUrl="api/v1/auth/login")` to automatically parse and enforce Bearer tokens in Swagger UI and HTTP requests.

2. **Secure Token Encoding & Decoding**:
   - Use `jwt` (PyJWT) with modern `timezone.utc` timestamps for expiration (`exp`).
   - Catch specific JWT exceptions (`jwt.ExpiredSignatureError`, `jwt.PyJWTError`) and return `HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, headers={"WWW-Authenticate": "Bearer"})`.

3. **Password Hashing**:
   - Use `bcrypt` directly (or `passlib.context.CryptContext(schemes=["bcrypt"])`).
   - NEVER store or compare plain-text passwords.

4. **Composable Auth Dependencies**:
   - Define `get_current_user` as a FastAPI dependency extracting and verifying the user identity.
   - Define role guards (e.g. `require_admin`, `require_permissions`) using dependency factories or closure functions checking user roles.

## File Organization

```
app/
├── core/
│   └── security.py        # Token creation, verification, password hashing
├── dependencies/
│   └── auth.py            # get_current_user, require_role dependencies
└── routers/
    └── auth.py            # Login, register, refresh token endpoints
```
