import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/game_session_repository.dart';
import 'package:imitador/model/activity/activity.dart';
import 'package:imitador/ui/router/app_router.dart';
import 'package:imitador/ui/section/global/global_section_cubit.dart';
import 'package:imitador/ui/theme/app_text_field.dart';
import 'package:imitador/ui/theme/app_theme.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/components/cards.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';
import 'package:imitador/ui/theme/components/sheet_container.dart';

@RoutePage()
class CreateSessionScreen extends StatefulWidget {
  const CreateSessionScreen({super.key});

  @override
  State<CreateSessionScreen> createState() => _CreateSessionScreenState();
}

class _CreateSessionScreenState extends State<CreateSessionScreen> {
  final GameSessionRepository _sessionRepository = DiProvider.get();
  Activity? selectedActivity;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MotionScaffold(
      showTitle: false,
      simpleBackground: true,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 92.w, vertical: 36.h),
          child: BlocBuilder<GlobalSectionCubit, GlobalSectionState>(
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 40.h,
              children: [
                Text(
                  context.localizations.choose_game_for_session,
                  style: context.theme.textStyles.headlineLarge
                      ?.copyWith(color: Colors.white),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  _ActivityCards(
                    activities: state.activities ?? [],
                    selectedActivity: selectedActivity,
                    onActivitySelected: (activity) {
                      setState(() {
                        if (selectedActivity == activity) {
                          selectedActivity = null;
                        } else {
                          selectedActivity = activity;
                        }
                      });
                    },
                  ),
                  SizedBox(height: 42.h),
                  PrimaryButton(
                    onPressed: selectedActivity != null
                        ? () async {
                            await _sessionRepository.createGameSession(
                              selectedActivity!.id,
                              state.user!.id,
                            );
                            if (context.mounted) {
                              context.router.navigate(
                                const GameSessionSectionRoute(),
                              );
                            }
                          }
                        : null,
                    label: context.localizations.create_session_button,
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class _ActivityCards extends StatelessWidget {
//   final List<Activity> activities;
//   final void Function(Activity)? onActivitySelected;
//   final Activity? selectedActivity;

//   const _ActivityCards({
//     required this.activities,
//     super.key,
//     this.onActivitySelected,
//     this.selectedActivity,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: activities
//           .map(
//             (it) => ActivityCard(
//               activity: it,
//               onPressed: () => onActivitySelected?.call(it),
//               selected: selectedActivity == it,
//             ),
//           )
//           .toList(),
//     );
//   }
// }

class _ActivityCards extends StatelessWidget {
  final List<Activity> activities;
  final void Function(Activity)? onActivitySelected;
  final Activity? selectedActivity;

  const _ActivityCards({
    required this.activities,
    super.key,
    this.onActivitySelected,
    this.selectedActivity,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorRow(
      children: activities
          .map(
            (it) => ActivityCard(
              customHeight: 250.h,
              customWidth: 394.w,
              activity: it,
              onPressed: () => onActivitySelected?.call(it),
              selected: selectedActivity == it,
            ),
          )
          .toList(),
    );
  }
}

class _SelectorRow extends StatelessWidget {
  final List<Widget> children;

  const _SelectorRow({required this.children, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Wrap(
          spacing: context.theme.dimensions.spacing24.w,
          runSpacing: context.theme.dimensions.spacing24.h,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: children,
        ),
      );
}
