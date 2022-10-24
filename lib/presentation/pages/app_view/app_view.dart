import 'package:dose_calculator_for_vets/presentation/pages/app_view/blocs/url_launcher/url_launcher_bloc.dart';
import 'package:dose_calculator_for_vets/presentation/pages/home/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/locale/app_localization.dart';
import '../../../core/locale/locale_constants.dart';
import '../../../core/locale/locale_resolution_callback.dart';
import '../../../core/themes/themes.dart';
import '../../../di/di.dart';
import '../../routes/app_routes.dart';
import 'blocs/locale/locale_bloc.dart';
import 'blocs/theme/theme_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di<ThemeBloc>()..add(ThemeCachedRequestedEvent()),
        ),
        BlocProvider(
          create: (_) => di<LocaleBloc>(),
        ),
        BlocProvider(
          create: (_) => di<CalculatorBloc>(),
        ),
        BlocProvider(
          create: (_) => di<UrlLauncherBloc>(),
        ),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, localeState) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp(
                title: AppConstants.appName,
                color: AppColors.primaryColor,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRoutes.generateRoute,
                initialRoute: AppRoutes.home,
                theme: Themes.buildTheme(
                    context: context,
                    theme: themeState.theme == ThemesValues.light
                        ? Themes.lightTheme
                        : Themes.darkTheme),
                locale: _locale(localeState),
                localizationsDelegates: localizationDelegates,
                localeResolutionCallback: getSelectedLang,
                supportedLocales: supportedLocale,
              );
            },
          );
        },
      ),
    );
  }

  Locale _locale(LocaleState state) {
    if (state is ReadyLocaleState) {
      return AppLocalizations.langToLocale(state.locale);
    }
    return AppLocalizations.langToLocale(kDefaultLanguage);
  }
}
