import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'results_state.dart';

part 'results_cubit.freezed.dart';

class ResultsCubit extends Cubit<ResultsState> {
  ResultsCubit() : super(const ResultsState.state());
}
