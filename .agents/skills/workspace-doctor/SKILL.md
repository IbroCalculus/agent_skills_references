---
name: workspace-doctor
description: >-
  Analyzes and reports the health, configuration, and readiness of the current workspace.
  Use this skill whenever the user asks for a workspace diagnostic, project health check,
  or "doctor" inspection.
---

# Workspace Doctor

This skill provides a standardized diagnostic routine to assess the status, health, and setup of the current workspace.

## Diagnostic Workflow

When this skill is activated, execute the following steps in order:

1. **Workspace Inspection**:
   - Inspect the root directory and folder structure.
   - Check if version control (`.git`) is initialized.
   - Detect configuration files (e.g., `package.json`, `requirements.txt`, `tsconfig.json`, `.agents/`).

2. **Environment & Dependency Assessment**:
   - Identify project type and primary languages (e.g., Node.js, Python, Flutter, Go, Rust, or empty workspace).
   - Check if standard toolchains or dependencies are present.

3. **Produce Diagnostic Report**:
   Generate a markdown report following this exact structure:

   ```markdown
   # 🩺 Workspace Doctor Report

   **Overall Status**: [🟢 Healthy | 🟡 Needs Configuration | 🔴 Critical Issues]
   **Detected Stack**: [e.g. Node.js, Python, Unconfigured / Blank]

   ### 🔍 Diagnostic Checklist
   - [x] **Workspace Root**: Detected at `<path>`
   - [ ] **Git Repository**: [Initialized / Not Initialized]
   - [ ] **Dependencies**: [Installed / Missing]
   - [ ] **Configuration Files**: [Found files or None]
   - [ ] **Customizations**: [e.g. .agents/skills configured]

   ### 💡 Recommended Next Actions
   1. [First recommended action]
   2. [Second recommended action]
   3. [Third recommended action]
   ```

4. **Review Reference Example**:
   - See [sample-report.md](./examples/sample-report.md) for an example output.
