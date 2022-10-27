import 'package:dartz/dartz.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../../core/failures.dart';
import '../../domain/repositories/url_launcher_repo.dart';

class UrlLauncherRepoImpl implements UrlLauncherRepo {
  @override
  Future<Either<Failure, void>> launchUrl({required String url}) async {
    try {
      if (!await url_launcher.launch(url)) {
        throw Exception('Could not launch $url');
      }
      return const Right(null);
    } catch (ex) {
      return Left(UnexpectedFailure());
    }
  }
}
