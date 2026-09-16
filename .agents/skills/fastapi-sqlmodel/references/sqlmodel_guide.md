# SQLModel Quick Reference

## Inheritance Model Structure
```python
from sqlmodel import SQLModel, Field

# Base shared attributes
class HeroBase(SQLModel):
    name: str = Field(index=True)
    secret_name: str
    age: int | None = Field(default=None, index=True)

# Table model
class Hero(HeroBase, table=True):
    id: int | None = Field(default=None, primary_key=True)

# Request payload (id is omitted)
class HeroCreate(HeroBase):
    pass

# Response payload (id is required)
class HeroRead(HeroBase):
    id: int

# Update payload (all optional)
class HeroUpdate(SQLModel):
    name: str | None = None
    secret_name: str | None = None
    age: int | None = None
```

## Update via Model Dump
```python
hero_data = hero_update.model_dump(exclude_unset=True)
db_hero.sqlmodel_update(hero_data)
session.add(db_hero)
session.commit()
session.refresh(db_hero)
```
