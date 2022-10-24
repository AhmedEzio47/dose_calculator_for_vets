part of 'locale_bloc.dart';

@immutable
abstract class LocaleEvent {}

class LocaleChangedEvent extends LocaleEvent {
  final String locale;
  LocaleChangedEvent({required this.locale});
}

class LocaleCachedRequestedEvent extends LocaleEvent {}
