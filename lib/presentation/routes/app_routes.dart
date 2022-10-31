import 'package:dose_calculator_for_vets/presentation/pages/history/bloc/history_bloc.dart';
import 'package:dose_calculator_for_vets/presentation/pages/history/history_page.dart';
import 'package:dose_calculator_for_vets/presentation/pages/home/home_page.dart';
import 'package:dose_calculator_for_vets/presentation/pages/how_to_use/how_to_use_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String splash = '/splash';
  static const String home = '/home';
  static const String history = '/history';
  static const String howToUse = '/howToUse';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    late Map args;
    _currentRoute = settings.name;
    if (settings.arguments != null) {
      args = settings.arguments as Map;
    }

    switch (_currentRoute) {
      case AppRoutes.initialRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.history:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => di<HistoryBloc>()..add(GetHistoryEvent()),
                  child: const HistoryPage(),
                ));
      case AppRoutes.howToUse:
        return MaterialPageRoute(builder: (_) => const HowToUsePage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }

  static String? _currentRoute;
}
