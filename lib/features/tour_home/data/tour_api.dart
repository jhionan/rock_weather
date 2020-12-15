import 'package:dio/dio.dart';
import 'package:rock_weather/core/api/base_api.dart';
import 'package:rock_weather/features/tour_home/data/weather_models.dart';

abstract class TourApi {
  Stream<ForecastCurrent> getCurrentWeather(String city);
}

class TourApiImp implements TourApi {
  TourApiImp(ApiFactoryDelegate apiFactoryDelegate) {
    apiFactoryDelegate().then((value) => _api = value);
  }
  BaseApi _api;

  @override
  Stream<ForecastCurrent> getCurrentWeather(String city) async* {
    yield* BaseApi.ready.asyncMap((event) async {
      if (event) {
        Response response = await _api.instance.get('weather',
            queryParameters: _api.query(city),
            options: _api.requestOption(city));
        if (response != null && response.statusCode == 200) {
          return ForecastCurrent.fromJson(response.data);
        }
        throw response.data;
      }
    }).where((event) => event!=null);
  }
}
