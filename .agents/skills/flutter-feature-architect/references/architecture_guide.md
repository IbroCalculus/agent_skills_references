# Architecture & Folder Structuring Guide

## The Core Philosophy
> **"A folder is not for files that look alike. It is for files that serve the same purpose."**

A folder structure is a deliberate design decision. There is no universal "one-size-fits-all" architecture. The right structure depends on the project's scale, complexity, and team size.

---

## Decision Matrix: Which Pattern to Use?

| Project Profile | Recommended Pattern | Directory Layout | Key Benefits |
| :--- | :--- | :--- | :--- |
| **Enterprise / Multi-Team / Long-term** | **Feature-First + Clean Architecture** | `lib/core/` + `lib/features/<name>/{presentation, domain, data}` | Absolute separation of concerns, testability with pure business models, easy domain swapping. |
| **Medium / Fast-Paced Apps** | **Feature-First Architecture** | `lib/core/` + `lib/features/<name>/` | High findability, self-contained features, minimal boilerplate. |
| **Small Tools / Prototypes / MVPs** | **Layer-Based Architecture** | `lib/{screens, widgets, models, services, providers}` | Instant setup, low cognitive overhead for apps under 10 screens. |

---

## Separation of Concerns: The Golden Boundaries

1. **Widgets (UI)**:
   - Must be declarative.
   - Never initiate raw HTTP or database queries in `initState`, `build`, or button `onPressed`.
   - Always delegate to a Notifier / Controller / BLoC.
2. **Controllers / Providers (Presentation State)**:
   - Hold UI state (loading, error, success, form values).
   - Talk only to Repositories or Use Cases, never directly to low-level APIs or storage.
3. **Domain Layer**:
   - Contains pure Dart entities and abstract repository contracts.
   - Zero dependencies on Flutter UI packages (`flutter/material.dart`).
4. **Data Layer**:
   - Contains DataSources (network, cache, secure storage) and Models (`fromJson`/`toJson`).
   - Implements domain repository interfaces and converts low-level exceptions to domain `Failure` objects.
