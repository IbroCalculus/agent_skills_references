---
name: python-pydantic-v2
description: Implement data validation, serialization, and settings management using modern Pydantic V2 patterns (ConfigDict, field_validator, model_validator, model_dump, and pydantic-settings).
---

# Python Pydantic V2 Validation & Serialization

Use this skill when defining data transfer objects (DTOs), validating schemas, parsing external inputs, and configuring application settings with Pydantic V2.

## Core Rules & Modern V2 Syntax

1. **Avoid Deprecated V1 Methods**:
   - Use `model.model_dump()` instead of `model.dict()`.
   - Use `model.model_dump_json()` instead of `model.json()`.
   - Use `Model.model_validate(obj)` instead of `Model.parse_obj(obj)`.
   - Use `Model.model_validate_json(str)` instead of `Model.parse_raw(str)`.
   - Use `model_config = ConfigDict(...)` instead of inner `class Config:`.

2. **Modern Field Validation**:
   - Use `@field_validator('field_name', mode='after')` with `@classmethod` instead of deprecated `@validator`.
   - Use `@model_validator(mode='after')` for cross-field validations instead of deprecated `@root_validator`.

3. **Settings via `pydantic-settings`**:
   - Inherit from `pydantic_settings.BaseSettings`.
   - Configure env file support via `model_config = SettingsConfigDict(env_file='.env', env_file_encoding='utf-8')`.

4. **Field Constraints & Documentation**:
   - Always leverage `Field(..., min_length=..., max_length=..., gt=..., description=...)` to enforce schema constraints and document OpenAPI specifications simultaneously.
