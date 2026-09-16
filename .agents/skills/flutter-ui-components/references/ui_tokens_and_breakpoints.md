# UI Tokens & Responsive Breakpoints

## Screen Breakpoints

```dart
abstract class Breakpoints {
  static const double mobileMax = 599.0;
  static const double tabletMin = 600.0;
  static const double tabletMax = 1023.0;
  static const double desktopMin = 1024.0;
}
```

---

## Responsive Helper

```dart
enum DeviceType { mobile, tablet, desktop }

DeviceType getDeviceType(BoxConstraints constraints) {
  if (constraints.maxWidth >= Breakpoints.desktopMin) return DeviceType.desktop;
  if (constraints.maxWidth >= Breakpoints.tabletMin) return DeviceType.tablet;
  return DeviceType.mobile;
}
```

---

## Spacing & Insets Tokens

- `Spacing.xs = 4.0`
- `Spacing.sm = 8.0`
- `Spacing.md = 16.0`
- `Spacing.lg = 24.0`
- `Spacing.xl = 32.0`
- `Spacing.xxl = 48.0`
