import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/ui/section/error_handler/global_event_handler_cubit.dart';
import 'package:imitador/ui/section/global/global_section_cubit.dart';
import 'package:imitador/ui/section/section_router.dart';

@RoutePage()
class GlobalSectionRouter extends SectionRouter {
  const GlobalSectionRouter({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<GlobalEventHandlerCubit>(
            create: (BuildContext context) => GlobalEventHandlerCubit(),
          ),
          BlocProvider<GlobalSectionCubit>(
              create: (context) => GlobalSectionCubit(),
          ),
        ],
        child: BlocListener<GlobalEventHandlerCubit, GlobalEventHandlerState>(
          listener: _handleStateChanges,
          child: const AutoRouter(),
        ),
      );

  void _handleStateChanges(
    BuildContext context,
    GlobalEventHandlerState event,
  ) =>
      event.when(
        idle: () => {},
        error: (errorType) => _showError(errorType, context),
        loading: () => {},
      );

  void _showError(
    GlobalEventHandlerStateError errorType,
    BuildContext context,
  ) =>
      switch (errorType) {
        UnknownError(retry: final retry) => _showDialog(
            context,
            context.localizations.error_unknown_error_title,
            context.localizations.error_unknown_error_description,
            retry,
          ),
        InternetError(retry: final retry) => _showDialog(
            context,
            context.localizations.error_no_internet_connection_error_title,
            context
                .localizations.error_no_internet_connection_error_description,
            retry,
          ),
        GeneralError(
          title: final titleLarge,
          description: final description,
          retry: final retry
        ) =>
          _showDialog(context, titleLarge, description, retry),
      };

  void _showDialog(
    BuildContext context,
    String? title,
    String description,
    VoidCallback? retry,
  ) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            title ?? context.localizations.error_unknown_error_title,
          ),
          content: Text(description),
          actions: <Widget>[
            if (retry != null)
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.localizations.error_button_retry),
              ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.localizations.error_button_ok),
            ),
          ],
        ),
      );
}
