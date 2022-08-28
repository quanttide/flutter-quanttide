/// 用户模型

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../quanttide_design.dart';

part 'user.freezed.dart';
part 'user.g.dart';


/// 用户数据模型
@Freezed()
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json)
  => _$UserModelFromJson(convertKeysToCamel(json));
}
