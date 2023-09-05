import 'package:flutter_test/flutter_test.dart';
import 'package:quanttide_design/flutter_quanttide.dart';


void main(){
  group('convertKeysToCamel测试', (){
    // 测试数据
    Map<String, dynamic> rawMap = {
      'created_at': '2022-02-22',
      'lecture_list': [
        {
          'section_no': 1
        }
      ]
    };
    List<Map<String, dynamic>> rawList = [rawMap];
    Map<String, dynamic> expectedMap = {
      'createdAt': '2022-02-22',
      'lectureList': [
        {
          'sectionNo': 1
        }
      ]
    };
    List<Map<String, dynamic>> expectedList = [expectedMap];
    test('Map类型', (){
      // 运行测试
      Map<String, dynamic> result = convertKeysToCamel(rawMap);
      expect(result, expectedMap);
    });
    test('List类型', (){
      // 运行测试
      // 不能放List<Map<String, dynamic>>类型，报错
      // `type 'List<dynamic>' is not a subtype of type 'List<Map<String, dynamic>>'`
      List<dynamic> result = convertKeysToCamel(rawList);
      expect(result, expectedList);
    });
  });
}