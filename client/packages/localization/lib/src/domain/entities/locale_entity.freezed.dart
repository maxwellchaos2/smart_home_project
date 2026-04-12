// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocaleEntity {
  String get languageCode => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocaleEntityCopyWith<LocaleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaleEntityCopyWith<$Res> {
  factory $LocaleEntityCopyWith(
          LocaleEntity value, $Res Function(LocaleEntity) then) =
      _$LocaleEntityCopyWithImpl<$Res, LocaleEntity>;
  @useResult
  $Res call({String languageCode, String? countryCode});
}

/// @nodoc
class _$LocaleEntityCopyWithImpl<$Res, $Val extends LocaleEntity>
    implements $LocaleEntityCopyWith<$Res> {
  _$LocaleEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? countryCode = freezed,
  }) {
    return _then(_value.copyWith(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocaleEntityImplCopyWith<$Res>
    implements $LocaleEntityCopyWith<$Res> {
  factory _$$LocaleEntityImplCopyWith(
          _$LocaleEntityImpl value, $Res Function(_$LocaleEntityImpl) then) =
      __$$LocaleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String languageCode, String? countryCode});
}

/// @nodoc
class __$$LocaleEntityImplCopyWithImpl<$Res>
    extends _$LocaleEntityCopyWithImpl<$Res, _$LocaleEntityImpl>
    implements _$$LocaleEntityImplCopyWith<$Res> {
  __$$LocaleEntityImplCopyWithImpl(
      _$LocaleEntityImpl _value, $Res Function(_$LocaleEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? countryCode = freezed,
  }) {
    return _then(_$LocaleEntityImpl(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocaleEntityImpl extends _LocaleEntity {
  const _$LocaleEntityImpl({required this.languageCode, this.countryCode})
      : super._();

  @override
  final String languageCode;
  @override
  final String? countryCode;

  @override
  String toString() {
    return 'LocaleEntity(languageCode: $languageCode, countryCode: $countryCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocaleEntityImpl &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, languageCode, countryCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocaleEntityImplCopyWith<_$LocaleEntityImpl> get copyWith =>
      __$$LocaleEntityImplCopyWithImpl<_$LocaleEntityImpl>(this, _$identity);
}

abstract class _LocaleEntity extends LocaleEntity {
  const factory _LocaleEntity(
      {required final String languageCode,
      final String? countryCode}) = _$LocaleEntityImpl;
  const _LocaleEntity._() : super._();

  @override
  String get languageCode;
  @override
  String? get countryCode;
  @override
  @JsonKey(ignore: true)
  _$$LocaleEntityImplCopyWith<_$LocaleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
