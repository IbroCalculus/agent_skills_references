from typing import Annotated, Generator
from fastapi import APIRouter, Depends, HTTPException, status
from sqlmodel import Field, SQLModel, Session, create_engine, select

DATABASE_URL = "sqlite:///./sqlmodel_app.db"
engine = create_engine(DATABASE_URL, connect_args={"check_same_thread": False})


# === Models & Schemas ===
class TaskBase(SQLModel):
    title: str
    description: str | None = None
    is_completed: bool = False


class Task(TaskBase, table=True):
    id: int | None = Field(default=None, primary_key=True)


class TaskCreate(TaskBase):
    pass


class TaskRead(TaskBase):
    id: int


SQLModel.metadata.create_all(engine)


def get_session() -> Generator[Session, None, None]:
    with Session(engine) as session:
        yield session


router = APIRouter(prefix="/tasks", tags=["Tasks"])


@router.post("/", response_model=TaskRead, status_code=status.HTTP_201_CREATED)
def create_task(task: TaskCreate, session: Annotated[Session, Depends(get_session)]):
    db_task = Task.model_validate(task)
    session.add(db_task)
    session.commit()
    session.refresh(db_task)
    return db_task


@router.get("/", response_model=list[TaskRead])
def read_tasks(session: Annotated[Session, Depends(get_session)]):
    return session.exec(select(Task)).all()
