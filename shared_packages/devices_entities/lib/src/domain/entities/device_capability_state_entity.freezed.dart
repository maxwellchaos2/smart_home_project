// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_capability_state_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceCapabilityStateEntity _$DeviceCapabilityStateEntityFromJson(
    Map<String, dynamic> json) {
  switch (json['instance']) {
    case 'on':
      return DeviceCapabilityStateOnEntity.fromJson(json);
    case 'rgb':
      return DeviceCapabilityStateRgbEntity.fromJson(json);
    case 'hsv':
      return DeviceCapabilityStateHsvEntity.fromJson(json);
    case 'temperature_k':
      return DeviceCapabilityStateTemperatureKEntity.fromJson(json);
    case 'scene':
      return DeviceCapabilityStateSceneEntity.fromJson(json);
    case 'temperature':
      return DeviceCapabilityStateTemperatureEntity.fromJson(json);
    case 'humidity':
      return DeviceCapabilityStateHumidityEntity.fromJson(json);
    case 'work_speed':
      return DeviceCapabilityStateWorkSpeedEntity.fromJson(json);
    case 'brightness':
      return DeviceCapabilityStateBrightnessEntity.fromJson(json);
    case 'channel':
      return DeviceCapabilityStateChannelEntity.fromJson(json);
    case 'volume':
      return DeviceCapabilityStateVolumeEntity.fromJson(json);
    case 'open':
      return DeviceCapabilityStateOpenEntity.fromJson(json);
    case 'battery_level':
      return DeviceCapabilityStateBatteryLevelEntity.fromJson(json);

    default:
      return DeviceCapabilityStateUnknownEntity.fromJson(json);
  }
}

/// @nodoc
mixin _$DeviceCapabilityStateEntity {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCapabilityStateEntityCopyWith<$Res> {
  factory $DeviceCapabilityStateEntityCopyWith(
          DeviceCapabilityStateEntity value,
          $Res Function(DeviceCapabilityStateEntity) then) =
      _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
          DeviceCapabilityStateEntity>;
}

/// @nodoc
class _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        $Val extends DeviceCapabilityStateEntity>
    implements $DeviceCapabilityStateEntityCopyWith<$Res> {
  _$DeviceCapabilityStateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateOnEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateOnEntityImplCopyWith(
          _$DeviceCapabilityStateOnEntityImpl value,
          $Res Function(_$DeviceCapabilityStateOnEntityImpl) then) =
      __$$DeviceCapabilityStateOnEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool? value});
}

/// @nodoc
class __$$DeviceCapabilityStateOnEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateOnEntityImpl>
    implements _$$DeviceCapabilityStateOnEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateOnEntityImplCopyWithImpl(
      _$DeviceCapabilityStateOnEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateOnEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$DeviceCapabilityStateOnEntityImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateOnEntityImpl
    extends DeviceCapabilityStateOnEntity {
  const _$DeviceCapabilityStateOnEntityImpl(
      {required this.value, final String? $type})
      : $type = $type ?? 'on',
        super._();

  factory _$DeviceCapabilityStateOnEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateOnEntityImplFromJson(json);

  @override
  final bool? value;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.on(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateOnEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityStateOnEntityImplCopyWith<
          _$DeviceCapabilityStateOnEntityImpl>
      get copyWith => __$$DeviceCapabilityStateOnEntityImplCopyWithImpl<
          _$DeviceCapabilityStateOnEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return on(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return on?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (on != null) {
      return on(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateOnEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateOnEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateOnEntity({required final bool? value}) =
      _$DeviceCapabilityStateOnEntityImpl;
  const DeviceCapabilityStateOnEntity._() : super._();

  factory DeviceCapabilityStateOnEntity.fromJson(Map<String, dynamic> json) =
      _$DeviceCapabilityStateOnEntityImpl.fromJson;

  bool? get value;
  @JsonKey(ignore: true)
  _$$DeviceCapabilityStateOnEntityImplCopyWith<
          _$DeviceCapabilityStateOnEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateRgbEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateRgbEntityImplCopyWith(
          _$DeviceCapabilityStateRgbEntityImpl value,
          $Res Function(_$DeviceCapabilityStateRgbEntityImpl) then) =
      __$$DeviceCapabilityStateRgbEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$DeviceCapabilityStateRgbEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateRgbEntityImpl>
    implements _$$DeviceCapabilityStateRgbEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateRgbEntityImplCopyWithImpl(
      _$DeviceCapabilityStateRgbEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateRgbEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DeviceCapabilityStateRgbEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateRgbEntityImpl
    extends DeviceCapabilityStateRgbEntity {
  const _$DeviceCapabilityStateRgbEntityImpl(
      {required this.value, final String? $type})
      : $type = $type ?? 'rgb',
        super._();

  factory _$DeviceCapabilityStateRgbEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateRgbEntityImplFromJson(json);

  @override
  final int value;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.rgb(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateRgbEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityStateRgbEntityImplCopyWith<
          _$DeviceCapabilityStateRgbEntityImpl>
      get copyWith => __$$DeviceCapabilityStateRgbEntityImplCopyWithImpl<
          _$DeviceCapabilityStateRgbEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return rgb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return rgb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (rgb != null) {
      return rgb(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateRgbEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateRgbEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateRgbEntity({required final int value}) =
      _$DeviceCapabilityStateRgbEntityImpl;
  const DeviceCapabilityStateRgbEntity._() : super._();

  factory DeviceCapabilityStateRgbEntity.fromJson(Map<String, dynamic> json) =
      _$DeviceCapabilityStateRgbEntityImpl.fromJson;

  int get value;
  @JsonKey(ignore: true)
  _$$DeviceCapabilityStateRgbEntityImplCopyWith<
          _$DeviceCapabilityStateRgbEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateHsvEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateHsvEntityImplCopyWith(
          _$DeviceCapabilityStateHsvEntityImpl value,
          $Res Function(_$DeviceCapabilityStateHsvEntityImpl) then) =
      __$$DeviceCapabilityStateHsvEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({({int h, int s, int v}) value});
}

/// @nodoc
class __$$DeviceCapabilityStateHsvEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateHsvEntityImpl>
    implements _$$DeviceCapabilityStateHsvEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateHsvEntityImplCopyWithImpl(
      _$DeviceCapabilityStateHsvEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateHsvEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DeviceCapabilityStateHsvEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as ({int h, int s, int v}),
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateHsvEntityImpl
    extends DeviceCapabilityStateHsvEntity {
  const _$DeviceCapabilityStateHsvEntityImpl(
      {required this.value, final String? $type})
      : $type = $type ?? 'hsv',
        super._();

  factory _$DeviceCapabilityStateHsvEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateHsvEntityImplFromJson(json);

  @override
  final ({int h, int s, int v}) value;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.hsv(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateHsvEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityStateHsvEntityImplCopyWith<
          _$DeviceCapabilityStateHsvEntityImpl>
      get copyWith => __$$DeviceCapabilityStateHsvEntityImplCopyWithImpl<
          _$DeviceCapabilityStateHsvEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return hsv(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return hsv?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (hsv != null) {
      return hsv(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateHsvEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateHsvEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateHsvEntity(
          {required final ({int h, int s, int v}) value}) =
      _$DeviceCapabilityStateHsvEntityImpl;
  const DeviceCapabilityStateHsvEntity._() : super._();

  factory DeviceCapabilityStateHsvEntity.fromJson(Map<String, dynamic> json) =
      _$DeviceCapabilityStateHsvEntityImpl.fromJson;

  ({int h, int s, int v}) get value;
  @JsonKey(ignore: true)
  _$$DeviceCapabilityStateHsvEntityImplCopyWith<
          _$DeviceCapabilityStateHsvEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateTemperatureKEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateTemperatureKEntityImplCopyWith(
          _$DeviceCapabilityStateTemperatureKEntityImpl value,
          $Res Function(_$DeviceCapabilityStateTemperatureKEntityImpl) then) =
      __$$DeviceCapabilityStateTemperatureKEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$DeviceCapabilityStateTemperatureKEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateTemperatureKEntityImpl>
    implements _$$DeviceCapabilityStateTemperatureKEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateTemperatureKEntityImplCopyWithImpl(
      _$DeviceCapabilityStateTemperatureKEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateTemperatureKEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DeviceCapabilityStateTemperatureKEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateTemperatureKEntityImpl
    extends DeviceCapabilityStateTemperatureKEntity {
  const _$DeviceCapabilityStateTemperatureKEntityImpl(
      {required this.value, final String? $type})
      : $type = $type ?? 'temperature_k',
        super._();

  factory _$DeviceCapabilityStateTemperatureKEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateTemperatureKEntityImplFromJson(json);

  @override
  final int value;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.temperatureK(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateTemperatureKEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityStateTemperatureKEntityImplCopyWith<
          _$DeviceCapabilityStateTemperatureKEntityImpl>
      get copyWith =>
          __$$DeviceCapabilityStateTemperatureKEntityImplCopyWithImpl<
              _$DeviceCapabilityStateTemperatureKEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return temperatureK(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return temperatureK?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (temperatureK != null) {
      return temperatureK(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateTemperatureKEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateTemperatureKEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateTemperatureKEntity(
          {required final int value}) =
      _$DeviceCapabilityStateTemperatureKEntityImpl;
  const DeviceCapabilityStateTemperatureKEntity._() : super._();

  factory DeviceCapabilityStateTemperatureKEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityStateTemperatureKEntityImpl.fromJson;

  int get value;
  @JsonKey(ignore: true)
  _$$DeviceCapabilityStateTemperatureKEntityImplCopyWith<
          _$DeviceCapabilityStateTemperatureKEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateSceneEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateSceneEntityImplCopyWith(
          _$DeviceCapabilityStateSceneEntityImpl value,
          $Res Function(_$DeviceCapabilityStateSceneEntityImpl) then) =
      __$$DeviceCapabilityStateSceneEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$DeviceCapabilityStateSceneEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateSceneEntityImpl>
    implements _$$DeviceCapabilityStateSceneEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateSceneEntityImplCopyWithImpl(
      _$DeviceCapabilityStateSceneEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateSceneEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DeviceCapabilityStateSceneEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateSceneEntityImpl
    extends DeviceCapabilityStateSceneEntity {
  const _$DeviceCapabilityStateSceneEntityImpl(
      {required this.value, final String? $type})
      : $type = $type ?? 'scene',
        super._();

  factory _$DeviceCapabilityStateSceneEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateSceneEntityImplFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.scene(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateSceneEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityStateSceneEntityImplCopyWith<
          _$DeviceCapabilityStateSceneEntityImpl>
      get copyWith => __$$DeviceCapabilityStateSceneEntityImplCopyWithImpl<
          _$DeviceCapabilityStateSceneEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return scene(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return scene?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (scene != null) {
      return scene(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateSceneEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateSceneEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateSceneEntity(
      {required final String value}) = _$DeviceCapabilityStateSceneEntityImpl;
  const DeviceCapabilityStateSceneEntity._() : super._();

  factory DeviceCapabilityStateSceneEntity.fromJson(Map<String, dynamic> json) =
      _$DeviceCapabilityStateSceneEntityImpl.fromJson;

  String get value;
  @JsonKey(ignore: true)
  _$$DeviceCapabilityStateSceneEntityImplCopyWith<
          _$DeviceCapabilityStateSceneEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateTemperatureEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateTemperatureEntityImplCopyWith(
          _$DeviceCapabilityStateTemperatureEntityImpl value,
          $Res Function(_$DeviceCapabilityStateTemperatureEntityImpl) then) =
      __$$DeviceCapabilityStateTemperatureEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$DeviceCapabilityStateTemperatureEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateTemperatureEntityImpl>
    implements _$$DeviceCapabilityStateTemperatureEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateTemperatureEntityImplCopyWithImpl(
      _$DeviceCapabilityStateTemperatureEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateTemperatureEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DeviceCapabilityStateTemperatureEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateTemperatureEntityImpl
    extends DeviceCapabilityStateTemperatureEntity {
  const _$DeviceCapabilityStateTemperatureEntityImpl(
      {required this.value, final String? $type})
      : $type = $type ?? 'temperature',
        super._();

  factory _$DeviceCapabilityStateTemperatureEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateTemperatureEntityImplFromJson(json);

  @override
  final double value;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.temperature(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateTemperatureEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityStateTemperatureEntityImplCopyWith<
          _$DeviceCapabilityStateTemperatureEntityImpl>
      get copyWith =>
          __$$DeviceCapabilityStateTemperatureEntityImplCopyWithImpl<
              _$DeviceCapabilityStateTemperatureEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return temperature(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return temperature?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (temperature != null) {
      return temperature(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateTemperatureEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateTemperatureEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateTemperatureEntity(
          {required final double value}) =
      _$DeviceCapabilityStateTemperatureEntityImpl;
  const DeviceCapabilityStateTemperatureEntity._() : super._();

  factory DeviceCapabilityStateTemperatureEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityStateTemperatureEntityImpl.fromJson;

  double get value;
  @JsonKey(ignore: true)
  _$$DeviceCapabilityStateTemperatureEntityImplCopyWith<
          _$DeviceCapabilityStateTemperatureEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateHumidityEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateHumidityEntityImplCopyWith(
          _$DeviceCapabilityStateHumidityEntityImpl value,
          $Res Function(_$DeviceCapabilityStateHumidityEntityImpl) then) =
      __$$DeviceCapabilityStateHumidityEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$DeviceCapabilityStateHumidityEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateHumidityEntityImpl>
    implements _$$DeviceCapabilityStateHumidityEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateHumidityEntityImplCopyWithImpl(
      _$DeviceCapabilityStateHumidityEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateHumidityEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DeviceCapabilityStateHumidityEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateHumidityEntityImpl
    extends DeviceCapabilityStateHumidityEntity {
  const _$DeviceCapabilityStateHumidityEntityImpl(
      {required this.value, final String? $type})
      : $type = $type ?? 'humidity',
        super._();

  factory _$DeviceCapabilityStateHumidityEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateHumidityEntityImplFromJson(json);

  @override
  final double value;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.humidity(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateHumidityEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityStateHumidityEntityImplCopyWith<
          _$DeviceCapabilityStateHumidityEntityImpl>
      get copyWith => __$$DeviceCapabilityStateHumidityEntityImplCopyWithImpl<
          _$DeviceCapabilityStateHumidityEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return humidity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return humidity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (humidity != null) {
      return humidity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateHumidityEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateHumidityEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateHumidityEntity(
          {required final double value}) =
      _$DeviceCapabilityStateHumidityEntityImpl;
  const DeviceCapabilityStateHumidityEntity._() : super._();

  factory DeviceCapabilityStateHumidityEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityStateHumidityEntityImpl.fromJson;

  double get value;
  @JsonKey(ignore: true)
  _$$DeviceCapabilityStateHumidityEntityImplCopyWith<
          _$DeviceCapabilityStateHumidityEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateWorkSpeedEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateWorkSpeedEntityImplCopyWith(
          _$DeviceCapabilityStateWorkSpeedEntityImpl value,
          $Res Function(_$DeviceCapabilityStateWorkSpeedEntityImpl) then) =
      __$$DeviceCapabilityStateWorkSpeedEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$DeviceCapabilityStateWorkSpeedEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateWorkSpeedEntityImpl>
    implements _$$DeviceCapabilityStateWorkSpeedEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateWorkSpeedEntityImplCopyWithImpl(
      _$DeviceCapabilityStateWorkSpeedEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateWorkSpeedEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DeviceCapabilityStateWorkSpeedEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateWorkSpeedEntityImpl
    extends DeviceCapabilityStateWorkSpeedEntity {
  const _$DeviceCapabilityStateWorkSpeedEntityImpl(
      {required this.value, final String? $type})
      : $type = $type ?? 'work_speed',
        super._();

  factory _$DeviceCapabilityStateWorkSpeedEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateWorkSpeedEntityImplFromJson(json);

  @override
  final String value;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.workSpeed(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateWorkSpeedEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityStateWorkSpeedEntityImplCopyWith<
          _$DeviceCapabilityStateWorkSpeedEntityImpl>
      get copyWith => __$$DeviceCapabilityStateWorkSpeedEntityImplCopyWithImpl<
          _$DeviceCapabilityStateWorkSpeedEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return workSpeed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return workSpeed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (workSpeed != null) {
      return workSpeed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateWorkSpeedEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateWorkSpeedEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateWorkSpeedEntity(
          {required final String value}) =
      _$DeviceCapabilityStateWorkSpeedEntityImpl;
  const DeviceCapabilityStateWorkSpeedEntity._() : super._();

  factory DeviceCapabilityStateWorkSpeedEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityStateWorkSpeedEntityImpl.fromJson;

  String get value;
  @JsonKey(ignore: true)
  _$$DeviceCapabilityStateWorkSpeedEntityImplCopyWith<
          _$DeviceCapabilityStateWorkSpeedEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateBrightnessEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateBrightnessEntityImplCopyWith(
          _$DeviceCapabilityStateBrightnessEntityImpl value,
          $Res Function(_$DeviceCapabilityStateBrightnessEntityImpl) then) =
      __$$DeviceCapabilityStateBrightnessEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$DeviceCapabilityStateBrightnessEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateBrightnessEntityImpl>
    implements _$$DeviceCapabilityStateBrightnessEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateBrightnessEntityImplCopyWithImpl(
      _$DeviceCapabilityStateBrightnessEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateBrightnessEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DeviceCapabilityStateBrightnessEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateBrightnessEntityImpl
    extends DeviceCapabilityStateBrightnessEntity {
  const _$DeviceCapabilityStateBrightnessEntityImpl(
      {required this.value, final String? $type})
      : $type = $type ?? 'brightness',
        super._();

  factory _$DeviceCapabilityStateBrightnessEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateBrightnessEntityImplFromJson(json);

  @override
  final double value;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.brightness(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateBrightnessEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityStateBrightnessEntityImplCopyWith<
          _$DeviceCapabilityStateBrightnessEntityImpl>
      get copyWith => __$$DeviceCapabilityStateBrightnessEntityImplCopyWithImpl<
          _$DeviceCapabilityStateBrightnessEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return brightness(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return brightness?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (brightness != null) {
      return brightness(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateBrightnessEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateBrightnessEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateBrightnessEntity(
          {required final double value}) =
      _$DeviceCapabilityStateBrightnessEntityImpl;
  const DeviceCapabilityStateBrightnessEntity._() : super._();

  factory DeviceCapabilityStateBrightnessEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityStateBrightnessEntityImpl.fromJson;

  double get value;
  @JsonKey(ignore: true)
  _$$DeviceCapabilityStateBrightnessEntityImplCopyWith<
          _$DeviceCapabilityStateBrightnessEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateChannelEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateChannelEntityImplCopyWith(
          _$DeviceCapabilityStateChannelEntityImpl value,
          $Res Function(_$DeviceCapabilityStateChannelEntityImpl) then) =
      __$$DeviceCapabilityStateChannelEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$DeviceCapabilityStateChannelEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateChannelEntityImpl>
    implements _$$DeviceCapabilityStateChannelEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateChannelEntityImplCopyWithImpl(
      _$DeviceCapabilityStateChannelEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateChannelEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DeviceCapabilityStateChannelEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateChannelEntityImpl
    extends DeviceCapabilityStateChannelEntity {
  const _$DeviceCapabilityStateChannelEntityImpl(
      {required this.value, final String? $type})
      : $type = $type ?? 'channel',
        super._();

  factory _$DeviceCapabilityStateChannelEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateChannelEntityImplFromJson(json);

  @override
  final double value;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.channel(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateChannelEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityStateChannelEntityImplCopyWith<
          _$DeviceCapabilityStateChannelEntityImpl>
      get copyWith => __$$DeviceCapabilityStateChannelEntityImplCopyWithImpl<
          _$DeviceCapabilityStateChannelEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return channel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return channel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (channel != null) {
      return channel(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateChannelEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateChannelEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateChannelEntity(
      {required final double value}) = _$DeviceCapabilityStateChannelEntityImpl;
  const DeviceCapabilityStateChannelEntity._() : super._();

  factory DeviceCapabilityStateChannelEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityStateChannelEntityImpl.fromJson;

  double get value;
  @JsonKey(ignore: true)
  _$$DeviceCapabilityStateChannelEntityImplCopyWith<
          _$DeviceCapabilityStateChannelEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateVolumeEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateVolumeEntityImplCopyWith(
          _$DeviceCapabilityStateVolumeEntityImpl value,
          $Res Function(_$DeviceCapabilityStateVolumeEntityImpl) then) =
      __$$DeviceCapabilityStateVolumeEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$DeviceCapabilityStateVolumeEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateVolumeEntityImpl>
    implements _$$DeviceCapabilityStateVolumeEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateVolumeEntityImplCopyWithImpl(
      _$DeviceCapabilityStateVolumeEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateVolumeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DeviceCapabilityStateVolumeEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateVolumeEntityImpl
    extends DeviceCapabilityStateVolumeEntity {
  const _$DeviceCapabilityStateVolumeEntityImpl(
      {required this.value, final String? $type})
      : $type = $type ?? 'volume',
        super._();

  factory _$DeviceCapabilityStateVolumeEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateVolumeEntityImplFromJson(json);

  @override
  final double value;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.volume(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateVolumeEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityStateVolumeEntityImplCopyWith<
          _$DeviceCapabilityStateVolumeEntityImpl>
      get copyWith => __$$DeviceCapabilityStateVolumeEntityImplCopyWithImpl<
          _$DeviceCapabilityStateVolumeEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return volume(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return volume?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (volume != null) {
      return volume(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateVolumeEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateVolumeEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateVolumeEntity(
      {required final double value}) = _$DeviceCapabilityStateVolumeEntityImpl;
  const DeviceCapabilityStateVolumeEntity._() : super._();

  factory DeviceCapabilityStateVolumeEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityStateVolumeEntityImpl.fromJson;

  double get value;
  @JsonKey(ignore: true)
  _$$DeviceCapabilityStateVolumeEntityImplCopyWith<
          _$DeviceCapabilityStateVolumeEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateOpenEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateOpenEntityImplCopyWith(
          _$DeviceCapabilityStateOpenEntityImpl value,
          $Res Function(_$DeviceCapabilityStateOpenEntityImpl) then) =
      __$$DeviceCapabilityStateOpenEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$DeviceCapabilityStateOpenEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateOpenEntityImpl>
    implements _$$DeviceCapabilityStateOpenEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateOpenEntityImplCopyWithImpl(
      _$DeviceCapabilityStateOpenEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateOpenEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DeviceCapabilityStateOpenEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateOpenEntityImpl
    extends DeviceCapabilityStateOpenEntity {
  const _$DeviceCapabilityStateOpenEntityImpl(
      {required this.value, final String? $type})
      : $type = $type ?? 'open',
        super._();

  factory _$DeviceCapabilityStateOpenEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateOpenEntityImplFromJson(json);

  @override
  final double value;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.open(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateOpenEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityStateOpenEntityImplCopyWith<
          _$DeviceCapabilityStateOpenEntityImpl>
      get copyWith => __$$DeviceCapabilityStateOpenEntityImplCopyWithImpl<
          _$DeviceCapabilityStateOpenEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateOpenEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateOpenEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateOpenEntity({required final double value}) =
      _$DeviceCapabilityStateOpenEntityImpl;
  const DeviceCapabilityStateOpenEntity._() : super._();

  factory DeviceCapabilityStateOpenEntity.fromJson(Map<String, dynamic> json) =
      _$DeviceCapabilityStateOpenEntityImpl.fromJson;

  double get value;
  @JsonKey(ignore: true)
  _$$DeviceCapabilityStateOpenEntityImplCopyWith<
          _$DeviceCapabilityStateOpenEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateBatteryLevelEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateBatteryLevelEntityImplCopyWith(
          _$DeviceCapabilityStateBatteryLevelEntityImpl value,
          $Res Function(_$DeviceCapabilityStateBatteryLevelEntityImpl) then) =
      __$$DeviceCapabilityStateBatteryLevelEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$DeviceCapabilityStateBatteryLevelEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateBatteryLevelEntityImpl>
    implements _$$DeviceCapabilityStateBatteryLevelEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateBatteryLevelEntityImplCopyWithImpl(
      _$DeviceCapabilityStateBatteryLevelEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateBatteryLevelEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$DeviceCapabilityStateBatteryLevelEntityImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateBatteryLevelEntityImpl
    extends DeviceCapabilityStateBatteryLevelEntity {
  const _$DeviceCapabilityStateBatteryLevelEntityImpl(
      {required this.value, final String? $type})
      : $type = $type ?? 'battery_level',
        super._();

  factory _$DeviceCapabilityStateBatteryLevelEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateBatteryLevelEntityImplFromJson(json);

  @override
  final double value;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.batteryLevel(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateBatteryLevelEntityImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityStateBatteryLevelEntityImplCopyWith<
          _$DeviceCapabilityStateBatteryLevelEntityImpl>
      get copyWith =>
          __$$DeviceCapabilityStateBatteryLevelEntityImplCopyWithImpl<
              _$DeviceCapabilityStateBatteryLevelEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return batteryLevel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return batteryLevel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (batteryLevel != null) {
      return batteryLevel(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateBatteryLevelEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateBatteryLevelEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateBatteryLevelEntity(
          {required final double value}) =
      _$DeviceCapabilityStateBatteryLevelEntityImpl;
  const DeviceCapabilityStateBatteryLevelEntity._() : super._();

  factory DeviceCapabilityStateBatteryLevelEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityStateBatteryLevelEntityImpl.fromJson;

  double get value;
  @JsonKey(ignore: true)
  _$$DeviceCapabilityStateBatteryLevelEntityImplCopyWith<
          _$DeviceCapabilityStateBatteryLevelEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityStateUnknownEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityStateUnknownEntityImplCopyWith(
          _$DeviceCapabilityStateUnknownEntityImpl value,
          $Res Function(_$DeviceCapabilityStateUnknownEntityImpl) then) =
      __$$DeviceCapabilityStateUnknownEntityImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeviceCapabilityStateUnknownEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityStateEntityCopyWithImpl<$Res,
        _$DeviceCapabilityStateUnknownEntityImpl>
    implements _$$DeviceCapabilityStateUnknownEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityStateUnknownEntityImplCopyWithImpl(
      _$DeviceCapabilityStateUnknownEntityImpl _value,
      $Res Function(_$DeviceCapabilityStateUnknownEntityImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityStateUnknownEntityImpl
    extends DeviceCapabilityStateUnknownEntity {
  const _$DeviceCapabilityStateUnknownEntityImpl({final String? $type})
      : $type = $type ?? 'unknown',
        super._();

  factory _$DeviceCapabilityStateUnknownEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityStateUnknownEntityImplFromJson(json);

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityStateEntity.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityStateUnknownEntityImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityStateOnEntity value) on,
    required TResult Function(DeviceCapabilityStateRgbEntity value) rgb,
    required TResult Function(DeviceCapabilityStateHsvEntity value) hsv,
    required TResult Function(DeviceCapabilityStateTemperatureKEntity value)
        temperatureK,
    required TResult Function(DeviceCapabilityStateSceneEntity value) scene,
    required TResult Function(DeviceCapabilityStateTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityStateHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityStateWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityStateBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityStateChannelEntity value) channel,
    required TResult Function(DeviceCapabilityStateVolumeEntity value) volume,
    required TResult Function(DeviceCapabilityStateOpenEntity value) open,
    required TResult Function(DeviceCapabilityStateBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityStateUnknownEntity value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityStateOnEntity value)? on,
    TResult? Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult? Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult? Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult? Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult? Function(DeviceCapabilityStateTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult? Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult? Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult? Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityStateUnknownEntity value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityStateOnEntity value)? on,
    TResult Function(DeviceCapabilityStateRgbEntity value)? rgb,
    TResult Function(DeviceCapabilityStateHsvEntity value)? hsv,
    TResult Function(DeviceCapabilityStateTemperatureKEntity value)?
        temperatureK,
    TResult Function(DeviceCapabilityStateSceneEntity value)? scene,
    TResult Function(DeviceCapabilityStateTemperatureEntity value)? temperature,
    TResult Function(DeviceCapabilityStateHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityStateWorkSpeedEntity value)? workSpeed,
    TResult Function(DeviceCapabilityStateBrightnessEntity value)? brightness,
    TResult Function(DeviceCapabilityStateChannelEntity value)? channel,
    TResult Function(DeviceCapabilityStateVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityStateOpenEntity value)? open,
    TResult Function(DeviceCapabilityStateBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityStateUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityStateUnknownEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityStateUnknownEntity
    extends DeviceCapabilityStateEntity {
  const factory DeviceCapabilityStateUnknownEntity() =
      _$DeviceCapabilityStateUnknownEntityImpl;
  const DeviceCapabilityStateUnknownEntity._() : super._();

  factory DeviceCapabilityStateUnknownEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityStateUnknownEntityImpl.fromJson;
}
