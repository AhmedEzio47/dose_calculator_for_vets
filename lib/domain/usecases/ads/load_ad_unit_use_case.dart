import 'package:dartz/dartz.dart';
import 'package:dose_calculator_for_vets/core/failures.dart';
import 'package:dose_calculator_for_vets/core/use_case.dart';
import 'package:dose_calculator_for_vets/domain/repositories/ads_repo.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class LoadAdUnitUseCase extends UseCase<BannerAd, LoadAdUnitParams> {
  final AdsRepo adsRepo;

  LoadAdUnitUseCase(this.adsRepo);

  @override
  Future<Either<Failure, BannerAd>> call(params) async {
    return await adsRepo.loadAdUnit(params.adId);
  }
}

class LoadAdUnitParams {
  final String adId;

  LoadAdUnitParams(this.adId);
}
