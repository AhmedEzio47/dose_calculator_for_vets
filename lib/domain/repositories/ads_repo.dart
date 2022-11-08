import 'package:dartz/dartz.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../core/failures.dart';

abstract class AdsRepo {
  void init();
  Future<Either<Failure, BannerAd>> loadAdUnit(String adId);
}
