import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/model/activity/activity.dart';
import 'package:imitador/ui/section/activity/activity_section_cubit.dart';
import 'package:imitador/ui/section/section_router.dart';

@RoutePage()
class ActivitySectionRouter extends SectionRouter {
  final Activity activity;

  const ActivitySectionRouter({
    required this.activity,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (BuildContext context) => ActivitySectionCubit(activity: activity),
    child: const AutoRouter(),
  );
}
