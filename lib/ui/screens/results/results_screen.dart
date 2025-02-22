import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'results_cubit.dart';

@RoutePage()
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => ResultsCubit(),
        child: _ResultsContentScreen(),
      );
}

class _ResultsContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container();
}
