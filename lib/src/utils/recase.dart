import 'package:recase/recase.dart';


/// 蛇形命名的键转驼峰形
Map<String, dynamic> convertKeysToCamel(Map<String, dynamic> data){
  // https://api.dart.dev/stable/2.15.1/dart-core/Map/map.html
  return data.map((key, value){
    if (value is Map<String, dynamic>){
      // 对字典做递归
      value = convertKeysToCamel(value);
    }
    else if (value is List<Map<String, dynamic>>){
      // 对列表的每个元素做递归
      value = value.map((item) => convertKeysToCamel(item)).toList();
    }
    // https://pub.dev/packages/recase
    return MapEntry(key.camelCase, value);
  });
}