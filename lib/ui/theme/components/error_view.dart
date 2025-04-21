import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/color_extensions.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';

class ErrorView extends StatelessWidget {
  final String error;

  const ErrorView({
    required this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.error.getShade(100),
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(
            color: context.theme.colorScheme.error.getShade(300),
            width: 1.r,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Row(
            children: [
              Assets.icons.icError.svg(
                colorFilter: ColorFilter.mode(
                  context.theme.colorScheme.error.getShade(300),
                  BlendMode.srcIn,
                ),
                width: 24.r,
                height: 24.r,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  error,
                  style: context.theme.textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
