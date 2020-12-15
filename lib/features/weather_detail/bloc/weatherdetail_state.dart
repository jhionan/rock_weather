part of 'weatherdetail_bloc.dart';

@immutable
abstract class WeatherDetailState {}

class WeatherDetailInitial extends WeatherDetailState {
  final TourModel cityWeather;

  WeatherDetailInitial(this.cityWeather);
}

class WeatherDetailFetched extends WeatherDetailState {
  final TourModel cityWeather;
  final TourWeatherForecast forecast;
  WeatherDetailFetched({
    this.cityWeather,
    this.forecast,
  });
}
