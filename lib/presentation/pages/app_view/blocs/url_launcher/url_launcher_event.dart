part of 'url_launcher_bloc.dart';

abstract class UrlLauncherEvent {}

class UrlLaunched extends UrlLauncherEvent {
  final String url;

  UrlLaunched({required this.url});
}
