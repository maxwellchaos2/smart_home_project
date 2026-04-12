// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthTokenModel _$AuthTokenModelFromJson(Map<String, dynamic> json) {
  return _AuthTokenModel.fromJson(json);
}

/// @nodoc
mixin _$AuthTokenModel {
  String get token => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this AuthTokenModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$AuthTokenModelImpl extends _AuthTokenModel {
  const _$AuthTokenModelImpl({required this.token, required this.refreshToken})
      : super._();

  factory _$AuthTokenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthTokenModelImplFromJson(json);

  @override
  final String token;
  @override
  final String? refreshToken;

  @override
  String toString() {
    return 'AuthTokenModel(token: $token, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthTokenModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, refreshToken);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthTokenModelImplToJson(
      this,
    );
  }
}

abstract class _AuthTokenModel extends AuthTokenModel {
  const factory _AuthTokenModel(
      {required final String token,
      required final String? refreshToken}) = _$AuthTokenModelImpl;
  const _AuthTokenModel._() : super._();

  factory _AuthTokenModel.fromJson(Map<String, dynamic> json) =
      _$AuthTokenModelImpl.fromJson;

  @override
  String get token;
  @override
  String? get refreshToken;
}
