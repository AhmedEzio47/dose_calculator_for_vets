import 'package:dose_calculator_for_vets/core/locale/app_localization.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';

class EmptyInputException implements Exception {}

class ServerException implements Exception {
  final String? message;
  ServerException({
    this.message,
  });

  @override
  String toString() => message ?? '';

  factory ServerException.fromJson(Map<String, dynamic> json) {
    late String message;
    if (json['message'] != null) {
      message = json['message'];
    } else {
      message = AppLocalizations.instance.translate(TranslationKeys.howToUse);
    }
    return ServerException(
      message: message,
    );
  }
}
