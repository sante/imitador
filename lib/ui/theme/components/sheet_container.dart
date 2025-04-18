import 'package:flutter/material.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';

class SheetContainer extends StatelessWidget {
  final Widget? child;
  final double? maxWidth;
  final double? maxHeight;

  const SheetContainer({
    super.key,
    this.child,
    this.maxWidth,
    this.maxHeight,
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
          ),
          child: child,
        ),
      );
}
