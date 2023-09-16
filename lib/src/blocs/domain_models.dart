/// 领域模型

import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/recase.dart';

part 'domain_models.freezed.dart';
part 'domain_models.g.dart';


@unfreezed
abstract class DomainModel with _$DomainModel {
  factory DomainModel({
    /// ID，如`d7b8a8e1-6c7f-4a9c-bd29-0c1b79c04dc8`
    required final String id,
    /// 创建时间，如`2022-01-01T12:00:00.000Z`
    required final DateTime createdAt,
    /// 编辑时间，如`2022-01-01T12:00:00.000Z`
    DateTime? updatedAt,
  }) = _DomainModel;

  /// 反序列化方法
  ///
  /// 反序列化时，把键值从蛇形转换为驼峰形
  factory DomainModel.fromJson(Map<String, dynamic> json) =>
      _$DomainModelFromJson(convertKeysToCamel(json));

  /// 序列化方法
  ///
  /// 序列化时，把键值从驼峰形转换为蛇形
  @override
  Map<String, dynamic> toJson() => convertKeysToSnake(super.toJson());
}
