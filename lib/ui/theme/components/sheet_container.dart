import 'package:flutter/material.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';

class SheetContainer extends StatelessWidget {
  final Widget? child;
  final BoxBorder? border;

  const SheetContainer({
    super.key,
    this.child,
    this.border,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.backgroundSheet.path),
            fit: BoxFit.cover,
          ),
          color: context.theme.colorScheme.onSurface,
          border: border,
        ),
        child: child,
      );
}
