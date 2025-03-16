import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/ui/theme/app_theme.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;
  final String label;
  final String? hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool enabled;

  const AppTextField({
    required this.controller,
    required this.label,
    required this.onChanged,
    this.hint,
    this.obscureText = false,
    this.keyboardType,
    this.enabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 392.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.h,
        children: [
          Text(
            label,
            style: context.theme.textStyles.bodySmall?.copyWith(
              color: context.theme.customColors.textColor,
            ),
          ),
          TextField(
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            keyboardType: keyboardType,
            enabled: enabled,
            style: context.theme.textStyles.bodyMedium?.copyWith(
              color: context.theme.colorScheme.onSurface,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: context.theme.textStyles.bodyMedium,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.theme.colorScheme.primary.getShade(300),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.theme.colorScheme.primary,
                  width: 1,
                ),
              ),
              filled: false,
              hoverColor: null,
            ),
          ),
        ],
      ),
    );
  }
}
