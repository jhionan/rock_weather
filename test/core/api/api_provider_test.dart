import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';
import 'package:rock_weather/core/api/api_config_model.dart';
import 'package:rock_weather/core/api/api_provider.dart';
import 'package:rock_weather/core/api/base_api.dart';

main() {
  test('ApiConfigModel Serialization', () {
    String apiConfigJson = '''{
    "base": "http://api.openweathermap.org/data/{version}/",
    "version": "2.5",
    "appid": "931d1353b69a1ab6acb49332e80e9353"
}''';

    expect(
        ApiConfigModel.fromJson(jsonDecode(apiConfigJson)),
        isA<ApiConfigModel>()
            .having((apiConfig) => apiConfig.version, 'version is 2.5', '2.5')
            .having((apiConfig) => apiConfig.base, 'base have version in it',
                'http://api.openweathermap.org/data/2.5/'));
  });
  testWidgets('create ApiConfig from json asset', (tester) async {
    final container = ProviderContainer();
    ApiConfigModel config = await container.read(apiConfigProvider.future);
    expect(
        config,
        isA<ApiConfigModel>()
            .having((config) => config.version, 'config version = 2.5', '2.5'));

    BaseApi _api = await container.read(apiProvider.future);
    expect(
        _api,
        isA<BaseApi>().having((baseApi) => baseApi.instance,
            'Instance of dio must not be null', isNotNull));
  });

  
}
