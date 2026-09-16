---
name: dart-mason-bricks
description: Create, customize, and scaffold reusable code generators and architectural templates using Mason CLI and bricks with Mustache variable substitution and pre/post-generation hooks.
---

# Mason Bricks Code Generation & Scaffolding

## Purpose

Standardize automated template creation and code generation across Dart and Flutter codebases using Mason. Enables building reusable "bricks" with Mustache variable interpolation, conditional file emission, and Dart hooks (`pre_gen.dart`, `post_gen.dart`).

---

## Supporting Resources in this Skill

- **Brick Syntax & Mustache Guide**: [`references/mason_brick_syntax.md`](./references/mason_brick_syntax.md)
- **Brick Configuration Template**: [`templates/brick.yaml.tpl`](./templates/brick.yaml.tpl)
- **Post-Generation Hook Example**: [`examples/post_gen.dart`](./examples/post_gen.dart)

---

## Core Mason Workflow

```bash
# 1. Install Mason CLI globally
dart pub global activate mason_cli

# 2. Initialize mason in repository
mason init

# 3. Create a new custom brick template
mason new my_feature_brick

# 4. Install local or remote bricks
mason get

# 5. Generate code from a brick
mason make my_feature_brick --name "auth"
```

---

## Brick Structure

```
my_brick/
├── brick.yaml            # Metadata, variable definitions, and types
├── hooks/
│   ├── pre_gen.dart      # Runs BEFORE template files are written
│   └── post_gen.dart     # Runs AFTER template files are written (e.g., flutter pub get)
└── __brick__/
    └── {{name.snakeCase()}}/
        └── {{name.snakeCase()}}_screen.dart
```
