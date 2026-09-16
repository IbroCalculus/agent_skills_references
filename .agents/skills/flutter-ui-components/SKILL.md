---
name: flutter-ui-components
description: Build responsive Flutter user interfaces, reusable custom widgets, FormBuilder forms with validation, cohesive theme tokens, and smooth micro-animations.
---

# Flutter UI Components & Responsive Layouts

## Purpose

Provide structured patterns for building polished, responsive, and maintainable user interfaces in Flutter. Enforces breakpoint responsiveness, reusable component extraction, robust form state management with `flutter_form_builder`, and cohesive Material 3 theming.

---

## Supporting Resources in this Skill

- **Breakpoint & Design Tokens Guide**: [`references/ui_tokens_and_breakpoints.md`](./references/ui_tokens_and_breakpoints.md)
- **Responsive Screen Implementation**: [`examples/responsive_layout_example.dart`](./examples/responsive_layout_example.dart)
- **Validated FormBuilder Screen**: [`examples/form_builder_example.dart`](./examples/form_builder_example.dart)
- **Shimmer Loading Skeleton**: [`examples/shimmer_card_widget.dart`](./examples/shimmer_card_widget.dart)

---

## UI Engineering Rules

1. **Responsive Adaptability**:
   - Use `LayoutBuilder` over hardcoded screen measurements (`MediaQuery.of(context).size.width`).
   - Define canonical breakpoints: Mobile (< 600dp), Tablet (600 - 1024dp), Desktop (> 1024dp).
2. **Form Management with `flutter_form_builder`**:
   - Group related inputs inside `FormBuilder` with a designated `GlobalKey<FormBuilderState>()`.
   - Use `FormBuilderValidators` (`compose([required(), email(), minLength(6)])`).
   - Never manage 10 separate `TextEditingController` instances when a structured form builder can bind them to a single map.
3. **No Magic Numbers**:
   - Always extract colors, spacing, corner radii, and padding to design tokens or `Theme.of(context)` styles.
4. **Shimmer Over Blank Spinners**:
   - For content lists, cards, and profile screens, prefer animated shimmer placeholder skeletons over isolated modal spinners for a perceived faster load time.
