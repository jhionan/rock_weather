part of 'weatherdetail_bloc.dart';

@immutable
abstract class WeatherDetailEvent {}

class FetchCityForecast extends WeatherDetailEvent {
  final TourModel cityWeather;
  final TourWeatherForecast forecast;

  FetchCityForecast({this.cityWeather, this.forecast});
}
