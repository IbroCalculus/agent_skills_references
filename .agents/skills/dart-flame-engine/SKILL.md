---
name: dart-flame-engine
description: Build 2D games and gamified mobile experiences in Dart and Flutter using Flame Engine, featuring the Flame Component System (FCS), Forge2D physics, collision detection, and sprite animations.
---

# Flame 2D Game Engine

## Purpose

Guide the design and implementation of 2D games using Flame Engine in Dart/Flutter. Covers the Flame Component System (FCS), game loop lifecycle (`update`/`render`), sprite animations, collision detection, camera viewports, and touch/keyboard input.

---

## Supporting Resources in this Skill

- **Game Loop & Component Architecture**: [`references/flame_game_loop_guide.md`](./references/flame_game_loop_guide.md)
- **Player Component Implementation**: [`examples/player_component_example.dart`](./examples/player_component_example.dart)
- **Game Root Scaffold**: [`templates/game_scaffold.dart.tpl`](./templates/game_scaffold.dart.tpl)

---

## Core Flame Principles

1. **Flame Component System (FCS)**:
   - Everything in the game (players, enemies, backgrounds, projectiles) is a `Component`.
   - Components form a tree (similar to Flutter widgets) and have `onLoad()`, `update(dt)`, and `render(canvas)` lifecycles.
2. **Delta Time (`dt`) for Frame-Rate Independence**:
   - Always multiply movement velocities by `dt` (seconds passed since last frame):
     `position.x += speed * dt;`
3. **Collision Detection via Hitboxes**:
   - Add `HasCollisionDetection` mixin to your `FlameGame`.
   - Add `RectangleHitbox` or `CircleHitbox` to components and implement `CollisionCallbacks` (`onCollisionStart`, `onCollisionEnd`).
4. **Integration with Flutter Widgets**:
   - Render the game inside Flutter using `GameWidget(game: myFlameGame)`.
   - Add Flutter UI overlays (scoreboards, pause menus) via `GameWidget(overlayBuilderMap: {...})`.
