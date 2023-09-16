import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_quanttide/utils.dart';


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

  test('Convert keys to snake case', () {
    final originalData = {
      'firstName': 'John',
      'lastName': 'Doe',
      'contactInfo': {
        'emailAddress': 'john.doe@example.com',
        'phoneNumber': '1234567890',
      },
      'orders': [
        {
          'orderId': '12345',
          'orderDate': '2022-01-01',
        },
        {
          'orderId': '67890',
          'orderDate': '2022-02-01',
        },
      ],
    };

    final expectedData = {
      'first_name': 'John',
      'last_name': 'Doe',
      'contact_info': {
        'email_address': 'john.doe@example.com',
        'phone_number': '1234567890',
      },
      'orders': [
        {
          'order_id': '12345',
          'order_date': '2022-01-01',
        },
        {
          'order_id': '67890',
          'order_date': '2022-02-01',
        },
      ],
    };

    final convertedData = convertKeysToSnake(originalData);

    expect(convertedData, expectedData);
  });
}