# Agent Skills References

A centralized, production-ready repository of specialized **Antigravity AI Agent Skills and Rules**.

This repository serves as a master vault containing curated engineering skills and architectural conventions across Flutter, Dart, Server-side APIs, AI/LLM orchestration, Web, CLI tooling, and testing.

---

## 📂 Repository Structure

`
agent_skills_references/
└── .agents/
    ├── rules/
    │   └── respect_project_conventions.md   # Non-destructive convention guard
    └── skills/
        ├── dart-angulardart-app/             # Enterprise SPA development with AngularDart
        ├── dart-backend-api/                 # REST APIs with Dart Frog & Shelf
        ├── dart-conduit-backend/             # Multi-isolate HTTP & PostgreSQL with Conduit
        ├── dart-dcli-automation/             # DevOps scripts and native AOT CLI automation
        ├── dart-flame-engine/                # 2D game development with Flame & Forge2D
        ├── dart-genkit-flow/                 # AI flows and structured LLM outputs with Genkit
        ├── dart-jaspr-web/                   # SSR, SSG, and WASM web apps with Jaspr
        ├── dart-langchain-agent/             # RAG, vector embeddings & agents with LangChain.dart
        ├── dart-mason-bricks/                # Custom architectural code generator bricks
        ├── dart-melos-monorepo/              # Multi-package monorepo orchestration with Melos
        ├── dart-oop-class-design/            # Modern Dart 3 OOP, class modifiers & patterns
        ├── dart-rad-web/                     # Flutter-like lightweight single page web apps
        ├── dart-serverpod/                   # Full-stack Dart backends & auto-generated SDKs
        ├── dart-shelf-server/                # Low-overhead microservices with foundational Shelf
        ├── flutter-ai-integration/           # Conversational AI & streaming LLM chat in Flutter
        ├── flutter-code-review/              # Comprehensive multi-dimensional code auditing
        ├── flutter-core/                     # Adaptive Flutter development & lifecycle management
        ├── flutter-declarative-routing/      # Deep-linking & navigation with GoRouter
        ├── flutter-device-services/          # Biometrics, secure storage, and notifications
        ├── flutter-feature-architect/        # Feature-First Clean Architecture scaffolding
        ├── flutter-riverpod-expert/          # Modern Riverpod state management & AsyncValue
        ├── flutter-test-suite/               # Unit, ProviderContainer, Mocktail & Widget testing
        ├── flutter-ui-components/            # Responsive layouts, tokens & FormBuilder forms
        └── workspace-doctor/                 # Workspace health diagnostics and tool audits
`

---

## 🛡️ Core Rules

### espect_project_conventions.md
Ensures that whenever an agent assists on an existing codebase, it **strictly respects and adheres to existing architectural decisions, conventions, and state management solutions** (e.g. BLoC, MobX, Provider, Riverpod) and **never** forces opinionated rewrites unless explicitly directed by the developer.

---

## 🚀 How to Use

### 1. Project-Specific Customization (Workspace Scope)
Copy any skill or rule folder into your target project's .agents/ directory:
`ash
# Example: Adding Riverpod expert & clean architecture skills to a project
cp -r .agents/skills/flutter-riverpod-expert /path/to/my_project/.agents/skills/
cp -r .agents/skills/flutter-feature-architect /path/to/my_project/.agents/skills/
cp -r .agents/rules/* /path/to/my_project/.agents/rules/
`

### 2. Global Customization (All Workspaces)
Copy skills into your global Antigravity configuration directory:
`ash
# Windows
Copy-Item -Recurse -Force .agents\skills\* "C:\Users\ibrahimsuleiman\.gemini\config\skills\"

# macOS / Linux
cp -r .agents/skills/* ~/.gemini/config/skills/
`

---

## 📜 License
MIT License
