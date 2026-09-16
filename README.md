# Agent Skills References

A centralized, production-ready master repository of specialized **Antigravity AI Agent Skills and Rules**.

This repository serves as an engineering vault containing curated, tested agent skills and architectural conventions across Flutter, Dart, FastAPI, Python, AI/LLM orchestration, Server-side microservices, Web, CLI tooling, and testing.

---

## 📂 Repository Structure (38 Specialized Skills + Architectural Rules)

```
agent_skills_references/
└── .agents/
    ├── rules/
    │   └── respect_project_conventions.md   # Non-destructive convention guard
    └── skills/
        # --- Flutter Architecture, UI & Native (9 Skills) ---
        ├── flutter-core/                     # Adaptive Flutter development & lifecycle management
        ├── flutter-feature-architect/        # Feature-First Clean Architecture scaffolding
        ├── flutter-riverpod-expert/          # Modern Riverpod state management & AsyncValue
        ├── flutter-declarative-routing/      # Deep-linking & navigation with GoRouter
        ├── flutter-ui-components/            # Responsive layouts, tokens & FormBuilder forms
        ├── flutter-device-services/          # Biometrics, secure storage, and notifications
        ├── flutter-test-suite/               # Unit, ProviderContainer, Mocktail & Widget testing
        ├── flutter-code-review/              # Comprehensive multi-dimensional code auditing
        ├── flutter-ai-integration/           # Conversational AI & streaming LLM chat in Flutter

        # --- Dart Server, Web, Game & Tooling (15 Skills) ---
        ├── dart-serverpod/                   # Full-stack Dart backends & auto-generated SDKs
        ├── dart-backend-api/                 # REST APIs with Dart Frog & Shelf
        ├── dart-shelf-server/                # Low-overhead microservices with foundational Shelf
        ├── dart-conduit-backend/             # Multi-isolate HTTP & PostgreSQL with Conduit
        ├── dart-jaspr-web/                   # SSR, SSG, and WASM web apps with Jaspr
        ├── dart-rad-web/                     # Flutter-like lightweight single page web apps
        ├── dart-angulardart-app/             # Enterprise SPA development with AngularDart
        ├── dart-flame-engine/                # 2D game development with Flame & Forge2D
        ├── dart-genkit-flow/                 # AI flows and structured LLM outputs with Genkit
        ├── dart-langchain-agent/             # RAG, vector embeddings & agents with LangChain.dart
        ├── dart-melos-monorepo/              # Multi-package monorepo orchestration with Melos
        ├── dart-mason-bricks/                # Custom architectural code generator bricks
        ├── dart-dcli-automation/             # DevOps scripts and native AOT CLI automation
        ├── dart-oop-class-design/            # Modern Dart 3 OOP, class modifiers & patterns
        ├── workspace-doctor/                 # Workspace health diagnostics and tool audits

        # --- FastAPI Framework Suite (6 Skills) ---
        ├── fastapi-core/                     # Lifespan lifecycle, CORS, exception handlers & settings
        ├── fastapi-clean-architecture/       # Decoupled routers, services, repositories & schemas
        ├── fastapi-auth-security/            # OAuth2 Password Bearer, PyJWT, bcrypt & RBAC guards
        ├── fastapi-sqlalchemy-orm/           # SQLAlchemy 2.0 select queries, generator session & Base
        ├── fastapi-sqlmodel/                 # Unified Pydantic + SQLAlchemy SQLModel CRUD
        ├── fastapi-testing-suite/            # Pytest test client, dependency overrides & fixtures

        # --- Python Core, Data, Automation & AI (8 Skills) ---
        ├── python-modern-oop/                # Dataclasses (slots/frozen), Protocols, ABCs & match/case
        ├── python-pydantic-v2/               # ConfigDict, field_validator, model_dump & BaseSettings
        ├── python-structured-logging/        # Standard logging, named loggers, rotating handlers
        ├── python-concurrency/               # ThreadPoolExecutor, ProcessPoolExecutor & lock safety
        ├── python-web-scraping/              # BeautifulSoup4 HTML parsing & Selenium automation
        ├── python-data-pandas-numpy/         # Vectorized Pandas DataFrames, groupby & Excel/CSV I/O
        ├── python-streamlit-app/             # Interactive web dashboards, session state & caching
        └── python-ai-orchestration/          # Structured output, streaming, tool calling & RAG
```

---

## 🛡️ Core Rules

### `respect_project_conventions.md`
Ensures that whenever an agent assists on an existing codebase, it **strictly respects and adheres to existing architectural decisions, conventions, and state management solutions** (e.g. BLoC, MobX, Provider, Riverpod, Flask, FastAPI, Django) and **never** forces opinionated rewrites unless explicitly directed by the developer.

---

## 🚀 How to Use

### 1. Project-Specific Customization (Workspace Scope)
Copy any skill or rule folder into your target project's `.agents/` directory:
```bash
# Example: Adding FastAPI core & SQLAlchemy skills to a Python backend project
cp -r .agents/skills/fastapi-core /path/to/my_project/.agents/skills/
cp -r .agents/skills/fastapi-sqlalchemy-orm /path/to/my_project/.agents/skills/
cp -r .agents/rules/* /path/to/my_project/.agents/rules/
```

### 2. Global Customization (All Workspaces)
Copy skills into your global Antigravity configuration directory:
```bash
# Windows (PowerShell)
Copy-Item -Recurse -Force .agents\skills\* "$HOME\.gemini\config\skills\"

# macOS / Linux
cp -r .agents/skills/* ~/.gemini/config/skills/
```

---

## 📜 License
MIT License
