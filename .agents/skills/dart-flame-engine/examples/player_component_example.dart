import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PlayerComponent extends PositionComponent with CollisionCallbacks {
  final double speed = 200.0;
  Vector2 velocity = Vector2.zero();

  PlayerComponent({required Vector2 startPosition})
      : super(position: startPosition, size: Vector2.all(48));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Add hitbox for collision detection
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Delta-time multiplied movement
    position += velocity * speed * dt;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = Colors.blueAccent;
    canvas.drawRect(size.toRect(), paint);
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    print('Player collided with: ${other.runtimeType}');
  }
}
