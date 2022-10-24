import 'package:dartz/dartz.dart';

import '../../../core/failures.dart';
import '../../../core/use_case.dart';
import '../../repositories/url_launcher_repo.dart';

class LaunchUrlUseCase extends UseCase<void, UrlParams> {
  final UrlLauncherRepo urlLauncherRepo;

  LaunchUrlUseCase(this.urlLauncherRepo);
  @override
  Future<Either<Failure, void>> call(UrlParams params) {
    return urlLauncherRepo.launchUrl(url: params.url);
  }
}

class UrlParams {
  final String url;

  UrlParams({required this.url});
}
