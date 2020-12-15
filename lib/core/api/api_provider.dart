import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod/riverpod.dart';
import 'package:rock_weather/core/api/base_api.dart';
import 'package:rock_weather/core/api/api_config_model.dart';
import 'package:meta/meta.dart';

@visibleForTesting
final apiConfigProvider = FutureProvider<ApiConfigModel>((ref) async {
  final Map<String, Object> content = json.decode(
    await rootBundle.loadString('assets/configuration/api.json'),
  );
  return ApiConfigModel.fromJson(content);
});

final apiProvider = FutureProvider<BaseApi>((ref) async {
  ApiConfigModel config = await ref.watch(apiConfigProvider.future);
  return BaseApi(config);
});
