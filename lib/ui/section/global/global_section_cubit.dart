import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imitador/core/di/di_provider.dart';
import 'package:imitador/core/repository/session_repository.dart';
import 'package:imitador/model/user/user.dart';

part 'global_section_state.dart';

part 'global_section_cubit.freezed.dart';

class GlobalSectionCubit extends Cubit<GlobalSectionState> {
  final SessionRepository _sessionRepository = DiProvider.get();

  late StreamSubscription<User?> _userSubscription;

  GlobalSectionCubit() : super(const GlobalSectionState.state()) {
    _initStreams();
  }

  void _initStreams() {
    _userSubscription = _sessionRepository.getUserInfo().listen((user) {
      emit(state.copyWith(user: user));
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
