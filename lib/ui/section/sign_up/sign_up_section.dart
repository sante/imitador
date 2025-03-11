import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imitador/ui/section/section_router.dart';
import 'package:imitador/ui/section/sign_up/sign_up_section_cubit.dart';

@RoutePage()
class SignUpSectionRouter extends SectionRouter {
  const SignUpSectionRouter({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<SignUpSectionCubit>(
        create: (context) => SignUpSectionCubit(),
        child: const AutoRouter(),
      );
}
