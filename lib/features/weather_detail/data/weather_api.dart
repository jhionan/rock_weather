import 'package:dio/dio.dart';
import 'package:rock_weather/core/api/base_api.dart';
import 'package:rock_weather/features/tour_home/data/weather_models.dart';

abstract class WeatherDetailApi {
  Stream<Forecast> getForecastWeather(String query);
}

class WeatherDetailApiImp implements WeatherDetailApi {
  BaseApi _api;

  WeatherDetailApiImp(ApiFactoryDelegate apiFactoryDelegate) {
    apiFactoryDelegate().then((value) => _api = value);
  }

  @override
  Stream<Forecast> getForecastWeather(String query) async* {
    yield* BaseApi.ready.asyncMap((event) async {
      if (event) {
        Response response = await _api.instance.get('forecast',
            queryParameters: _api.query(query),
            options: _api.requestOption(query));
        if (response != null && response.statusCode == 200) {
          return Forecast.fromJson(response.data);
        }
        throw response.data;
      }
    }).where((event) => event!=null);
  }
}
