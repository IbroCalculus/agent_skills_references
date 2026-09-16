---
name: python-modern-oop
description: Design clean, maintainable Python 3.10+ object-oriented architectures using dataclasses, typing.Protocol (duck typing), abstract base classes (ABC), dunder methods, and SOLID principles.
---

# Python Modern OOP & Architecture

Use this skill when designing domain entities, class hierarchies, structural interfaces, and business modeling in Python.

## Core Rules & Patterns

1. **Dataclasses for Data Holders**:
   - Use `@dataclass` for classes that primarily store state.
   - Use `frozen=True` for immutable value objects.
   - Use `slots=True` (Python 3.10+) to reduce memory footprint and prevent arbitrary attribute assignments.

2. **Structural Subtyping with `typing.Protocol`**:
   - Prefer `typing.Protocol` over nominal inheritance (`class Dog(Animal)`) when you want to define what an object can *do* rather than what it *is* (pure Pythonic duck typing).
   - This decouples consumer code from concrete implementations without forcing multiple inheritance.

3. **Nominal Interfaces with `abc.ABC`**:
   - Use `abc.ABC` and `@abstractmethod` only when you need runtime enforcement of required methods upon subclass instantiation.

4. **SOLID Principles**:
   - **Single Responsibility**: Each class has one clear responsibility.
   - **Open/Closed**: Open for extension (via polymorphism or composition), closed for modification.
   - **Liskov Substitution**: Subclasses must be substitutable for their superclasses without breaking callers.
   - **Interface Segregation**: Keep protocols small and specialized.
   - **Dependency Inversion**: High-level modules depend on abstractions (Protocols), not concrete implementations.

5. **Structural Pattern Matching (`match / case`)**:
   - Leverage Python 3.10+ `match / case` for handling polymorphic types and dataclass destructuring cleanly.
