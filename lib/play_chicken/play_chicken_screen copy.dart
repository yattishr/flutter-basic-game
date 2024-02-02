import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class PlayChickenScreen extends SpriteAnimationComponent
    with HasGameReference, CollisionCallbacks {
  double chickenScaleFactor = 3.0;

  late SpriteComponent chickenSprite;
  late SpriteAnimationComponent chicken;

  @override
  Future<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'chicken_run.png',
      SpriteAnimationData.sequenced(
          stepTime: 0.1, amount: 14, textureSize: Vector2(32, 34)),
    );
    chicken = SpriteAnimationComponent()
      ..animation = animation
      ..size = Vector2(32, 34) * chickenScaleFactor;
    add(chicken);
  }
}