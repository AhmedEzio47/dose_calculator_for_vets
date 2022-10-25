import 'package:dose_calculator_for_vets/domain/entities/calculation_entity.dart';

class Converters {
  static num convertKgToLb(num kgs) {
    return kgs * 2.20462;
  }

  static num convertLbToKg(num lbs) {
    return lbs / 2.20462;
  }

  static num convertMgPerLbToMgPerKg(num mgPerLb) {
    return mgPerLb * 2.20462;
  }

  static num convertMgPerKgToMgPerLb(num mgPerKg) {
    return mgPerKg * 0.453592;
  }

  static CalculationEntity convertKgCalToLbCal(CalculationEntity cal) {
    return CalculationEntity(
      concentration: cal.concentration,
      quantity: cal.quantity,
      dosePerUnitMass: convertMgPerKgToMgPerLb(cal.dosePerUnitMass),
      animalMass: convertKgToLb(cal.animalMass),
      description: cal.description,
    );
  }

  static CalculationEntity convertLbCalToKgCal(CalculationEntity cal) {
    return CalculationEntity(
      concentration: cal.concentration,
      quantity: cal.quantity,
      dosePerUnitMass: convertMgPerLbToMgPerKg(cal.dosePerUnitMass),
      animalMass: convertLbToKg(cal.animalMass),
      description: cal.description,
    );
  }

  static num roundToDecimalPlaces(num x, {int places = 2}) {
    return num.parse((x * 0.453592).toStringAsFixed(places));
  }
}
