import 'package:flutter/material.dart';
import "package:flutter_test/flutter_test.dart";


/// 组件pump
///
/// ```dart
/// Widget widget = ...;
/// await pumpWidget(tester, widget);
/// ```
///
/// Ref:
///   - https://docs.flutter.dev/cookbook/testing/widget/introduction#notes-about-the-pump-methods
Future<dynamic> pumpWidget(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(WidgetTestWrapper(widget: widget));
}


/// 异步组件pump
///
/// ```dart
/// Widget widget = ...;
/// await pumpAsyncWidget(tester, widget);
/// ```
///
/// Ref:
///   - https://docs.flutter.dev/cookbook/testing/widget/introduction#notes-about-the-pump-methods
Future<dynamic> pumpAsyncWidget(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(WidgetTestWrapper(widget: widget));
  await tester.pumpAndSettle();
}


/// 组件测试Wrapper
///
/// ```dart
/// Widget widget = ...;
/// await tester.pumpWidget(WidgetTestWrapper(widget: widget));
/// ```
class WidgetTestWrapper extends StatelessWidget {
  final Widget widget;

  const WidgetTestWrapper({
    Key? key,
    required this.widget,
  }): super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Widget Testing',
      home: widget,
    );
  }
}