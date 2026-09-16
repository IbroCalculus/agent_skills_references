---
name: dart-angulardart-app
description: Build enterprise single-page web applications (SPAs) using AngularDart, featuring two-way data binding, dependency injection, component trees, and template syntax.
---

# AngularDart Enterprise Web Framework

## Purpose

Guide the development and maintenance of enterprise single-page web applications using AngularDart. Enforces hierarchical component architecture, `@Component` annotations, typed template bindings, service providers, and lifecycle hooks (`OnInit`, `OnDestroy`).

---

## Supporting Resources in this Skill

- **Architecture & Lifecycle Guide**: [`references/angulardart_architecture_guide.md`](./references/angulardart_architecture_guide.md)
- **Component Implementation**: [`examples/hero_component.dart`](./examples/hero_component.dart)
- **Component Template**: [`templates/component.dart.tpl`](./templates/component.dart.tpl)

---

## Core AngularDart Concepts

1. **`@Component` Declarations**:
   - Every UI element is an annotated Dart class with a HTML template and CSS stylesheet:
     ```dart
     @Component(
       selector: 'my-app',
       template: '<h1>{{title}}</h1>',
       directives: [coreDirectives],
       providers: [ClassProvider(DataService)],
     )
     class AppComponent {
       String title = 'Hello AngularDart';
     }
     ```
2. **Template Directives & Bindings**:
   - Property binding: `[property]="expression"`
   - Event binding: `(click)="handleClick()"`
   - Two-way binding: `[(ngModel)]="name"`
   - Structural directives: `*ngIf="isVisible"`, `*ngFor="let item of items"`.
3. **Dependency Injection**:
   - Inject services into component constructors via `@Injectable()` and `ClassProvider`.
