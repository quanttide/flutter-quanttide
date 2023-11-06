/// 微信云托管APIClient测试
///
/// Mock方案: https://pub.dev/packages/mockito

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_quanttide/flutter_quanttide.dart';


void main() {
  group('ApiService', () {
    late ApiClient apiService;

    setUp(() {
      apiService = ApiClient(apiRoot: 'https://api.example.com');
    });

    group('parseResponseData', () {
      test('should decode JSON response', () {
        final response = http.Response('{"message": "Hello"}', 200);
        final data = apiService.parseResponseData(response);
        expect(data, {'message': 'Hello'});
      });

      test('should return raw response body if JSON decoding fails', () {
        final response = http.Response('Invalid JSON', 200);
        final data = apiService.parseResponseData(response);
        expect(data, 'Invalid JSON');
      });
    });

    group('handleHttpException', () {
      test('should throw ServiceUnavailableException for status code 503', () {
        final response = http.Response('', 503);
        expect(
              () => apiService.handleHttpException(response),
          throwsA(const TypeMatcher<ServiceUnavailableException>()),
        );
      });

      test('should throw ClientException for other status codes', () {
        final response = http.Response('', 404);
        expect(
              () => apiService.handleHttpException(response),
          throwsA(const TypeMatcher<http.ClientException>()),
        );
      });
    });
  });
}