part of 'suggestion_bloc.dart';

class SuggestionState {
  final BlocStatus status;
  final String? failureMessage;

  SuggestionState({this.status = BlocStatus.initial, this.failureMessage});
}
