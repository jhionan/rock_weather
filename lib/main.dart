import 'package:flutter/material.dart';
import 'package:rock_weather/core/navigation/navigation_config.dart';
import 'package:rock_weather/features/home/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Home(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      );
}
