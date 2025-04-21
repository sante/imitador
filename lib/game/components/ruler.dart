import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/logger.dart';
import 'package:imitador/ui/theme/app_text_styles.dart';

class RulerComponent extends PositionComponent {
  final Paint paint = Paint()
    ..color = const Color(0xFFFFC748)
    ..style = PaintingStyle.fill;

  final mainTicksPaint = Paint()
    ..color = const Color(0xFF805500)
    ..style = PaintingStyle.fill
    ..strokeWidth = 7.r;

  final subTicksPaint = Paint()
    ..color = const Color(0xFF805500)
    ..style = PaintingStyle.fill
    ..strokeWidth = 2.r;

  final double minDistance;
  final double maxDistance;
  final double padding;

  RulerComponent({
    required super.size,
    required super.position,
    required super.anchor,
    required this.minDistance,
    required this.maxDistance,
    required this.padding,
  });

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size = Vector2(width, height);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRRect(
      RRect.fromRectAndRadius(size.toRect(), Radius.circular(16.r)),
      paint,
    );
    // Logger.d("Min and max distances: $minDistance, $maxDistance");
    final mainTicksCount = ((maxDistance - minDistance)).toInt();
    for (int i = minDistance.toInt(); i <= maxDistance.toInt(); i++) {
      canvas.drawLine(
        Offset(
            padding +
                ((i - minDistance.toInt()) *
                    (size.x - padding * 2) /
                    mainTicksCount),
            0),
        Offset(
            padding +
                ((i - minDistance.toInt()) *
                    (size.x - padding * 2) /
                    mainTicksCount),
            19.5.h),
        mainTicksPaint,
      );
      TextSpan span = TextSpan(
        style: spaceGroteskTextStyle(
          16.sp,
          FontWeight.w400,
          null,
        ),
        text: i.toString(),
      );
      TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(
          canvas,
          Offset(
            padding +
                ((i - minDistance.toInt()) *
                    (size.x - padding * 2) /
                    mainTicksCount) -
                8,
            22.h,
          ));
      if (i != maxDistance.toInt()) {
        for (int j = 1; j < 10; j++) {
          canvas.drawLine(
            Offset(
                padding +
                    ((i - minDistance.toInt()) *
                        (size.x - padding * 2) /
                        mainTicksCount) +
                    j * (size.x - padding * 2) / (mainTicksCount * 10),
                0),
            Offset(
                padding +
                    ((i - minDistance.toInt()) *
                        (size.x - padding * 2) /
                        mainTicksCount) +
                    j * (size.x - padding * 2) / (mainTicksCount * 10),
                j == 5 ? 18.h : 14.5.h),
            subTicksPaint,
          );
        }
      }
    }
  }
}
