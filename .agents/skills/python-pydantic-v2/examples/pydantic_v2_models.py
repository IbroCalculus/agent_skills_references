from datetime import datetime, timezone
from pydantic import BaseModel, ConfigDict, EmailStr, Field, field_validator, model_validator


class UserRegistrationSchema(BaseModel):
    model_config = ConfigDict(
        str_strip_whitespace=True,
        extra="forbid",
        from_attributes=True,
    )

    username: str = Field(..., min_length=3, max_length=50, description="Unique username")
    email: EmailStr = Field(..., description="User primary email address")
    age: int = Field(..., ge=18, le=120, description="Age must be 18+")
    password: str = Field(..., min_length=8, description="Plain text password")
    confirm_password: str = Field(..., min_length=8)
    created_at: datetime = Field(default_factory=lambda: datetime.now(timezone.utc))

    @field_validator("username")
    @classmethod
    def validate_username_alphanumeric(cls, v: str) -> str:
        if not v.isalnum():
            raise ValueError("Username must contain only alphanumeric characters.")
        return v.lower()

    @model_validator(mode="after")
    def check_passwords_match(self) -> "UserRegistrationSchema":
        if self.password != self.confirm_password:
            raise ValueError("Passwords do not match.")
        return self


if __name__ == "__main__":
    raw_data = {
        "username": "IbrahimCalculus ",
        "email": "ibrahim@example.com",
        "age": 25,
        "password": "strongPassword123",
        "confirm_password": "strongPassword123",
    }
    user = UserRegistrationSchema.model_validate(raw_data)
    print("Validated:", user.model_dump(exclude={"password", "confirm_password"}))
