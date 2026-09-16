import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame with HasCollisionDetection {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Initialize components, world map, and cameras here
  }
}

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GameWidget<MyGame>.controlled(
          gameFactory: MyGame.new,
          overlayBuilderMap: {
            'pauseMenu': (context, game) => Center(
                  child: ElevatedButton(
                    onPressed: () => game.overlays.remove('pauseMenu'),
                    child: const Text('Resume'),
                  ),
                ),
          },
        ),
      ),
    );
  }
}
