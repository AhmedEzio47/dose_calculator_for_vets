import 'package:bloc/bloc.dart';
import 'package:dose_calculator_for_vets/core/constants/enums.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../../domain/usecases/ads/load_ad_unit_use_case.dart';

part 'ads_event.dart';
part 'ads_state.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final LoadAdUnitUseCase loadAdUnitUseCase;
  AdsBloc(this.loadAdUnitUseCase) : super(AdsState()) {
    on<LoadAdUnitEvent>(_onLoadAdUnitEvent);
  }

  void _onLoadAdUnitEvent(LoadAdUnitEvent event, emit) async {
    final result = await loadAdUnitUseCase(LoadAdUnitParams(event.adId));
    result.fold((failure) => null,
        (ad) => emit(AdsState(status: BlocStatus.success, ad: ad)));
  }
}
