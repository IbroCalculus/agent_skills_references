---
name: dart-dcli-automation
description: Write robust, cross-platform CLI scripts, DevOps automation, and system administration tools in pure Dart using DCli and native ahead-of-time (AOT) compilation.
---

# DCli System Automation & Scripting

## Purpose

Replace bash, zsh, and PowerShell scripts with type-safe, maintainable Dart using `dcli`. Enables interactive command-line prompts, file/directory manipulation, process execution with pipe forwarding, and compiling single scripts to native standalone executables.

---

## Supporting Resources in this Skill

- **DCli API & Function Guide**: [`references/dcli_commands_guide.md`](./references/dcli_commands_guide.md)
- **Automated Backup Script**: [`examples/system_backup_script.dart`](./examples/system_backup_script.dart)
- **CLI Script Template**: [`templates/cli_script.dart.tpl`](./templates/cli_script.dart.tpl)

---

## Core DCli Operations

1. **File & Directory Management**:
   - `createDir('/path', recursive: true)`
   - `copy('/source', '/target')`
   - `delete('/file')`
   - `find('*.dart', workingDirectory: '.').forEach(print)`
2. **Process Execution & Piping**:
   - `'git status'.run;`
   - `final branch = 'git branch --show-current'.firstLine;`
3. **Interactive Prompts & Colors**:
   - `final username = ask('Enter username:');`
   - `print(green('Success!'));`
   - `print(red('Failure!'));`
4. **Native Compilation**:
   - `dcli compile my_script.dart` compiles to a standalone, zero-dependency native binary.
