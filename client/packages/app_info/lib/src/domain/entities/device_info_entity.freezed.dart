// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceInfoEntity {
  String? get name => throw _privateConstructorUsedError;
  String? get family => throw _privateConstructorUsedError;
  String? get systemVersion => throw _privateConstructorUsedError;
  String? get systemName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceInfoEntityCopyWith<DeviceInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoEntityCopyWith<$Res> {
  factory $DeviceInfoEntityCopyWith(
          DeviceInfoEntity value, $Res Function(DeviceInfoEntity) then) =
      _$DeviceInfoEntityCopyWithImpl<$Res, DeviceInfoEntity>;
  @useResult
  $Res call(
      {String? name,
      String? family,
      String? systemVersion,
      String? systemName});
}

/// @nodoc
class _$DeviceInfoEntityCopyWithImpl<$Res, $Val extends DeviceInfoEntity>
    implements $DeviceInfoEntityCopyWith<$Res> {
  _$DeviceInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? family = freezed,
    Object? systemVersion = freezed,
    Object? systemName = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      family: freezed == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
      systemVersion: freezed == systemVersion
          ? _value.systemVersion
          : systemVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      systemName: freezed == systemName
          ? _value.systemName
          : systemName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceInfoEntityImplCopyWith<$Res>
    implements $DeviceInfoEntityCopyWith<$Res> {
  factory _$$DeviceInfoEntityImplCopyWith(_$DeviceInfoEntityImpl value,
          $Res Function(_$DeviceInfoEntityImpl) then) =
      __$$DeviceInfoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? family,
      String? systemVersion,
      String? systemName});
}

/// @nodoc
class __$$DeviceInfoEntityImplCopyWithImpl<$Res>
    extends _$DeviceInfoEntityCopyWithImpl<$Res, _$DeviceInfoEntityImpl>
    implements _$$DeviceInfoEntityImplCopyWith<$Res> {
  __$$DeviceInfoEntityImplCopyWithImpl(_$DeviceInfoEntityImpl _value,
      $Res Function(_$DeviceInfoEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? family = freezed,
    Object? systemVersion = freezed,
    Object? systemName = freezed,
  }) {
    return _then(_$DeviceInfoEntityImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      family: freezed == family
          ? _value.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
      systemVersion: freezed == systemVersion
          ? _value.systemVersion
          : systemVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      systemName: freezed == systemName
          ? _value.systemName
          : systemName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DeviceInfoEntityImpl extends _DeviceInfoEntity {
  const _$DeviceInfoEntityImpl(
      {required this.name,
      required this.family,
      required this.systemVersion,
      required this.systemName})
      : super._();

  @override
  final String? name;
  @override
  final String? family;
  @override
  final String? systemVersion;
  @override
  final String? systemName;

  @override
  String toString() {
    return 'DeviceInfoEntity(name: $name, family: $family, systemVersion: $systemVersion, systemName: $systemName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceInfoEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.systemVersion, systemVersion) ||
                other.systemVersion == systemVersion) &&
            (identical(other.systemName, systemName) ||
                other.systemName == systemName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, family, systemVersion, systemName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceInfoEntityImplCopyWith<_$DeviceInfoEntityImpl> get copyWith =>
      __$$DeviceInfoEntityImplCopyWithImpl<_$DeviceInfoEntityImpl>(
          this, _$identity);
}

abstract class _DeviceInfoEntity extends DeviceInfoEntity {
  const factory _DeviceInfoEntity(
      {required final String? name,
      required final String? family,
      required final String? systemVersion,
      required final String? systemName}) = _$DeviceInfoEntityImpl;
  const _DeviceInfoEntity._() : super._();

  @override
  String? get name;
  @override
  String? get family;
  @override
  String? get systemVersion;
  @override
  String? get systemName;
  @override
  @JsonKey(ignore: true)
  _$$DeviceInfoEntityImplCopyWith<_$DeviceInfoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
