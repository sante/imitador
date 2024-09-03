import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_cubit.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => LoginCubit(),
        child: _LoginContentScreen(),
      );
}

class _LoginContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) => Center(
          child: Text(
            "Hi: ${state.user?.username}",
          ),
        ),
      );
}
