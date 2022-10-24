import 'package:dartz/dartz.dart';

import '../../core/failures.dart';

abstract class UrlLauncherRepo {
  Future<Either<Failure, void>> launchUrl({required String url});
}
