---
name: dart-rad-web
description: Build lightweight, fast single-page web apps in Dart using Rad, featuring Flutter-like widget trees, state management, and direct HTML DOM rendering without canvas overhead.
---

# Rad HTML DOM Framework

## Purpose

Guide the development of lightweight web applications using Rad. Rad enables writing Flutter-style declarative widget trees (`StatefulWidget`, `StatelessWidget`, `Navigator`) while directly emitting native HTML DOM elements with zero Skia or CanvasKit footprint.

---

## Supporting Resources in this Skill

- **Widget to HTML Tag Matrix**: [`references/rad_widgets_matrix.md`](./references/rad_widgets_matrix.md)
- **Sample Rad Web Application**: [`examples/rad_app_example.dart`](./examples/rad_app_example.dart)
- **Custom Widget Template**: [`templates/rad_widget.dart.tpl`](./templates/rad_widget.dart.tpl)

---

## Core Rad Principles

1. **Flutter Paradigm, Web Reality**:
   - Uses Flutter terminology: `BuildContext`, `setState`, `StatelessWidget`, `StatefulWidget`, `Key`.
   - Every widget directly maps to real browser DOM nodes (`<div>`, `<span>`, `<button>`, `<h1>`).
2. **Instant Loading**:
   - Does not download CanvasKit or WebAssembly runtimes. Ideal for small, instant-loading tools, embeddable widgets, and lightweight dashboards.
3. **Mounting to the DOM**:
   - `runApp(app: MyWidget(), targetId: 'output')` mounts the widget tree into the designated HTML container element.
