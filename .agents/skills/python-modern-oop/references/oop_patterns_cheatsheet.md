# Python Modern OOP Cheatsheet

## Protocol vs ABC
| Feature | `typing.Protocol` | `abc.ABC` |
| :--- | :--- | :--- |
| **Typing Style** | Structural ("Duck typing") | Nominal ("Inheritance") |
| **Inheritance needed?** | No | Yes (`class Child(ABC)`) |
| **Runtime checking** | Supported via `@runtime_checkable` | Automatic on instantiation |
| **Best used for** | Third-party adapters, interchangeable services | Framework base classes, template methods |

## Modern Dataclass Flags
```python
from dataclasses import dataclass, field

@dataclass(slots=True, frozen=True, kw_only=True)
class UserConfig:
    username: str
    retries: int = 3
    tags: list[str] = field(default_factory=list)
```
- `slots=True`: Faster attribute access, smaller memory usage.
- `frozen=True`: Hashable, immutable.
- `kw_only=True`: Forces keyword-only arguments when instantiating.
