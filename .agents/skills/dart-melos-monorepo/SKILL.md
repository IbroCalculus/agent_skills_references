---
name: dart-melos-monorepo
description: Manage multi-package Dart and Flutter monorepos using Melos, featuring local package symlinking, coordinated versioning, automated changelogs, and unified scripts.
---

# Melos Monorepo Management for Dart & Flutter

## Purpose

Standardize multi-package repository architecture in Dart and Flutter using Melos. Enables local package dependency linking, coordinated testing and code generation across all packages, automated versioning with Conventional Commits, and CI/CD task pipelines.

---

## Supporting Resources in this Skill

- **Command Reference Guide**: [`references/melos_commands_guide.md`](./references/melos_commands_guide.md)
- **Monorepo Configuration Template**: [`templates/melos.yaml.tpl`](./templates/melos.yaml.tpl)
- **Script Orchestration Examples**: [`examples/multi_package_script.yaml`](./examples/multi_package_script.yaml)

---

## Standard Monorepo Folder Structure

```
my_monorepo/
├── melos.yaml              # Monorepo configuration and unified script definitions
├── pubspec.yaml            # Root workspace declaration
├── packages/
│   ├── core/               # Shared utilities, failures, network client
│   ├── models/             # Domain entities and serialization DTOs
│   ├── api_client/         # Generated or bespoke API client SDK
│   └── ui_kit/             # Shared design system components
└── apps/
    ├── mobile_app/         # Flutter iOS/Android client
    └── web_admin/          # Web or dashboard client
```

---

## Core Melos Rules

1. **Bootstrap (`melos bootstrap`)**:
   - Never manually write path dependencies across internal packages. Melos links local packages seamlessly while keeping your `pubspec.yaml` clean for publishing.
2. **Conventional Commits**:
   - Enforce commit messages (`feat: ...`, `fix: ...`, `chore: ...`) to enable Melos automated changelog generation and semantic version bumps (`melos version`).
3. **Topological Script Execution**:
   - When running build_runner, code generation, or migrations, execute in dependency order (`order: topological`) so dependent packages compile after their prerequisites.
