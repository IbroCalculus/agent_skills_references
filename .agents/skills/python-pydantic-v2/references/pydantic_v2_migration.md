# Pydantic V1 vs V2 Quick Guide

| Concept | Pydantic V1 (Legacy) | Pydantic V2 (Modern Standard) |
| :--- | :--- | :--- |
| **Model configuration** | `class Config:` | `model_config = ConfigDict(...)` |
| **Export to dictionary** | `obj.dict()` | `obj.model_dump()` |
| **Export to JSON** | `obj.json()` | `obj.model_dump_json()` |
| **Parse dictionary** | `Model.parse_obj(d)` | `Model.model_validate(d)` |
| **Parse raw string** | `Model.parse_raw(s)` | `Model.model_validate_json(s)` |
| **Field validator** | `@validator('field')` | `@field_validator('field')` + `@classmethod` |
| **Root validator** | `@root_validator` | `@model_validator(mode='after')` |
| **ORM compatibility** | `orm_mode = True` | `from_attributes = True` |
| **Settings class** | `from pydantic import BaseSettings` | `from pydantic_settings import BaseSettings` |
