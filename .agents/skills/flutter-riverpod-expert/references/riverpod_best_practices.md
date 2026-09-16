# Riverpod Best Practices & Anti-Patterns

## Rule of Thumb Checklist

- [ ] **Are you using `AsyncNotifier` for async state?** (Avoid deprecated `StateNotifier` for new code).
- [ ] **Is `ref.read` only used inside callbacks?** (Never call `ref.read` inside `Widget.build()`).
- [ ] **Is `ref.watch` used inside `Widget.build()`?** (Never call `ref.watch` inside `onPressed` or lifecycle methods).
- [ ] **Are you preventing full-page rebuilds?** (Extract subtrees into `ConsumerWidget` or use `.select()`).
- [ ] **Are providers properly auto-disposed?** (Add `.autoDispose` to ephemeral feature screens to prevent memory leaks).

---

## Anti-Patterns to Avoid

| Anti-Pattern | Why it Fails | Correct Solution |
| :--- | :--- | :--- |
| `ref.watch` in `onPressed` | Can cause runtime errors or unnecessary rebuild triggers during event handling. | Use `ref.read(provider.notifier).method()`. |
| `ref.read` in `build()` | Widget will not update when provider emits new values. | Use `ref.watch(provider)`. |
| Manual `bool isLoading` flags with `StateProvider` | Fragile, easily desynchronizes from real network states. | Use `AsyncNotifier<T>` and `AsyncValue<T>`. |
| Placing HTTP requests directly in widgets | Breaches architecture, untestable UI. | Inject repository into notifier. |
