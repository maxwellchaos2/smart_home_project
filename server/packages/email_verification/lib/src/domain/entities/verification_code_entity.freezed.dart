// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_code_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerificationCodeEntity {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  DateTime? get verifiedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerificationCodeEntityCopyWith<VerificationCodeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationCodeEntityCopyWith<$Res> {
  factory $VerificationCodeEntityCopyWith(VerificationCodeEntity value,
          $Res Function(VerificationCodeEntity) then) =
      _$VerificationCodeEntityCopyWithImpl<$Res, VerificationCodeEntity>;
  @useResult
  $Res call(
      {int id,
      String email,
      String code,
      DateTime createdAt,
      DateTime expiresAt,
      DateTime? verifiedAt});
}

/// @nodoc
class _$VerificationCodeEntityCopyWithImpl<$Res,
        $Val extends VerificationCodeEntity>
    implements $VerificationCodeEntityCopyWith<$Res> {
  _$VerificationCodeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? code = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? verifiedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationCodeEntityImplCopyWith<$Res>
    implements $VerificationCodeEntityCopyWith<$Res> {
  factory _$$VerificationCodeEntityImplCopyWith(
          _$VerificationCodeEntityImpl value,
          $Res Function(_$VerificationCodeEntityImpl) then) =
      __$$VerificationCodeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String code,
      DateTime createdAt,
      DateTime expiresAt,
      DateTime? verifiedAt});
}

/// @nodoc
class __$$VerificationCodeEntityImplCopyWithImpl<$Res>
    extends _$VerificationCodeEntityCopyWithImpl<$Res,
        _$VerificationCodeEntityImpl>
    implements _$$VerificationCodeEntityImplCopyWith<$Res> {
  __$$VerificationCodeEntityImplCopyWithImpl(
      _$VerificationCodeEntityImpl _value,
      $Res Function(_$VerificationCodeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? code = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? verifiedAt = freezed,
  }) {
    return _then(_$VerificationCodeEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$VerificationCodeEntityImpl extends _VerificationCodeEntity {
  const _$VerificationCodeEntityImpl(
      {required this.id,
      required this.email,
      required this.code,
      required this.createdAt,
      required this.expiresAt,
      required this.verifiedAt})
      : super._();

  @override
  final int id;
  @override
  final String email;
  @override
  final String code;
  @override
  final DateTime createdAt;
  @override
  final DateTime expiresAt;
  @override
  final DateTime? verifiedAt;

  @override
  String toString() {
    return 'VerificationCodeEntity(id: $id, email: $email, code: $code, createdAt: $createdAt, expiresAt: $expiresAt, verifiedAt: $verifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationCodeEntityImpl &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType, id, email, code, createdAt, expiresAt, verifiedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationCodeEntityImplCopyWith<_$VerificationCodeEntityImpl>
      get copyWith => __$$VerificationCodeEntityImplCopyWithImpl<
          _$VerificationCodeEntityImpl>(this, _$identity);
}

abstract class _VerificationCodeEntity extends VerificationCodeEntity {
  const factory _VerificationCodeEntity(
      {required final int id,
      required final String email,
      required final String code,
      required final DateTime createdAt,
      required final DateTime expiresAt,
      required final DateTime? verifiedAt}) = _$VerificationCodeEntityImpl;
  const _VerificationCodeEntity._() : super._();

  @override
  int get id;
  @override
  String get email;
  @override
  String get code;
  @override
  DateTime get createdAt;
  @override
  DateTime get expiresAt;
  @override
  DateTime? get verifiedAt;
  @override
  @JsonKey(ignore: true)
  _$$VerificationCodeEntityImplCopyWith<_$VerificationCodeEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
