import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rock_weather/features/tour_home/data/tour_model.dart';
import 'package:rock_weather/features/weather_detail/data/tour_weather_forecast.dart';
import 'package:rock_weather/features/weather_detail/data/weather_datasource.dart';

part 'weatherdetail_event.dart';
part 'weatherdetail_state.dart';

class WeatherDetailBloc extends Bloc<WeatherDetailEvent, WeatherDetailState> {
  final WeatherDetailDataSource _dataSource;
  WeatherDetailBloc(this._dataSource, {TourModel selectedCity})
      : super(WeatherDetailInitial(selectedCity)) {
    _fetchForecast(selectedCity);
  }

  @override
  Stream<WeatherDetailState> mapEventToState(
    WeatherDetailEvent event,
  ) async* {
    switch (event.runtimeType) {
      case FetchCityForecast:
        FetchCityForecast currentEvent = event;
        yield WeatherDetailFetched(
            cityWeather: currentEvent.cityWeather,
            forecast: currentEvent.forecast);
        break;
    }
  }

  void _fetchForecast(TourModel selectedCity) {
    _dataSource.getForecastForQuery(selectedCity.city).listen((event) {
     add(FetchCityForecast(cityWeather: selectedCity, forecast: event));
    });
  }
}
