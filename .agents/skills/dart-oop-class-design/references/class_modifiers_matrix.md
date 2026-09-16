# Dart 3 Class Modifiers Reference Matrix

| Modifier | Construct | Extend (`extends`) Outside Library? | Implement (`implements`) Outside Library? | Mix In (`with`) Outside Library? | Exhaustive in `switch`? |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **(no modifier)** | Yes | Yes | Yes | No | No |
| `abstract` | No | Yes | Yes | No | No |
| `sealed` | No | No | No | No | **Yes (Full Exhaustiveness)** |
| `interface` | Yes | No | Yes | No | No |
| `base` | Yes | Yes (Subclass must be `base`, `final`, or `sealed`) | No | No | No |
| `final` | Yes | No | No | No | No |
| `mixin class` | Yes | Yes | Yes | Yes | No |

---

## When to Use Which Modifier

1. **Feature / State Machine**: Use `sealed class` for UI states, Bloc events, or operation outcomes.
2. **Repository / Service Contract**: Use `abstract interface class` so tests can implement mocks while preventing unauthorized subclassing.
3. **Immutable Value Objects**: Use `final class` with `const` constructors.
4. **Base Template Components**: Use `abstract base class` when subclasses must inherit internal helper logic.
