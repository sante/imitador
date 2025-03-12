import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/ui/section/activity/activity_section_cubit.dart';
import 'package:imitador/ui/section/section_router.dart';

@RoutePage()
class ActivitySectionRouter extends SectionRouter {
  final String? activityId;

  const ActivitySectionRouter({
    @PathParam('id') this.activityId,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (BuildContext context) =>
            ActivitySectionCubit(activityId: activityId ?? ""),
        child: const AutoRouter(),
      );
}
