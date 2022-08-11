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
    APIClient apiClient = APIClient(
        mock: true,
        mockClientHandler: mockClientHandler
    );
    test('正常GET请求', () async {
      dynamic responseData = await apiClient.requestAPI(
          httpMethod: 'GET',
          apiRoot: 'api.example.com',
          apiPath: '/get'
      );
      expect(responseData['key'], 'value');
    });
    test('正常POST请求', () async {
      dynamic responseData = await apiClient.requestAPI(
          httpMethod: 'POST',
          apiRoot: 'api.example.com',
          apiPath: '/post',
          data: {'key1': 'value1'}
      );
      // mock把请求报文作为相应报文直接返回以模拟动态API。
      expect(responseData['key1'], 'value1');
    });
    test('响应类型不是JSON的请求', () async {
      dynamic responseData = await apiClient.requestAPI(
          httpMethod: 'GET',
          apiRoot: 'api.example.com',
          apiPath: '/return-no-json'
      );
      expect(responseData, 'OK');
    });
    test('服务端冷启动中', () async {
      try {
        await apiClient.requestAPI(
            httpMethod: 'GET',
            apiRoot: 'api.example.com',
            apiPath: '/cold-start'
        );
      } catch(e){
        expect(e, isInstanceOf<ServiceUnavailableException>());
      }
    });
    test('请求失败', () async {
      try {
        await apiClient.requestAPI(
            httpMethod: 'GET',
            apiRoot: 'api.example.com',
            apiPath: '/failed'
        );
      } catch(e){
        expect(e, isInstanceOf<http.ClientException>());
      }
    });
  });
}
