part of 'ads_bloc.dart';

class AdsState {
  final BannerAd? ad;
  final BlocStatus status;

  AdsState({this.ad, this.status = BlocStatus.initial});
}
