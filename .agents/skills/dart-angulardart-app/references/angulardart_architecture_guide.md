# AngularDart Architecture & Lifecycle Guide

## Component Lifecycle Hooks

```
Constructor()
     │
     ▼
ngOnInit()           (Initial data fetches, setup subscriptions)
     │
     ▼
ngAfterChanges()     (Called after bound inputs change)
     │
     ▼
ngOnDestroy()        (Cancel streams, subscriptions, and timers)
```

---

## Directives Cheat Sheet

- `*ngIf="condition"`: Conditionally mounts or unmounts the DOM element.
- `*ngFor="let item of list; let i = index"`: Repeats the template for each collection element.
- `[class.active]="isActive"`: Dynamically toggles CSS classes based on boolean expression.
