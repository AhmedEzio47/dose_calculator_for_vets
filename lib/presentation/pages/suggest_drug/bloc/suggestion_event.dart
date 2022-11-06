part of 'suggestion_bloc.dart';

abstract class SuggestionEvent {}

class SuggestionSubmitted extends SuggestionEvent {
  final String name;
  final String notes;

  SuggestionSubmitted({required this.name, required this.notes});
}
