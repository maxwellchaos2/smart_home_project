// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RefreshTokenInputModel {
  String get token => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  /// Serializes this RefreshTokenInputModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RefreshTokenInputModelImpl extends _RefreshTokenInputModel {
  const _$RefreshTokenInputModelImpl(
      {required this.token, required this.expiresAt, required this.userId})
      : super._();

  @override
  final String token;
  @override
  final DateTime expiresAt;
  @override
  final int userId;

  @override
  String toString() {
    return 'RefreshTokenInputModel(token: $token, expiresAt: $expiresAt, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenInputModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, expiresAt, userId);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenInputModelImplToJson(
      this,
    );
  }
}

abstract class _RefreshTokenInputModel extends RefreshTokenInputModel {
  const factory _RefreshTokenInputModel(
      {required final String token,
      required final DateTime expiresAt,
      required final int userId}) = _$RefreshTokenInputModelImpl;
  const _RefreshTokenInputModel._() : super._();

  @override
  String get token;
  @override
  DateTime get expiresAt;
  @override
  int get userId;
}
