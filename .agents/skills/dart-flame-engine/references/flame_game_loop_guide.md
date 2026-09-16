# Flame Game Loop & Architecture Reference

## Game Loop Architecture

```
[Flutter Frame Pipeline]
          │
          ▼
FlameGame.update(double dt)   <-- Updates positions, physics, AI logic
          │
          ▼
FlameGame.render(Canvas c)    <-- Draws components and sprites to screen
          │
          ▼
Flutter UI Overlays           <-- Optional HUD/score overlays rendered on top
```

---

## Essential Flame Extensions

- **`flame_audio`**: Sound effects and background music streaming.
- **`flame_forge2d`**: Box2D rigid-body physics engine (gravity, friction, impulses).
- **`flame_tiled`**: Tilemap rendering created with Tiled map editor.
- **`flame_svg`**: Scalable vector graphics rendering.
