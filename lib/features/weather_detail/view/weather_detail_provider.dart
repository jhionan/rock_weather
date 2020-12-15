import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverpod/riverpod.dart';
import 'package:rock_weather/core/api/api_provider.dart';
import 'package:rock_weather/core/api/base_api.dart';
import 'package:rock_weather/features/tour_home/data/tour_model.dart';
import 'package:rock_weather/features/weather_detail/bloc/weatherdetail_bloc.dart';
import 'package:rock_weather/features/weather_detail/data/weather_api.dart';
import 'package:rock_weather/features/weather_detail/data/weather_datasource.dart';
import 'package:rock_weather/features/weather_detail/view/weather_detail.dart';

class WeatherDetailProvider extends StatelessWidget {
  final TourModel selectedCity;

  const WeatherDetailProvider({Key key, this.selectedCity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        ApiFactoryDelegate apiFactoryDelegate =
            () => ProviderContainer().read(apiProvider.future);
        return WeatherDetailBloc(WeatherDetailDataSource(WeatherDetailApiImp(apiFactoryDelegate)), selectedCity: selectedCity);
      },
      child: WeatherDetail(),
    );
  }
}
