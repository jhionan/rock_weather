part of 'weatherdetail_bloc.dart';

@immutable
abstract class WeatherDetailEvent {}

class FetchCityWeatherDetail extends WeatherDetailEvent {
  final TourModel cityWeather;
  final TourWeatherForecast forecast;

  FetchCityWeatherDetail({this.cityWeather, this.forecast});
}
