part of 'history_bloc.dart';

class HistoryState {
  final BlocStatus status;
  final List<CalculationEntity> calculations;
  final String? failureMessage;

  const HistoryState(
      {this.status = BlocStatus.initial,
      this.calculations = const [],
      this.failureMessage});
}
