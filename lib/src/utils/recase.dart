import 'package:recase/recase.dart';

/// 蛇形命名的键转驼峰形
Map<String, dynamic> convertKeysToCamel(Map<String, dynamic> data){
  // https://api.dart.dev/stable/2.15.1/dart-core/Map/map.html
  return data.map((key, value){
    // https://pub.dev/packages/recase
    return MapEntry(key.camelCase, value);
  });
}