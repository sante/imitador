import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MotionDropDown<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String label;
  final String hint;
  final void Function(T?)? onChanged;
  final bool light;

  const MotionDropDown({
    super.key,
    required this.value,
    required this.items,
    required this.label,
    required this.hint,
    this.onChanged,
    this.light = true,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 460.w,
        child: Column(
          spacing: 8.h,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: context.theme.textTheme.bodySmall,
            ),
            DropdownButton<T>(
              isExpanded: true,
              icon: PhosphorIcon(
                PhosphorIcons.caretDown(),
                color: light
                    ? context.theme.colorScheme.surface
                    : context.theme.colorScheme.surface,
              ),
              style: context.theme.textStyles.bodyLarge?.copyWith(
                color: light
                    ? context.theme.colorScheme.surface
                    : context.theme.colorScheme.onSurface,
              ),
              hint: Text(
                hint,
                style: context.theme.textStyles.bodyLarge?.copyWith(
                  color: light
                      ? context.theme.colorScheme.surface
                      : context.theme.colorScheme.onSurface,
                ),
              ),
              value: value,
              items: items
                  .map(
                    (e) => DropdownMenuItem<T>(
                      value: e,
                      child: Text(
                        e.toString(),
                        style: context.theme.textStyles.bodyLarge?.copyWith(
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ],
        ),
      );
}
