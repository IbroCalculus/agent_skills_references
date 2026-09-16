from sqlmodel import Field, SQLModel


class EntityBase(SQLModel):
    name: str = Field(index=True)
    description: str | None = None


class Entity(EntityBase, table=True):
    id: int | None = Field(default=None, primary_key=True)


class EntityCreate(EntityBase):
    pass


class EntityRead(EntityBase):
    id: int
