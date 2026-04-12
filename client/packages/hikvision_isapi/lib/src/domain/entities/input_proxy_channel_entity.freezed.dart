// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_proxy_channel_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InputProxyChannelEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InputProxyChannelEntityCopyWith<InputProxyChannelEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputProxyChannelEntityCopyWith<$Res> {
  factory $InputProxyChannelEntityCopyWith(InputProxyChannelEntity value,
          $Res Function(InputProxyChannelEntity) then) =
      _$InputProxyChannelEntityCopyWithImpl<$Res, InputProxyChannelEntity>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$InputProxyChannelEntityCopyWithImpl<$Res,
        $Val extends InputProxyChannelEntity>
    implements $InputProxyChannelEntityCopyWith<$Res> {
  _$InputProxyChannelEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InputProxyChannelEntityImplCopyWith<$Res>
    implements $InputProxyChannelEntityCopyWith<$Res> {
  factory _$$InputProxyChannelEntityImplCopyWith(
          _$InputProxyChannelEntityImpl value,
          $Res Function(_$InputProxyChannelEntityImpl) then) =
      __$$InputProxyChannelEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$InputProxyChannelEntityImplCopyWithImpl<$Res>
    extends _$InputProxyChannelEntityCopyWithImpl<$Res,
        _$InputProxyChannelEntityImpl>
    implements _$$InputProxyChannelEntityImplCopyWith<$Res> {
  __$$InputProxyChannelEntityImplCopyWithImpl(
      _$InputProxyChannelEntityImpl _value,
      $Res Function(_$InputProxyChannelEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$InputProxyChannelEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InputProxyChannelEntityImpl extends _InputProxyChannelEntity {
  const _$InputProxyChannelEntityImpl({required this.id, required this.name})
      : super._();

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'InputProxyChannelEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputProxyChannelEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InputProxyChannelEntityImplCopyWith<_$InputProxyChannelEntityImpl>
      get copyWith => __$$InputProxyChannelEntityImplCopyWithImpl<
          _$InputProxyChannelEntityImpl>(this, _$identity);
}

abstract class _InputProxyChannelEntity extends InputProxyChannelEntity {
  const factory _InputProxyChannelEntity(
      {required final String id,
      required final String name}) = _$InputProxyChannelEntityImpl;
  const _InputProxyChannelEntity._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$InputProxyChannelEntityImplCopyWith<_$InputProxyChannelEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
