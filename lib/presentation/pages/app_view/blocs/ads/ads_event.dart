part of 'ads_bloc.dart';

abstract class AdsEvent {}

class LoadAdUnitEvent extends AdsEvent {
  final String adId;

  LoadAdUnitEvent(this.adId);
}
