import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/gen/assets.gen.dart';

class ScoreTable extends StatelessWidget {
  final Map<String, int> scores;
  final bool finalResults;

  const ScoreTable({
    required this.scores,
    this.finalResults = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 40.h,
        children: [
          Text(
            finalResults
                ? context.localizations.final_scores
                : context.localizations.partial_scores,
            style: context.theme.textTheme.headlineLarge,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 12.h,
              children: [
                ...scores.entries
                    .sortedByDescending((it) => it.value)
                    .mapIndexed(
                      (index, entry) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 12.w,
                        children: [
                          if (finalResults) scoreLeading(index),
                          Flexible(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                entry.key,
                                style: scoreTextStyle(context, index),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Text(
                            entry.value.toString(),
                            style: scoreTextStyle(context, index),
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
        ],
      );
}

TextStyle? scoreTextStyle(BuildContext context, int index) => switch (index) {
      0 => context.theme.textTheme.headlineMedium,
      1 => context.theme.textTheme.headlineSmall,
      2 => context.theme.textTheme.headlineSmall?.copyWith(
          fontSize: 20.sp,
        ),
      _ => context.theme.textTheme.bodyMedium,
    }
        ?.copyWith(
      color: context.theme.colorScheme.surface,
    );

Widget scoreLeading(int index) => switch (index) {
      0 => Image(
          image: AssetImage(Assets.images.medalGold.path),
          width: 42.5.w,
          height: 70.h,
        ),
      1 => Image(
          image: AssetImage(Assets.images.medalSilver.path),
          width: 36.3.w,
          height: 60.h,
        ),
      2 => Image(
          image: AssetImage(Assets.images.medalBronze.path),
          width: 31.5.w,
          height: 52.5.h,
        ),
      _ => Text(
          (index + 1).toString(),
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
    };
