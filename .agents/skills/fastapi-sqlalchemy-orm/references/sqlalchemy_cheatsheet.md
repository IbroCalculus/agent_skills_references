# SQLAlchemy 2.0 Cheatsheet for FastAPI

## Essential Imports
```python
from sqlalchemy import select, update, delete
from sqlalchemy.orm import Session, DeclarativeBase, Mapped, mapped_column, relationship
```

## Declarative Base (2.0 Type-Annotated Style)
```python
class Base(DeclarativeBase):
    pass

class Post(Base):
    __tablename__ = "posts"

    id: Mapped[int] = mapped_column(primary_key=True)
    title: Mapped[str] = mapped_column(String(100))
```

## Querying Patterns
```python
# Single by primary key
post = db.get(Post, post_id)

# Single by condition
stmt = select(Post).where(Post.title == "Antigravity")
post = db.scalars(stmt).first()

# Multiple with pagination
stmt = select(Post).order_by(Post.id.desc()).offset(0).limit(20)
posts = db.scalars(stmt).all()

# Delete
stmt = delete(Post).where(Post.id == post_id)
db.execute(stmt)
db.commit()
```
