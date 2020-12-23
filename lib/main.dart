import 'package:flutter/material.dart';
import 'package:rock_weather/core/navigation/navigation_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        onGenerateRoute: AppRoutes.onGenerateRoute,
      );
}
