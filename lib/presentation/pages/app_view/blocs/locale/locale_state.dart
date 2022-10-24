part of 'locale_bloc.dart';

@immutable
abstract class LocaleState {}

class LocaleInitial extends LocaleState {}

class ReadyLocaleState extends LocaleState {
  final String locale;

  ReadyLocaleState({required this.locale});
}
