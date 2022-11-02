import 'package:advertising_id/advertising_id.dart';
import 'package:dartz/dartz.dart';
import 'package:dose_calculator_for_vets/core/failures.dart';
import 'package:dose_calculator_for_vets/core/utils/logger.dart';
import 'package:dose_calculator_for_vets/domain/repositories/ads_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsRepoImpl implements AdsRepo {
  @override
  void init() async {
    MobileAds.instance.initialize();

    if (kDebugMode) {
      String? advertisingId = await AdvertisingId.id(true);
      Logger.debugLog('Ad id: $advertisingId');
      if (advertisingId != null) {
        MobileAds.instance.updateRequestConfiguration(
            RequestConfiguration(testDeviceIds: [advertisingId]));
      }
    }
  }

  @override
  Future<Either<Failure, BannerAd>> loadAdUnit(String adId) async {
    final BannerAd banner = BannerAd(
      adUnitId: adId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );
    try {
      await banner.load();
      return Right(banner);
    } catch (ex) {
      Logger.debugLog(ex);
      return Left(UnexpectedFailure());
    }
  }
}

const String kHomeAdUnitId = 'ca-app-pub-6848570690692467/5480369539';
