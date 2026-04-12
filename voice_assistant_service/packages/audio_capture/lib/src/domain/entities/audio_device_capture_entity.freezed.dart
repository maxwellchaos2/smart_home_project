// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_device_capture_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AudioCaptureDeviceEntity {
  String get cardId => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Create a copy of AudioCaptureDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioCaptureDeviceEntityCopyWith<AudioCaptureDeviceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioCaptureDeviceEntityCopyWith<$Res> {
  factory $AudioCaptureDeviceEntityCopyWith(AudioCaptureDeviceEntity value,
          $Res Function(AudioCaptureDeviceEntity) then) =
      _$AudioCaptureDeviceEntityCopyWithImpl<$Res, AudioCaptureDeviceEntity>;
  @useResult
  $Res call({String cardId, String deviceId, String name, String description});
}

/// @nodoc
class _$AudioCaptureDeviceEntityCopyWithImpl<$Res,
        $Val extends AudioCaptureDeviceEntity>
    implements $AudioCaptureDeviceEntityCopyWith<$Res> {
  _$AudioCaptureDeviceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioCaptureDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? deviceId = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioCaptureDeviceEntityImplCopyWith<$Res>
    implements $AudioCaptureDeviceEntityCopyWith<$Res> {
  factory _$$AudioCaptureDeviceEntityImplCopyWith(
          _$AudioCaptureDeviceEntityImpl value,
          $Res Function(_$AudioCaptureDeviceEntityImpl) then) =
      __$$AudioCaptureDeviceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cardId, String deviceId, String name, String description});
}

/// @nodoc
class __$$AudioCaptureDeviceEntityImplCopyWithImpl<$Res>
    extends _$AudioCaptureDeviceEntityCopyWithImpl<$Res,
        _$AudioCaptureDeviceEntityImpl>
    implements _$$AudioCaptureDeviceEntityImplCopyWith<$Res> {
  __$$AudioCaptureDeviceEntityImplCopyWithImpl(
      _$AudioCaptureDeviceEntityImpl _value,
      $Res Function(_$AudioCaptureDeviceEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioCaptureDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? deviceId = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$AudioCaptureDeviceEntityImpl(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AudioCaptureDeviceEntityImpl extends _AudioCaptureDeviceEntity {
  const _$AudioCaptureDeviceEntityImpl(
      {required this.cardId,
      required this.deviceId,
      required this.name,
      required this.description})
      : super._();

  @override
  final String cardId;
  @override
  final String deviceId;
  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'AudioCaptureDeviceEntity(cardId: $cardId, deviceId: $deviceId, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioCaptureDeviceEntityImpl &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, cardId, deviceId, name, description);

  /// Create a copy of AudioCaptureDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioCaptureDeviceEntityImplCopyWith<_$AudioCaptureDeviceEntityImpl>
      get copyWith => __$$AudioCaptureDeviceEntityImplCopyWithImpl<
          _$AudioCaptureDeviceEntityImpl>(this, _$identity);
}

abstract class _AudioCaptureDeviceEntity extends AudioCaptureDeviceEntity {
  const factory _AudioCaptureDeviceEntity(
      {required final String cardId,
      required final String deviceId,
      required final String name,
      required final String description}) = _$AudioCaptureDeviceEntityImpl;
  const _AudioCaptureDeviceEntity._() : super._();

  @override
  String get cardId;
  @override
  String get deviceId;
  @override
  String get name;
  @override
  String get description;

  /// Create a copy of AudioCaptureDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioCaptureDeviceEntityImplCopyWith<_$AudioCaptureDeviceEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
