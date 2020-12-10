import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_weather/features/home/view/home.dart';
import 'package:rock_weather/features/weather_detail/view/weather_detail.dart';

class AppRoutes {
  static const String home = '/';
  static const String detail = '/detail';
  static Route<Object> onGenerateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case home:
        page = BlocProvider(
          create: (context) => null,
          child: Home(),
        );
        break;
      case detail:
        page = BlocProvider(
          create: (context) => null,
          child: WeatherDetail(),
        );
        break;
      default:
        page = BlocProvider(
          create: (context) => null,
          child: Home(),
        );
        break;
    }
    return MaterialPageRoute(builder: (context) => page);
  }
}
