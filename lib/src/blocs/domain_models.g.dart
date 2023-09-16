// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DomainModel _$$_DomainModelFromJson(Map<String, dynamic> json) =>
    _$_DomainModel(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_DomainModelToJson(_$_DomainModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
