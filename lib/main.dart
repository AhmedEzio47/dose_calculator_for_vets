import 'package:dose_calculator_for_vets/presentation/pages/app_view/app_view.dart';
import 'package:flutter/material.dart';

import 'di/di.dart' as di;

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}
