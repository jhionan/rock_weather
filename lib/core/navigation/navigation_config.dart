import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_weather/features/tour_home/view/tour_provider.dart';
import 'package:rock_weather/features/weather_detail/view/weather_detail_provider.dart';

class AppRoutes {
  static const String home = '/';
  static const String detail = '/detail';
  static Route<Object> onGenerateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case home:
        page = BlocProvider(
          create: (context) => null,
          child: TourProvider(),
        );
        break;
      case detail:
        page = BlocProvider(
          create: (context) => null,
          child: WeatherDetailProvider(
            selectedCity: settings.arguments,
          ),
        );
        break;
      default:
        page = BlocProvider(
          create: (context) => null,
          child: TourProvider(),
        );
        break;
    }
    return MaterialPageRoute(builder: (context) => page);
  }
}
