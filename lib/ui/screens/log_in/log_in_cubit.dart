import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_in_state.dart';

part 'log_in_cubit.freezed.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(const LogInState.state());
}
