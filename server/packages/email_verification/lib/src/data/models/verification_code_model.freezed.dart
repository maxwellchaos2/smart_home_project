// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerificationCodeModel _$VerificationCodeModelFromJson(
    Map<String, dynamic> json) {
  return _VerificationCodeModel.fromJson(json);
}

/// @nodoc
mixin _$VerificationCodeModel {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeVFromJson)
  DateTime? get verifiedAt => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$VerificationCodeModelImpl extends _VerificationCodeModel {
  const _$VerificationCodeModelImpl(
      {required this.id,
      required this.email,
      required this.code,
      @JsonKey(fromJson: dateTimeFromJson) required this.createdAt,
      @JsonKey(fromJson: dateTimeFromJson) required this.expiresAt,
      @JsonKey(fromJson: dateTimeVFromJson) required this.verifiedAt})
      : super._();

  factory _$VerificationCodeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationCodeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String code;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime expiresAt;
  @override
  @JsonKey(fromJson: dateTimeVFromJson)
  final DateTime? verifiedAt;

  @override
  String toString() {
    return 'VerificationCodeModel(id: $id, email: $email, code: $code, createdAt: $createdAt, expiresAt: $expiresAt, verifiedAt: $verifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationCodeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, code, createdAt, expiresAt, verifiedAt);
}

abstract class _VerificationCodeModel extends VerificationCodeModel {
  const factory _VerificationCodeModel(
      {required final int id,
      required final String email,
      required final String code,
      @JsonKey(fromJson: dateTimeFromJson) required final DateTime createdAt,
      @JsonKey(fromJson: dateTimeFromJson) required final DateTime expiresAt,
      @JsonKey(fromJson: dateTimeVFromJson)
      required final DateTime? verifiedAt}) = _$VerificationCodeModelImpl;
  const _VerificationCodeModel._() : super._();

  factory _VerificationCodeModel.fromJson(Map<String, dynamic> json) =
      _$VerificationCodeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get code;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get expiresAt;
  @override
  @JsonKey(fromJson: dateTimeVFromJson)
  DateTime? get verifiedAt;
}
