import 'package:flutter/material.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';

class SheetContainer extends StatelessWidget {
  final Widget? child;
  final double? maxWidth;
  final double? maxHeight;
  final BoxBorder? border;

  const SheetContainer({
    super.key,
    this.child,
    this.maxWidth,
    this.maxHeight,
    this.border,
  });

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? double.infinity,
          maxHeight: maxHeight ?? double.infinity,
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.backgroundSheet.path),
              fit: BoxFit.cover,
            ),
            color: context.theme.colorScheme.onSurface,
            border: border,
          ),
          child: child,
        ),
      );
}
