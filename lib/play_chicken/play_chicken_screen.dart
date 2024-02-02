import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';

class PlayChickenScreen extends FlameGame {
  late SpriteAnimationComponent chicken;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    print('load game assets');

    // 1. load the sprite sheet
    final spriteSheet = await images.load('chicken_run.png');
    final spriteSize = Vector2(32, 34);

    // 2. Sprite animationData
    final animationData = SpriteAnimationData.sequenced(
      amount: 14,
      stepTime: 0.1,
      textureSize: spriteSize,
    );

    // 3. Create the animation
    chicken =
        SpriteAnimationComponent.fromFrameData(spriteSheet, animationData);

    // 4. Position the chicken on the screen
    chicken.position = Vector2(100, 100);

    // 5. Set the size to make the sprite bigger.
    chicken.size = Vector2(64, 68);

    // 6. Add the chicken to the game
    add(chicken);
  }

  // animate the Sprite to move from Right to Left
  @override
  void update(double dt) {
    // Move the chicken towards the left
    chicken.position.x -= 100 * dt;

    // Check if the chicken is off the left side of the screen
    if (chicken.position.x + chicken.size.x < 0) {
      // Reset the chicken to the right side of the screen
      chicken.position.x = size.x;
    }
    // Call the parent update method
    super.update(dt);
  }
}
