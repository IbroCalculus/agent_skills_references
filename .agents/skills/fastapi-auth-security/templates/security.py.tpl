from datetime import datetime, timedelta, timezone
import jwt
from passlib.context import CryptContext

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


def hash_password(password: str) -> str:
    return pwd_context.hash(password)


def verify_password(plain_password: str, hashed_password: str) -> bool:
    return pwd_context.verify(plain_password, hashed_password)


def create_token(data: dict, secret_key: str, algorithm: str = "HS256", expire_minutes: int = 30) -> str:
    payload = data.copy()
    expire = datetime.now(timezone.utc) + timedelta(minutes=expire_minutes)
    payload.update({"exp": expire})
    return jwt.encode(payload, secret_key, algorithm=algorithm)
