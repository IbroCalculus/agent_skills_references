# Jaspr SSR & Hosting Guide

## CLI Commands

```bash
# 1. Install Jaspr CLI globally
dart pub global activate jaspr_cli

# 2. Create a new Jaspr project
jaspr create my_website

# 3. Start local development server with hot reload
jaspr serve

# 4. Build for production
jaspr build --mode=ssr   # For server-side rendering
jaspr build --mode=static # For static hosting (JAMstack)
```

---

## Flutter Web vs Jaspr

| Feature | Flutter Web | Jaspr |
| :--- | :--- | :--- |
| **Rendering** | Skia/Impeller HTML5 Canvas | Native HTML5 DOM elements |
| **SEO & Crawlers** | Difficult (Canvas based) | 100% Native SEO (Standard HTML) |
| **Bundle Size** | ~1.5 - 3 MB minimum | ~50 - 150 KB |
| **Accessibility (a11y)**| Emulated semantics | Native browser semantics |
| **Syntax** | Widget Tree | Component Tree (near identical) |
