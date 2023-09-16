// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domain_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DomainModel _$DomainModelFromJson(Map<String, dynamic> json) {
  return _DomainModel.fromJson(json);
}

/// @nodoc
mixin _$DomainModel {
// ID
  String get id => throw _privateConstructorUsedError; // 创建时间
  DateTime get createdAt => throw _privateConstructorUsedError; // 编辑时间
  DateTime? get updatedAt => throw _privateConstructorUsedError; // 编辑时间
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DomainModelCopyWith<DomainModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainModelCopyWith<$Res> {
  factory $DomainModelCopyWith(
          DomainModel value, $Res Function(DomainModel) then) =
      _$DomainModelCopyWithImpl<$Res, DomainModel>;
  @useResult
  $Res call({String id, DateTime createdAt, DateTime? updatedAt});
}

/// @nodoc
class _$DomainModelCopyWithImpl<$Res, $Val extends DomainModel>
    implements $DomainModelCopyWith<$Res> {
  _$DomainModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DomainModelCopyWith<$Res>
    implements $DomainModelCopyWith<$Res> {
  factory _$$_DomainModelCopyWith(
          _$_DomainModel value, $Res Function(_$_DomainModel) then) =
      __$$_DomainModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DateTime createdAt, DateTime? updatedAt});
}

/// @nodoc
class __$$_DomainModelCopyWithImpl<$Res>
    extends _$DomainModelCopyWithImpl<$Res, _$_DomainModel>
    implements _$$_DomainModelCopyWith<$Res> {
  __$$_DomainModelCopyWithImpl(
      _$_DomainModel _value, $Res Function(_$_DomainModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_DomainModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DomainModel implements _DomainModel {
  _$_DomainModel({required this.id, required this.createdAt, this.updatedAt});

  factory _$_DomainModel.fromJson(Map<String, dynamic> json) =>
      _$$_DomainModelFromJson(json);

// ID
  @override
  final String id;
// 创建时间
  @override
  final DateTime createdAt;
// 编辑时间
  @override
  DateTime? updatedAt;

  @override
  String toString() {
    return 'DomainModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DomainModelCopyWith<_$_DomainModel> get copyWith =>
      __$$_DomainModelCopyWithImpl<_$_DomainModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DomainModelToJson(
      this,
    );
  }
}

abstract class _DomainModel implements DomainModel {
  factory _DomainModel(
      {required final String id,
      required final DateTime createdAt,
      DateTime? updatedAt}) = _$_DomainModel;

  factory _DomainModel.fromJson(Map<String, dynamic> json) =
      _$_DomainModel.fromJson;

  @override // ID
  String get id;
  @override // 创建时间
  DateTime get createdAt;
  @override // 编辑时间
  DateTime? get updatedAt; // 编辑时间
  set updatedAt(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$_DomainModelCopyWith<_$_DomainModel> get copyWith =>
      throw _privateConstructorUsedError;
}
