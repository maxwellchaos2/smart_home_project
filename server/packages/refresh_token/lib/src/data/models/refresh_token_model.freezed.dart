// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefreshTokenModel _$RefreshTokenModelFromJson(Map<String, dynamic> json) {
  return _RefreshTokenModel.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenModel {
  int get id => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RefreshTokenModelImpl extends _RefreshTokenModel {
  const _$RefreshTokenModelImpl(
      {required this.id,
      required this.token,
      required this.userId,
      @JsonKey(fromJson: dateTimeFromJson) required this.expiresAt,
      @JsonKey(fromJson: dateTimeFromJson) required this.createdAt})
      : super._();

  factory _$RefreshTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenModelImplFromJson(json);

  @override
  final int id;
  @override
  final String token;
  @override
  final int userId;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime expiresAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime createdAt;

  @override
  String toString() {
    return 'RefreshTokenModel(id: $id, token: $token, userId: $userId, expiresAt: $expiresAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, token, userId, expiresAt, createdAt);
}

abstract class _RefreshTokenModel extends RefreshTokenModel {
  const factory _RefreshTokenModel(
      {required final int id,
      required final String token,
      required final int userId,
      @JsonKey(fromJson: dateTimeFromJson) required final DateTime expiresAt,
      @JsonKey(fromJson: dateTimeFromJson)
      required final DateTime createdAt}) = _$RefreshTokenModelImpl;
  const _RefreshTokenModel._() : super._();

  factory _RefreshTokenModel.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenModelImpl.fromJson;

  @override
  int get id;
  @override
  String get token;
  @override
  int get userId;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get expiresAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt;
}
