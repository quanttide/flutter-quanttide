/// 微信云托管APIClient测试
///
/// Mock方案: https://pub.dev/packages/mockito

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:quanttide_design/src/utils/api_client.dart';
import 'mock.dart';


void main() {
  group('APIClient测试', () {
    // 打桩
    WXCloudRunAPIClient apiClient = WXCloudRunAPIClient(
        mock: true,
        mockClientHandler: mockClientHandler
    );
    test('正常请求', () async {
      dynamic responseData = await apiClient.requestAPI(
          httpMethod: 'GET',
          apiRoot: 'api.example.com',
          apiPath: '/path'
      );
      expect(responseData['key'], 'value');
      // expect(response.stream, 'OK');
    });
    test('冷启动', () async {
      await apiClient.requestAPI(
          httpMethod: 'GET',
          apiRoot: 'api.example.com',
          apiPath: '/cold_start'
      );
    }, skip: 'TODO:待重新设计');
    test('请求失败', () async {
      await apiClient.requestAPI(
          httpMethod: 'GET',
          apiRoot: 'api.example.com',
          apiPath: '/failed'
      );
    }, skip: 'TODO:待重新设计');
  });
}
