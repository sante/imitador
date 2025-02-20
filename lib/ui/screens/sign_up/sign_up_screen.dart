import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_up_cubit.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => SignUpCubit(),
        child: _SignUpContentScreen(),
      );
}

class _SignUpContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container();
}
