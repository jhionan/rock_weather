import 'package:rock_weather/features/weather_detail/data/tour_weather_forecast.dart';
import 'package:rock_weather/features/weather_detail/data/weather_api.dart';

class WeatherDetailDataSource {
  final WeatherDetailApi _api;

  WeatherDetailDataSource(this._api);

  Stream<TourWeatherForecast> getForecastForQuery(String query) async* {
    yield* _api.getForecastWeather(query).map((event) {
      print(event);
      return TourWeatherForecast(
          city: event.city.name,
          dayForecast: event?.list
              ?.map(
                (weather) => TourForecastDay(
                    dateTime: weather.dt,
                    description: weather?.weather?.isNotEmpty ?? false
                        ? weather?.weather?.elementAt(0)?.description ?? ''
                        : '',
                    temperature: weather?.main?.temp),
              )
              ?.toList());
    });
  }
}
