---
name: dart-jaspr-web
description: Build modern, SEO-friendly web applications in pure Dart using Jaspr with Server-Side Rendering (SSR), Static Site Generation (SSG), native HTML/DOM components, and WebAssembly/JS hydration.
---

# Jaspr Web Framework (Native HTML & SSR)

## Purpose

Guide the development of high-performance web applications using Jaspr. Unlike Flutter Web (which renders to a canvas), Jaspr compiles to native HTML elements, CSS, and DOM structures, providing full SEO support, zero canvas overhead, and instant initial page loads.

---

## Supporting Resources in this Skill

- **SSR & Architecture Guide**: [`references/jaspr_ssr_guide.md`](./references/jaspr_ssr_guide.md)
- **Component Implementation**: [`examples/component_example.dart`](./examples/component_example.dart)
- **App Root Template**: [`templates/app_component.dart.tpl`](./templates/app_component.dart.tpl)

---

## Core Jaspr Concepts

1. **Flutter-like Syntax, Native HTML Output**:
   - Write components using `StatelessComponent` and `StatefulComponent`.
   - Output real HTML elements: `div(...)`, `span(...)`, `h1(...)`, `p(...)`, `button(...)`.
2. **Rendering Modes**:
   - **SSR (Server-Side Rendering)**: Rendered on the server (via Shelf/Dart Frog) and hydrated on the client.
   - **Static (SSG)**: Pre-rendered HTML files for static hosting (GitHub Pages, Vercel, Firebase).
   - **Client-Side (SPA)**: Pure client-side execution via WebAssembly (Wasm) or JavaScript.
3. **CSS-in-Dart**:
   - Define styles directly using `styles: Styles(...)` or `@css` annotations.
