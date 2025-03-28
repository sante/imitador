import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BaseButton extends StatelessWidget {
  final PhosphorIconData? leadingIcon;
  final PhosphorIconData? trailingIcon;
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle style;
  final Color iconColor;

  const BaseButton({
    super.key,
    required this.child,
    required this.style,
    required this.iconColor,
    this.leadingIcon,
    this.trailingIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          spacing: 8.w,
          children: [
            if (leadingIcon != null)
              PhosphorIcon(
                leadingIcon!,
                color: iconColor,
              ),
            child,
            if (trailingIcon != null)
              PhosphorIcon(
                trailingIcon!,
                color: iconColor,
              ),
          ],
        ),
      );
}

class PrimaryButton extends StatelessWidget {
  final PhosphorIconData? leadingIcon;
  final PhosphorIconData? trailingIcon;
  final String label;
  final Widget? loading;
  final VoidCallback? onPressed;

  const PrimaryButton(
      {super.key,
      required this.label,
      this.leadingIcon,
      this.trailingIcon,
      this.onPressed,
      this.loading});

  @override
  Widget build(BuildContext context) => BaseButton(
        style: context.theme.buttonsStyle.filledButton,
        iconColor: context.theme.colorScheme.onPrimary,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        onPressed: loading == null ? onPressed : null,
        child: loading ?? Text(label),
      );
}

class PrimaryOutlineButton extends StatelessWidget {
  final PhosphorIconData? leadingIcon;
  final PhosphorIconData? trailingIcon;
  final String label;
  final VoidCallback? onPressed;

  const PrimaryOutlineButton({
    super.key,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => BaseButton(
        style: context.theme.buttonsStyle.outlineButton,
        iconColor: context.theme.colorScheme.primary,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        onPressed: onPressed,
        child: Text(label),
      );
}

class SecondaryButton extends StatelessWidget {
  final PhosphorIconData? leadingIcon;
  final PhosphorIconData? trailingIcon;
  final String label;
  final VoidCallback? onPressed;

  const SecondaryButton({
    super.key,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => BaseButton(
        style: context.theme.buttonsStyle.secondaryFilledButton,
        iconColor: context.theme.colorScheme.onSecondary,
        leadingIcon: leadingIcon,
        trailingIcon: trailingIcon,
        onPressed: onPressed,
        child: Text(label),
      );
}

class SecondaryIconButton extends StatelessWidget {
  final PhosphorIconData icon;
  final VoidCallback? onPressed;

  const SecondaryIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onPressed,
        constraints: BoxConstraints(
          maxWidth: 56.w,
          maxHeight: 48.h,
        ),
        style: context.theme.buttonsStyle.secondaryFilledButton.copyWith(
          minimumSize: WidgetStatePropertyAll(Size(56.w, 48.h)),
        ),
        icon: PhosphorIcon(
          icon,
          color: context.theme.customColors.textColor?.getShade(500),
          size: 21.r,
        ),
      );
}
