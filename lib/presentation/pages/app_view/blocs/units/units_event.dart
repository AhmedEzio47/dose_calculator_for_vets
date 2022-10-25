part of 'units_bloc.dart';

abstract class UnitsEvent {}

class MassUnitChangedEvent extends UnitsEvent {
  MassUnitChangedEvent();
}

class MassUnitCachedRequestedEvent extends UnitsEvent {}
