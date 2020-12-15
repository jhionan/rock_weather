import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';
import 'package:rock_weather/core/api/api_config_model.dart';
import 'package:rock_weather/core/api/api_provider.dart';

main() {
  testWidgets('create ApiConfig from json asset', (tester) async {
    final container = ProviderContainer();
    ApiConfigModel config = await container.read(apiConfigProvider.future);
    expect(
        config,
        isA<ApiConfigModel>()
            .having((config) => config.version, 'config version = 2.5', '2.5'));
  });
}
