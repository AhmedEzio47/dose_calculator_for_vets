import 'package:dose_calculator_for_vets/core/locale/app_localization.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';

abstract class Failure {
  late String _message;
  Failure({String? message}) {
    if (message == null || message.isEmpty) {
      if (this is ServerFailure) {
        _message = AppLocalizations.instance
            .translate(TranslationKeys.serverException);
      } else if (this is CacheFailure) {
        _message =
            AppLocalizations.instance.translate(TranslationKeys.cacheException);
      } else if (this is UnexpectedFailure) {
        _message = AppLocalizations.instance
            .translate(TranslationKeys.unexpectedException);
      } else {
        _message = AppLocalizations.instance
            .translate(TranslationKeys.unexpectedException);
      }
    } else {
      _message = message;
    }
  }

  String? get message => _message;

  @override
  List<Object?> get props => [_message];
}

class UnexpectedFailure extends Failure {}

// General failures
class ServerFailure extends Failure {
  ServerFailure({String? message}) : super(message: message);

  @override
  List<Object?> get props => [];
}

class ReadFileFailure extends Failure {
  ReadFileFailure({String? message}) : super(message: message);

  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  CacheFailure({String? message}) : super(message: message);

  @override
  List<Object?> get props => [];
}

class QrFailure extends Failure {
  QrFailure({String? message}) : super(message: message);
  @override
  List<Object?> get props => [];
}
