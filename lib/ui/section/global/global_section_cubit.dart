import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_section_state.dart';

part 'global_section_cubit.freezed.dart';

class GlobalSectionCubit extends Cubit<GlobalSectionState> {
  GlobalSectionCubit() : super(const GlobalSectionState.state());
}
