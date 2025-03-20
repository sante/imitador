import 'package:flutter/material.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';

class SheetContainer extends StatelessWidget {
  final Widget? child;

  const SheetContainer({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.backgroundSheet.path),
            fit: BoxFit.cover,
          ),
          color: context.theme.colorScheme.onSurface,
        ),
        child: child,
      );
}
