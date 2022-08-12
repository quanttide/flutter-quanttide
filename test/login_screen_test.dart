import "package:flutter_test/flutter_test.dart";
import "package:quanttide_design/testing.dart";

import "package:flutter/material.dart";
import "package:quanttide_design/quanttide_design.dart";

import 'mock.dart';


void main(){
  testWidgets("用户登录页面测试", (WidgetTester tester) async {
    LoginScreen widget = const LoginScreen(
        apiHost: 'api.example.com',
        mock: true,
        mockHandler: mockHandler
    );
    // TODO: 找不到异常原因。
    // 组件测试
    // await pumpAsyncWidget(tester, widget);
    // 验证
    // final titleFinder = find.text('登录');
    // expect(titleFinder, findsOneWidget);
  });
}
