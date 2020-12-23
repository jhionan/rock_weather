import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rock_weather/core/api/api_config_model.dart';
import 'package:rxdart/rxdart.dart';

typedef ApiFactoryDelegate = Future<BaseApi> Function();

class BaseApi {
  BaseApi(this._apiconfig) {
    _dio = Dio();
    _dio.options.baseUrl = _apiconfig.base;
    _dio.interceptors.add(DioCacheManager(CacheConfig(
      baseUrl: _apiconfig.base,
    )).interceptor);
    _dio.interceptors.add(PrettyDioLogger());
    ready.add(true);
  }

  final ApiConfigModel _apiconfig;
  Dio _dio;
  static BehaviorSubject<bool> ready = BehaviorSubject.seeded(false);

  dispose() {
    ready.close();
  }

  Dio get instance => _dio;

  Map<String, String> query(String query) {
    return {
      'q': query,
      'appid': _apiconfig.key,
      'lang': 'pt_BR',
      'units': 'metric'
    };
  }

  Options requestOption(String query) => buildCacheOptions(Duration(days: 7),
      forceRefresh: true, maxStale: Duration(days: 7), subKey: 'q=$query');
}
