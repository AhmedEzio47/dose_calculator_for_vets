import 'package:bloc/bloc.dart';
import 'package:dose_calculator_for_vets/core/constants/app_constants.dart';
import 'package:dose_calculator_for_vets/domain/usecases/units/change_mass_unit_use_case.dart';
import 'package:dose_calculator_for_vets/domain/usecases/units/get_mass_unit_use_case.dart';

import '../../../../../core/use_case.dart';

part 'units_event.dart';
part 'units_state.dart';

class UnitsBloc extends Bloc<UnitsEvent, UnitsState> {
  static const kg = 'kg';
  static const lb = 'lb';
  final ChangeMassUnitUseCase changeMassUnitUseCase;
  final GetMassUnitUseCase getMassUnitUseCase;
  UnitsBloc(
      {required this.changeMassUnitUseCase, required this.getMassUnitUseCase})
      : super(UnitsState(MassUnitValues.kg)) {
    on<MassUnitChangedEvent>(_onMassUnitChangedEvent);
    on<MassUnitCachedRequestedEvent>(_onMassUnitRequestedEvent);
  }

  void _onMassUnitChangedEvent(MassUnitChangedEvent event, emit) async {
    changeMassUnitUseCase(
        ChangeMassUnitParams(state.massUnit == MassUnitValues.kg ? lb : kg));

    emit(UnitsState(state.massUnit == MassUnitValues.kg
        ? MassUnitValues.lb
        : MassUnitValues.kg));
    AppConstants.massUnit = state.massUnit;
  }

  void _onMassUnitRequestedEvent(
      MassUnitCachedRequestedEvent event, emit) async {
    final either = await getMassUnitUseCase(NoParams());
    either.fold((failure) {}, (unit) {
      MassUnitValues massUnit =
          unit == kg ? MassUnitValues.kg : MassUnitValues.lb;
      AppConstants.massUnit = massUnit;
      emit(UnitsState(massUnit));
    });
  }
}
