import 'package:flame/components.dart';
import 'package:imitador/core/common/constants.dart';
import 'package:imitador/game/simon_game.dart';

class PaperBall extends SpriteComponent with HasGameRef<SimonGame> {
  PaperBall({
    this.updatePositionCallback,
  }) : super(size: Vector2.all(Constants.trackingSpriteSize), anchor: Anchor.center);

  final void Function(Vector2 position)? updatePositionCallback;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load("paper_ball.png");
  }

  @override
  void onGameResize(Vector2 size) {
    size = Vector2.all(Constants.trackingSpriteSize);
    super.onGameResize(size);
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
