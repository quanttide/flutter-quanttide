/// APP设置

import 'dart:ui';
import 'package:flutter/material.dart';


/// 自定义ScrollBehavior
///
/// Usage:
/// ```
/// MaterialApp(
///   scrollBehavior: QuantTideScrollBehavior(),
/// )
///
/// Ref:
///   - https://docs.flutter.dev/release/breaking-changes/default-scroll-behavior-drag
/// ```
class QuantTideScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
