// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'isapi_event_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IsapiEventEntity {
  DateTime get dateTime => throw _privateConstructorUsedError;
  IsapiEventType get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IsapiEventEntityCopyWith<IsapiEventEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsapiEventEntityCopyWith<$Res> {
  factory $IsapiEventEntityCopyWith(
          IsapiEventEntity value, $Res Function(IsapiEventEntity) then) =
      _$IsapiEventEntityCopyWithImpl<$Res, IsapiEventEntity>;
  @useResult
  $Res call({DateTime dateTime, IsapiEventType type, String? name});
}

/// @nodoc
class _$IsapiEventEntityCopyWithImpl<$Res, $Val extends IsapiEventEntity>
    implements $IsapiEventEntityCopyWith<$Res> {
  _$IsapiEventEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? type = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IsapiEventType,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IsapiEventEntityImplCopyWith<$Res>
    implements $IsapiEventEntityCopyWith<$Res> {
  factory _$$IsapiEventEntityImplCopyWith(_$IsapiEventEntityImpl value,
          $Res Function(_$IsapiEventEntityImpl) then) =
      __$$IsapiEventEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime dateTime, IsapiEventType type, String? name});
}

/// @nodoc
class __$$IsapiEventEntityImplCopyWithImpl<$Res>
    extends _$IsapiEventEntityCopyWithImpl<$Res, _$IsapiEventEntityImpl>
    implements _$$IsapiEventEntityImplCopyWith<$Res> {
  __$$IsapiEventEntityImplCopyWithImpl(_$IsapiEventEntityImpl _value,
      $Res Function(_$IsapiEventEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? type = null,
    Object? name = freezed,
  }) {
    return _then(_$IsapiEventEntityImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as IsapiEventType,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$IsapiEventEntityImpl extends _IsapiEventEntity {
  const _$IsapiEventEntityImpl(
      {required this.dateTime, required this.type, required this.name})
      : super._();

  @override
  final DateTime dateTime;
  @override
  final IsapiEventType type;
  @override
  final String? name;

  @override
  String toString() {
    return 'IsapiEventEntity(dateTime: $dateTime, type: $type, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsapiEventEntityImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime, type, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsapiEventEntityImplCopyWith<_$IsapiEventEntityImpl> get copyWith =>
      __$$IsapiEventEntityImplCopyWithImpl<_$IsapiEventEntityImpl>(
          this, _$identity);
}

abstract class _IsapiEventEntity extends IsapiEventEntity {
  const factory _IsapiEventEntity(
      {required final DateTime dateTime,
      required final IsapiEventType type,
      required final String? name}) = _$IsapiEventEntityImpl;
  const _IsapiEventEntity._() : super._();

  @override
  DateTime get dateTime;
  @override
  IsapiEventType get type;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$IsapiEventEntityImplCopyWith<_$IsapiEventEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
