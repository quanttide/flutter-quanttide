import 'package:flutter_test/flutter_test.dart';
import 'package:quanttide_design/quanttide_design.dart';


void main(){
  test('convertKeysToCamel测试', (){
    // 测试数据
    Map<String, dynamic> raw = {
      'created_at': '2022-02-22',
      'lecture_list': [
        {
          'section_no': 1
        }
      ]
    };
    // 测试数据
    Map<String, dynamic> expected = {
      'createdAt': '2022-02-22',
      'lectureList': [
        {
          'sectionNo': 1
        }
      ]
    };
    // 运行测试
    Map<String, dynamic> result = convertKeysToCamel(raw);
    expect(result, expected);
  });
}