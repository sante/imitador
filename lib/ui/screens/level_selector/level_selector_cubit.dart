import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'level_selector_state.dart';

part 'level_selector_cubit.freezed.dart';

class LevelSelectorCubit extends Cubit<LevelSelectorState> {
  LevelSelectorCubit() : super(const LevelSelectorState.state());
}
