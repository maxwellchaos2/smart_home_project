// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_socket_message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WebSocketMessageEntity {
  Object get message => throw _privateConstructorUsedError;
  UserEntity? get user => throw _privateConstructorUsedError;
  DeviceEntity? get device => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebSocketMessageEntityCopyWith<WebSocketMessageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSocketMessageEntityCopyWith<$Res> {
  factory $WebSocketMessageEntityCopyWith(WebSocketMessageEntity value,
          $Res Function(WebSocketMessageEntity) then) =
      _$WebSocketMessageEntityCopyWithImpl<$Res, WebSocketMessageEntity>;
  @useResult
  $Res call({Object message, UserEntity? user, DeviceEntity? device});

  $UserEntityCopyWith<$Res>? get user;
  $DeviceEntityCopyWith<$Res>? get device;
}

/// @nodoc
class _$WebSocketMessageEntityCopyWithImpl<$Res,
        $Val extends WebSocketMessageEntity>
    implements $WebSocketMessageEntityCopyWith<$Res> {
  _$WebSocketMessageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? user = freezed,
    Object? device = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message ? _value.message : message,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceEntityCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $DeviceEntityCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WebSocketMessageEntityImplCopyWith<$Res>
    implements $WebSocketMessageEntityCopyWith<$Res> {
  factory _$$WebSocketMessageEntityImplCopyWith(
          _$WebSocketMessageEntityImpl value,
          $Res Function(_$WebSocketMessageEntityImpl) then) =
      __$$WebSocketMessageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object message, UserEntity? user, DeviceEntity? device});

  @override
  $UserEntityCopyWith<$Res>? get user;
  @override
  $DeviceEntityCopyWith<$Res>? get device;
}

/// @nodoc
class __$$WebSocketMessageEntityImplCopyWithImpl<$Res>
    extends _$WebSocketMessageEntityCopyWithImpl<$Res,
        _$WebSocketMessageEntityImpl>
    implements _$$WebSocketMessageEntityImplCopyWith<$Res> {
  __$$WebSocketMessageEntityImplCopyWithImpl(
      _$WebSocketMessageEntityImpl _value,
      $Res Function(_$WebSocketMessageEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? user = freezed,
    Object? device = freezed,
  }) {
    return _then(_$WebSocketMessageEntityImpl(
      message: null == message ? _value.message : message,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceEntity?,
    ));
  }
}

/// @nodoc

class _$WebSocketMessageEntityImpl extends _WebSocketMessageEntity {
  const _$WebSocketMessageEntityImpl(
      {required this.message, required this.user, required this.device})
      : super._();

  @override
  final Object message;
  @override
  final UserEntity? user;
  @override
  final DeviceEntity? device;

  @override
  String toString() {
    return 'WebSocketMessageEntity(message: $message, user: $user, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebSocketMessageEntityImpl &&
            const DeepCollectionEquality().equals(other.message, message) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(message), user, device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WebSocketMessageEntityImplCopyWith<_$WebSocketMessageEntityImpl>
      get copyWith => __$$WebSocketMessageEntityImplCopyWithImpl<
          _$WebSocketMessageEntityImpl>(this, _$identity);
}

abstract class _WebSocketMessageEntity extends WebSocketMessageEntity {
  const factory _WebSocketMessageEntity(
      {required final Object message,
      required final UserEntity? user,
      required final DeviceEntity? device}) = _$WebSocketMessageEntityImpl;
  const _WebSocketMessageEntity._() : super._();

  @override
  Object get message;
  @override
  UserEntity? get user;
  @override
  DeviceEntity? get device;
  @override
  @JsonKey(ignore: true)
  _$$WebSocketMessageEntityImplCopyWith<_$WebSocketMessageEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
