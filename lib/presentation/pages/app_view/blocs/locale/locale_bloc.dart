import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/locale/locale_constants.dart';
import '../../../../../core/use_case.dart';
import '../../../../../domain/usecases/locale/change_locale_use_case.dart';
import '../../../../../domain/usecases/locale/get_locale_use_case.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final ChangeLocaleUseCase changeLocaleUseCase;
  final GetLocaleUseCase getLocaleUseCase;
  LocaleBloc(
      {required this.changeLocaleUseCase, required this.getLocaleUseCase})
      : super(LocaleInitial()) {
    on<LocaleChangedEvent>(_onLocaleChanged);
    on<LocaleCachedRequestedEvent>(_onCachedRequested);
  }

  void _onLocaleChanged(LocaleChangedEvent event, Emitter<LocaleState> emit) {
    changeLocaleUseCase(LocaleParams(locale: event.locale));
    emit(ReadyLocaleState(locale: event.locale));
  }

  void _onCachedRequested(
      LocaleCachedRequestedEvent event, Emitter<LocaleState> emit) async {
    final either = await getLocaleUseCase(NoParams());
    either.fold((failure) {}, (locale) {
      emit(ReadyLocaleState(locale: locale ?? kDefaultLanguage));
      currentLanguage = locale ?? kDefaultLanguage;
    });
  }
}
