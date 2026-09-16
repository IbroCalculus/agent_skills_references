from dataclasses import dataclass, field
from datetime import datetime, timezone
from typing import Protocol, runtime_checkable


@runtime_checkable
class EntityProtocol(Protocol):
    def get_id(self) -> str: ...


@dataclass(slots=True)
class BaseDomainEntity:
    id: str
    created_at: datetime = field(default_factory=lambda: datetime.now(timezone.utc))

    def get_id(self) -> str:
        return self.id
