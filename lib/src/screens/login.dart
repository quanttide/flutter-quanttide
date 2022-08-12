/// 用户登录页面

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/testing.dart';

import '../../quanttide_design.dart';


class LoginScreen extends StatelessWidget {
  /// 鉴权API根目录
  final String apiHost;
  final bool mock;
  final MockClientHandler? mockHandler;

  const LoginScreen({
    Key? key,
    required this.apiHost,
    this.mock = false,
    this.mockHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    APIClient client = APIClient(
      mock: mock,
      mockHandler: mockHandler,
    );
    return FlutterLogin(
      title: '登录',
      onLogin: (LoginData data){
        return null;
        // return client.login(apiHost);
      },
      onSignup: (SignupData data){
        return null;
        // return client.signup(apiHost);
      },
      onRecoverPassword: (String password){
        return null;
      },
    );
  }
}