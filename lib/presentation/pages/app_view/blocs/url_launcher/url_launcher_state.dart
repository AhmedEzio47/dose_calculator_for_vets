part of 'url_launcher_bloc.dart';

abstract class UrlLauncherState {}

class UrlLauncherInitial extends UrlLauncherState {}

class UrlLauncherFailure extends UrlLauncherState {}

class UrlLauncherSuccess extends UrlLauncherState {}
