import 'package:dose_calculator_for_vets/core/constants/app_constants.dart';

class Formatters {
  static String formatDecimals(num n) {
    return n.toStringAsFixed(
        n.truncateToDouble() == n ? 0 : AppConstants.decimalPrecision);
  }
}
