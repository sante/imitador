import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'level_state.dart';

part 'level_cubit.freezed.dart';

class LevelCubit extends Cubit<LevelState> {
  LevelCubit() : super(const LevelState.state());
}
