// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthCodeModel _$AuthCodeModelFromJson(Map<String, dynamic> json) {
  return _AuthCodeModel.fromJson(json);
}

/// @nodoc
mixin _$AuthCodeModel {
  String get code => throw _privateConstructorUsedError;
  String get clientId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this AuthCodeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AuthCodeModelImpl extends _AuthCodeModel {
  const _$AuthCodeModelImpl(
      {required this.code,
      required this.clientId,
      required this.userId,
      @JsonKey(fromJson: dateTimeFromJson) required this.expiresAt})
      : super._();

  factory _$AuthCodeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthCodeModelImplFromJson(json);

  @override
  final String code;
  @override
  final String clientId;
  @override
  final int userId;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime expiresAt;

  @override
  String toString() {
    return 'AuthCodeModel(code: $code, clientId: $clientId, userId: $userId, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthCodeModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, clientId, userId, expiresAt);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthCodeModelImplToJson(
      this,
    );
  }
}

abstract class _AuthCodeModel extends AuthCodeModel {
  const factory _AuthCodeModel(
      {required final String code,
      required final String clientId,
      required final int userId,
      @JsonKey(fromJson: dateTimeFromJson)
      required final DateTime expiresAt}) = _$AuthCodeModelImpl;
  const _AuthCodeModel._() : super._();

  factory _AuthCodeModel.fromJson(Map<String, dynamic> json) =
      _$AuthCodeModelImpl.fromJson;

  @override
  String get code;
  @override
  String get clientId;
  @override
  int get userId;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get expiresAt;
}
