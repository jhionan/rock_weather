class ApiConfigModel {
  static const baseKey = 'base';
  static const versionKey = 'version';
  static const apiKeyKey = 'appid';
  final String base;
  final String version;
  final String key;

  ApiConfigModel.fromJson(Map<String, Object> json)
      : base = '${json[baseKey]}'.replaceFirst('{$versionKey}', json[versionKey]),
        version = json[versionKey],
        key = json[apiKeyKey];
}
