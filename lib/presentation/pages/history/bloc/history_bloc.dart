import 'package:bloc/bloc.dart';
import 'package:dose_calculator_for_vets/core/constants/enums.dart';
import 'package:dose_calculator_for_vets/core/use_case.dart';

import '../../../../domain/entities/calculation_entity.dart';
import '../../../../domain/usecases/calculations/delete_calculation_use_case.dart';
import '../../../../domain/usecases/calculations/get_calculations_use_case.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final GetCalculationsUseCase getCalculationsUseCase;
  final DeleteCalculationUseCase deleteCalculateUseCase;
  HistoryBloc({
    required this.getCalculationsUseCase,
    required this.deleteCalculateUseCase,
  }) : super(const HistoryState()) {
    on<GetHistoryEvent>(_onGetHistoryEvent);
    on<DeleteItemEvent>(_onDeleteItemEvent);
  }

  _onGetHistoryEvent(GetHistoryEvent event, emit) async {
    emit(const HistoryState(status: BlocStatus.loading));
    final result = await getCalculationsUseCase(NoParams());
    result.fold(
        (failure) => HistoryState(
            status: BlocStatus.failure, failureMessage: failure.message),
        (calculations) => emit(HistoryState(
            status:
                calculations.isEmpty ? BlocStatus.empty : BlocStatus.success,
            calculations: calculations)));
  }

  _onDeleteItemEvent(DeleteItemEvent event, emit) async {
    final result =
        await deleteCalculateUseCase(DeleteCalculationParams(event.index));
    result.fold(
        (failure) => HistoryState(
            status: BlocStatus.failure,
            failureMessage: failure.message), (success) {
      add(GetHistoryEvent());
    });
  }
}
