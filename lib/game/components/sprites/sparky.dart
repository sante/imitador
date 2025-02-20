import 'package:flame/components.dart';
import 'package:imitador/core/common/constants.dart';
import 'package:imitador/game/simon_game.dart';

class Sparky extends SpriteComponent with HasGameRef<SimonGame> {
  Sparky({
    this.updatePositionCallback,
  }) : super(size: Vector2.all(Constants.trackingSpriteSize), anchor: Anchor.center);

  final void Function(Vector2 position)? updatePositionCallback;

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad
    sprite = await Sprite.load("sparky.png");
  }

  @override
  void update(double dt) {
    super.update(dt);
    final currentPosition = Vector2(position.x, position.y);
    updatePositionCallback?.call(currentPosition);
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  void moveTo(Vector2 vector) {
    position.setFrom(vector);
  }
}
