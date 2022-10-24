part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class ThemeChangedEvent extends ThemeEvent {
  ThemeChangedEvent();
}

class ThemeCachedRequestedEvent extends ThemeEvent {}
