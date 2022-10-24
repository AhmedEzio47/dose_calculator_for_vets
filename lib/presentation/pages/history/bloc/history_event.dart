part of 'history_bloc.dart';

abstract class HistoryEvent {}

class GetHistoryEvent extends HistoryEvent {}

class DeleteItemEvent extends HistoryEvent {
  final int index;

  DeleteItemEvent(this.index);
}
