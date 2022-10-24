import 'package:bloc/bloc.dart';

import '../../../../../core/themes/themes.dart';
import '../../../../../core/use_case.dart';
import '../../../../../domain/usecases/themes/change_theme_use_case.dart';
import '../../../../../domain/usecases/themes/get_theme_use_case.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ChangeThemeUseCase changeThemeUseCase;
  final GetThemeUseCase getThemeUseCase;
  ThemeBloc({required this.changeThemeUseCase, required this.getThemeUseCase})
      : super(ThemeState(ThemesValues.dark)) {
    on<ThemeChangedEvent>(_onThemeChangedEvent);
    on<ThemeCachedRequestedEvent>(_onThemeRequestedEvent);
  }

  void _onThemeChangedEvent(ThemeChangedEvent event, emit) async {
    changeThemeUseCase(ThemeParams(
        theme: state.theme == ThemesValues.dark
            ? Themes.lightTheme
            : Themes.darkTheme));
    emit(ThemeState(state.theme == ThemesValues.dark
        ? ThemesValues.light
        : ThemesValues.dark));
  }

  void _onThemeRequestedEvent(ThemeCachedRequestedEvent event, emit) async {
    final either = await getThemeUseCase(NoParams());
    either.fold((failure) {}, (theme) {
      emit(ThemeState(
          theme == Themes.lightTheme ? ThemesValues.light : ThemesValues.dark));
    });
  }
}
