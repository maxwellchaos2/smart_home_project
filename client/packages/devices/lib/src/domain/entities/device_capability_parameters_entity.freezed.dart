// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_capability_parameters_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceCapabilityParametersEntity _$DeviceCapabilityParametersEntityFromJson(
    Map<String, dynamic> json) {
  switch (json['instance']) {
    case 'on_off':
      return DeviceCapabilityParametersOnOffEntity.fromJson(json);
    case 'color_setting':
      return DeviceCapabilityParametersColorSettingEntity.fromJson(json);
    case 'work_speed':
      return DeviceCapabilityParametersWorkSpeedEntity.fromJson(json);
    case 'brightness':
      return DeviceCapabilityParametersBrightnessEntity.fromJson(json);
    case 'channel':
      return DeviceCapabilityParametersChannelEntity.fromJson(json);
    case 'humidity':
      return DeviceCapabilityParametersHumidityEntity.fromJson(json);
    case 'open':
      return DeviceCapabilityParametersOpenEntity.fromJson(json);
    case 'temperature':
      return DeviceCapabilityParametersTemperatureEntity.fromJson(json);
    case 'volume':
      return DeviceCapabilityParametersVolumeEntity.fromJson(json);
    case 'battery_level':
      return DeviceCapabilityParametersBatteryLevelEntity.fromJson(json);

    default:
      return DeviceCapabilityParametersUnknownEntity.fromJson(json);
  }
}

/// @nodoc
mixin _$DeviceCapabilityParametersEntity {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityParametersOnOffEntity value)
        onOff,
    required TResult Function(
            DeviceCapabilityParametersColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityParametersBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityParametersChannelEntity value)
        channel,
    required TResult Function(DeviceCapabilityParametersHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityParametersOpenEntity value) open,
    required TResult Function(DeviceCapabilityParametersTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityParametersVolumeEntity value)
        volume,
    required TResult Function(
            DeviceCapabilityParametersBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityParametersUnknownEntity value)
        unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult? Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult? Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult? Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult? Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this DeviceCapabilityParametersEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCapabilityParametersEntityCopyWith<$Res> {
  factory $DeviceCapabilityParametersEntityCopyWith(
          DeviceCapabilityParametersEntity value,
          $Res Function(DeviceCapabilityParametersEntity) then) =
      _$DeviceCapabilityParametersEntityCopyWithImpl<$Res,
          DeviceCapabilityParametersEntity>;
}

/// @nodoc
class _$DeviceCapabilityParametersEntityCopyWithImpl<$Res,
        $Val extends DeviceCapabilityParametersEntity>
    implements $DeviceCapabilityParametersEntityCopyWith<$Res> {
  _$DeviceCapabilityParametersEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DeviceCapabilityParametersOnOffEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityParametersOnOffEntityImplCopyWith(
          _$DeviceCapabilityParametersOnOffEntityImpl value,
          $Res Function(_$DeviceCapabilityParametersOnOffEntityImpl) then) =
      __$$DeviceCapabilityParametersOnOffEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool? split});
}

/// @nodoc
class __$$DeviceCapabilityParametersOnOffEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityParametersEntityCopyWithImpl<$Res,
        _$DeviceCapabilityParametersOnOffEntityImpl>
    implements _$$DeviceCapabilityParametersOnOffEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityParametersOnOffEntityImplCopyWithImpl(
      _$DeviceCapabilityParametersOnOffEntityImpl _value,
      $Res Function(_$DeviceCapabilityParametersOnOffEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? split = freezed,
  }) {
    return _then(_$DeviceCapabilityParametersOnOffEntityImpl(
      split: freezed == split
          ? _value.split
          : split // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityParametersOnOffEntityImpl
    extends DeviceCapabilityParametersOnOffEntity {
  const _$DeviceCapabilityParametersOnOffEntityImpl(
      {required this.split, final String? $type})
      : $type = $type ?? 'on_off',
        super._();

  factory _$DeviceCapabilityParametersOnOffEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityParametersOnOffEntityImplFromJson(json);

  @override
  final bool? split;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityParametersEntity.onOff(split: $split)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityParametersOnOffEntityImpl &&
            (identical(other.split, split) || other.split == split));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, split);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityParametersOnOffEntityImplCopyWith<
          _$DeviceCapabilityParametersOnOffEntityImpl>
      get copyWith => __$$DeviceCapabilityParametersOnOffEntityImplCopyWithImpl<
          _$DeviceCapabilityParametersOnOffEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityParametersOnOffEntity value)
        onOff,
    required TResult Function(
            DeviceCapabilityParametersColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityParametersBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityParametersChannelEntity value)
        channel,
    required TResult Function(DeviceCapabilityParametersHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityParametersOpenEntity value) open,
    required TResult Function(DeviceCapabilityParametersTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityParametersVolumeEntity value)
        volume,
    required TResult Function(
            DeviceCapabilityParametersBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityParametersUnknownEntity value)
        unknown,
  }) {
    return onOff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult? Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult? Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult? Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult? Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
  }) {
    return onOff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (onOff != null) {
      return onOff(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityParametersOnOffEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityParametersOnOffEntity
    extends DeviceCapabilityParametersEntity {
  const factory DeviceCapabilityParametersOnOffEntity(
          {required final bool? split}) =
      _$DeviceCapabilityParametersOnOffEntityImpl;
  const DeviceCapabilityParametersOnOffEntity._() : super._();

  factory DeviceCapabilityParametersOnOffEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityParametersOnOffEntityImpl.fromJson;

  bool? get split;

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityParametersOnOffEntityImplCopyWith<
          _$DeviceCapabilityParametersOnOffEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityParametersColorSettingEntityImplCopyWith<
    $Res> {
  factory _$$DeviceCapabilityParametersColorSettingEntityImplCopyWith(
          _$DeviceCapabilityParametersColorSettingEntityImpl value,
          $Res Function(_$DeviceCapabilityParametersColorSettingEntityImpl)
              then) =
      __$$DeviceCapabilityParametersColorSettingEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DeviceColorModel? colorModel,
      ({int? max, int? min})? temperatureK,
      ({List<({String id})> scenes})? colorScene});
}

/// @nodoc
class __$$DeviceCapabilityParametersColorSettingEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityParametersEntityCopyWithImpl<$Res,
        _$DeviceCapabilityParametersColorSettingEntityImpl>
    implements
        _$$DeviceCapabilityParametersColorSettingEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityParametersColorSettingEntityImplCopyWithImpl(
      _$DeviceCapabilityParametersColorSettingEntityImpl _value,
      $Res Function(_$DeviceCapabilityParametersColorSettingEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorModel = freezed,
    Object? temperatureK = freezed,
    Object? colorScene = freezed,
  }) {
    return _then(_$DeviceCapabilityParametersColorSettingEntityImpl(
      colorModel: freezed == colorModel
          ? _value.colorModel
          : colorModel // ignore: cast_nullable_to_non_nullable
              as DeviceColorModel?,
      temperatureK: freezed == temperatureK
          ? _value.temperatureK
          : temperatureK // ignore: cast_nullable_to_non_nullable
              as ({int? max, int? min})?,
      colorScene: freezed == colorScene
          ? _value.colorScene
          : colorScene // ignore: cast_nullable_to_non_nullable
              as ({List<({String id})> scenes})?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityParametersColorSettingEntityImpl
    extends DeviceCapabilityParametersColorSettingEntity {
  const _$DeviceCapabilityParametersColorSettingEntityImpl(
      {required this.colorModel,
      required this.temperatureK,
      required this.colorScene,
      final String? $type})
      : $type = $type ?? 'color_setting',
        super._();

  factory _$DeviceCapabilityParametersColorSettingEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityParametersColorSettingEntityImplFromJson(json);

  @override
  final DeviceColorModel? colorModel;
  @override
  final ({int? max, int? min})? temperatureK;
  @override
  final ({List<({String id})> scenes})? colorScene;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityParametersEntity.colorSetting(colorModel: $colorModel, temperatureK: $temperatureK, colorScene: $colorScene)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityParametersColorSettingEntityImpl &&
            (identical(other.colorModel, colorModel) ||
                other.colorModel == colorModel) &&
            (identical(other.temperatureK, temperatureK) ||
                other.temperatureK == temperatureK) &&
            (identical(other.colorScene, colorScene) ||
                other.colorScene == colorScene));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, colorModel, temperatureK, colorScene);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityParametersColorSettingEntityImplCopyWith<
          _$DeviceCapabilityParametersColorSettingEntityImpl>
      get copyWith =>
          __$$DeviceCapabilityParametersColorSettingEntityImplCopyWithImpl<
                  _$DeviceCapabilityParametersColorSettingEntityImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityParametersOnOffEntity value)
        onOff,
    required TResult Function(
            DeviceCapabilityParametersColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityParametersBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityParametersChannelEntity value)
        channel,
    required TResult Function(DeviceCapabilityParametersHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityParametersOpenEntity value) open,
    required TResult Function(DeviceCapabilityParametersTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityParametersVolumeEntity value)
        volume,
    required TResult Function(
            DeviceCapabilityParametersBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityParametersUnknownEntity value)
        unknown,
  }) {
    return colorSetting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult? Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult? Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult? Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult? Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
  }) {
    return colorSetting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (colorSetting != null) {
      return colorSetting(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityParametersColorSettingEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityParametersColorSettingEntity
    extends DeviceCapabilityParametersEntity {
  const factory DeviceCapabilityParametersColorSettingEntity(
          {required final DeviceColorModel? colorModel,
          required final ({int? max, int? min})? temperatureK,
          required final ({List<({String id})> scenes})? colorScene}) =
      _$DeviceCapabilityParametersColorSettingEntityImpl;
  const DeviceCapabilityParametersColorSettingEntity._() : super._();

  factory DeviceCapabilityParametersColorSettingEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityParametersColorSettingEntityImpl.fromJson;

  DeviceColorModel? get colorModel;
  ({int? max, int? min})? get temperatureK;
  ({List<({String id})> scenes})? get colorScene;

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityParametersColorSettingEntityImplCopyWith<
          _$DeviceCapabilityParametersColorSettingEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityParametersWorkSpeedEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityParametersWorkSpeedEntityImplCopyWith(
          _$DeviceCapabilityParametersWorkSpeedEntityImpl value,
          $Res Function(_$DeviceCapabilityParametersWorkSpeedEntityImpl) then) =
      __$$DeviceCapabilityParametersWorkSpeedEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<({String value})> modes});
}

/// @nodoc
class __$$DeviceCapabilityParametersWorkSpeedEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityParametersEntityCopyWithImpl<$Res,
        _$DeviceCapabilityParametersWorkSpeedEntityImpl>
    implements _$$DeviceCapabilityParametersWorkSpeedEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityParametersWorkSpeedEntityImplCopyWithImpl(
      _$DeviceCapabilityParametersWorkSpeedEntityImpl _value,
      $Res Function(_$DeviceCapabilityParametersWorkSpeedEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modes = null,
  }) {
    return _then(_$DeviceCapabilityParametersWorkSpeedEntityImpl(
      modes: null == modes
          ? _value._modes
          : modes // ignore: cast_nullable_to_non_nullable
              as List<({String value})>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityParametersWorkSpeedEntityImpl
    extends DeviceCapabilityParametersWorkSpeedEntity {
  const _$DeviceCapabilityParametersWorkSpeedEntityImpl(
      {required final List<({String value})> modes, final String? $type})
      : _modes = modes,
        $type = $type ?? 'work_speed',
        super._();

  factory _$DeviceCapabilityParametersWorkSpeedEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityParametersWorkSpeedEntityImplFromJson(json);

  final List<({String value})> _modes;
  @override
  List<({String value})> get modes {
    if (_modes is EqualUnmodifiableListView) return _modes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modes);
  }

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityParametersEntity.workSpeed(modes: $modes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityParametersWorkSpeedEntityImpl &&
            const DeepCollectionEquality().equals(other._modes, _modes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_modes));

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityParametersWorkSpeedEntityImplCopyWith<
          _$DeviceCapabilityParametersWorkSpeedEntityImpl>
      get copyWith =>
          __$$DeviceCapabilityParametersWorkSpeedEntityImplCopyWithImpl<
                  _$DeviceCapabilityParametersWorkSpeedEntityImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityParametersOnOffEntity value)
        onOff,
    required TResult Function(
            DeviceCapabilityParametersColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityParametersBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityParametersChannelEntity value)
        channel,
    required TResult Function(DeviceCapabilityParametersHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityParametersOpenEntity value) open,
    required TResult Function(DeviceCapabilityParametersTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityParametersVolumeEntity value)
        volume,
    required TResult Function(
            DeviceCapabilityParametersBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityParametersUnknownEntity value)
        unknown,
  }) {
    return workSpeed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult? Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult? Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult? Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult? Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
  }) {
    return workSpeed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (workSpeed != null) {
      return workSpeed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityParametersWorkSpeedEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityParametersWorkSpeedEntity
    extends DeviceCapabilityParametersEntity {
  const factory DeviceCapabilityParametersWorkSpeedEntity(
          {required final List<({String value})> modes}) =
      _$DeviceCapabilityParametersWorkSpeedEntityImpl;
  const DeviceCapabilityParametersWorkSpeedEntity._() : super._();

  factory DeviceCapabilityParametersWorkSpeedEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityParametersWorkSpeedEntityImpl.fromJson;

  List<({String value})> get modes;

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityParametersWorkSpeedEntityImplCopyWith<
          _$DeviceCapabilityParametersWorkSpeedEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityParametersBrightnessEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityParametersBrightnessEntityImplCopyWith(
          _$DeviceCapabilityParametersBrightnessEntityImpl value,
          $Res Function(_$DeviceCapabilityParametersBrightnessEntityImpl)
              then) =
      __$$DeviceCapabilityParametersBrightnessEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      DeviceUnit? unit,
      ({double max, double min, double? precision})? range});
}

/// @nodoc
class __$$DeviceCapabilityParametersBrightnessEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityParametersEntityCopyWithImpl<$Res,
        _$DeviceCapabilityParametersBrightnessEntityImpl>
    implements _$$DeviceCapabilityParametersBrightnessEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityParametersBrightnessEntityImplCopyWithImpl(
      _$DeviceCapabilityParametersBrightnessEntityImpl _value,
      $Res Function(_$DeviceCapabilityParametersBrightnessEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = freezed,
    Object? range = freezed,
  }) {
    return _then(_$DeviceCapabilityParametersBrightnessEntityImpl(
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as DeviceUnit?,
      range: freezed == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as ({double max, double min, double? precision})?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityParametersBrightnessEntityImpl
    extends DeviceCapabilityParametersBrightnessEntity {
  const _$DeviceCapabilityParametersBrightnessEntityImpl(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      required this.unit,
      required this.range,
      final String? $type})
      : $type = $type ?? 'brightness',
        super._();

  factory _$DeviceCapabilityParametersBrightnessEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityParametersBrightnessEntityImplFromJson(json);

  @override
  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  final DeviceUnit? unit;
  @override
  final ({double max, double min, double? precision})? range;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityParametersEntity.brightness(unit: $unit, range: $range)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityParametersBrightnessEntityImpl &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.range, range) || other.range == range));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unit, range);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityParametersBrightnessEntityImplCopyWith<
          _$DeviceCapabilityParametersBrightnessEntityImpl>
      get copyWith =>
          __$$DeviceCapabilityParametersBrightnessEntityImplCopyWithImpl<
                  _$DeviceCapabilityParametersBrightnessEntityImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityParametersOnOffEntity value)
        onOff,
    required TResult Function(
            DeviceCapabilityParametersColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityParametersBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityParametersChannelEntity value)
        channel,
    required TResult Function(DeviceCapabilityParametersHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityParametersOpenEntity value) open,
    required TResult Function(DeviceCapabilityParametersTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityParametersVolumeEntity value)
        volume,
    required TResult Function(
            DeviceCapabilityParametersBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityParametersUnknownEntity value)
        unknown,
  }) {
    return brightness(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult? Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult? Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult? Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult? Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
  }) {
    return brightness?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (brightness != null) {
      return brightness(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityParametersBrightnessEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityParametersBrightnessEntity
    extends DeviceCapabilityParametersEntity {
  const factory DeviceCapabilityParametersBrightnessEntity(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      required final DeviceUnit? unit,
      required final ({
        double max,
        double min,
        double? precision
      })? range}) = _$DeviceCapabilityParametersBrightnessEntityImpl;
  const DeviceCapabilityParametersBrightnessEntity._() : super._();

  factory DeviceCapabilityParametersBrightnessEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityParametersBrightnessEntityImpl.fromJson;

  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  DeviceUnit? get unit;
  ({double max, double min, double? precision})? get range;

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityParametersBrightnessEntityImplCopyWith<
          _$DeviceCapabilityParametersBrightnessEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityParametersChannelEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityParametersChannelEntityImplCopyWith(
          _$DeviceCapabilityParametersChannelEntityImpl value,
          $Res Function(_$DeviceCapabilityParametersChannelEntityImpl) then) =
      __$$DeviceCapabilityParametersChannelEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      DeviceUnit? unit,
      ({double max, double min, double? precision})? range});
}

/// @nodoc
class __$$DeviceCapabilityParametersChannelEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityParametersEntityCopyWithImpl<$Res,
        _$DeviceCapabilityParametersChannelEntityImpl>
    implements _$$DeviceCapabilityParametersChannelEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityParametersChannelEntityImplCopyWithImpl(
      _$DeviceCapabilityParametersChannelEntityImpl _value,
      $Res Function(_$DeviceCapabilityParametersChannelEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = freezed,
    Object? range = freezed,
  }) {
    return _then(_$DeviceCapabilityParametersChannelEntityImpl(
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as DeviceUnit?,
      range: freezed == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as ({double max, double min, double? precision})?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityParametersChannelEntityImpl
    extends DeviceCapabilityParametersChannelEntity {
  const _$DeviceCapabilityParametersChannelEntityImpl(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      required this.unit,
      required this.range,
      final String? $type})
      : $type = $type ?? 'channel',
        super._();

  factory _$DeviceCapabilityParametersChannelEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityParametersChannelEntityImplFromJson(json);

  @override
  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  final DeviceUnit? unit;
  @override
  final ({double max, double min, double? precision})? range;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityParametersEntity.channel(unit: $unit, range: $range)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityParametersChannelEntityImpl &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.range, range) || other.range == range));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unit, range);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityParametersChannelEntityImplCopyWith<
          _$DeviceCapabilityParametersChannelEntityImpl>
      get copyWith =>
          __$$DeviceCapabilityParametersChannelEntityImplCopyWithImpl<
              _$DeviceCapabilityParametersChannelEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityParametersOnOffEntity value)
        onOff,
    required TResult Function(
            DeviceCapabilityParametersColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityParametersBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityParametersChannelEntity value)
        channel,
    required TResult Function(DeviceCapabilityParametersHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityParametersOpenEntity value) open,
    required TResult Function(DeviceCapabilityParametersTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityParametersVolumeEntity value)
        volume,
    required TResult Function(
            DeviceCapabilityParametersBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityParametersUnknownEntity value)
        unknown,
  }) {
    return channel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult? Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult? Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult? Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult? Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
  }) {
    return channel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (channel != null) {
      return channel(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityParametersChannelEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityParametersChannelEntity
    extends DeviceCapabilityParametersEntity {
  const factory DeviceCapabilityParametersChannelEntity(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      required final DeviceUnit? unit,
      required final ({
        double max,
        double min,
        double? precision
      })? range}) = _$DeviceCapabilityParametersChannelEntityImpl;
  const DeviceCapabilityParametersChannelEntity._() : super._();

  factory DeviceCapabilityParametersChannelEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityParametersChannelEntityImpl.fromJson;

  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  DeviceUnit? get unit;
  ({double max, double min, double? precision})? get range;

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityParametersChannelEntityImplCopyWith<
          _$DeviceCapabilityParametersChannelEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityParametersHumidityEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityParametersHumidityEntityImplCopyWith(
          _$DeviceCapabilityParametersHumidityEntityImpl value,
          $Res Function(_$DeviceCapabilityParametersHumidityEntityImpl) then) =
      __$$DeviceCapabilityParametersHumidityEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      DeviceUnit? unit});
}

/// @nodoc
class __$$DeviceCapabilityParametersHumidityEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityParametersEntityCopyWithImpl<$Res,
        _$DeviceCapabilityParametersHumidityEntityImpl>
    implements _$$DeviceCapabilityParametersHumidityEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityParametersHumidityEntityImplCopyWithImpl(
      _$DeviceCapabilityParametersHumidityEntityImpl _value,
      $Res Function(_$DeviceCapabilityParametersHumidityEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = freezed,
  }) {
    return _then(_$DeviceCapabilityParametersHumidityEntityImpl(
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as DeviceUnit?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityParametersHumidityEntityImpl
    extends DeviceCapabilityParametersHumidityEntity {
  const _$DeviceCapabilityParametersHumidityEntityImpl(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      required this.unit,
      final String? $type})
      : $type = $type ?? 'humidity',
        super._();

  factory _$DeviceCapabilityParametersHumidityEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityParametersHumidityEntityImplFromJson(json);

  @override
  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  final DeviceUnit? unit;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityParametersEntity.humidity(unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityParametersHumidityEntityImpl &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unit);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityParametersHumidityEntityImplCopyWith<
          _$DeviceCapabilityParametersHumidityEntityImpl>
      get copyWith =>
          __$$DeviceCapabilityParametersHumidityEntityImplCopyWithImpl<
              _$DeviceCapabilityParametersHumidityEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityParametersOnOffEntity value)
        onOff,
    required TResult Function(
            DeviceCapabilityParametersColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityParametersBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityParametersChannelEntity value)
        channel,
    required TResult Function(DeviceCapabilityParametersHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityParametersOpenEntity value) open,
    required TResult Function(DeviceCapabilityParametersTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityParametersVolumeEntity value)
        volume,
    required TResult Function(
            DeviceCapabilityParametersBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityParametersUnknownEntity value)
        unknown,
  }) {
    return humidity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult? Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult? Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult? Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult? Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
  }) {
    return humidity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (humidity != null) {
      return humidity(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityParametersHumidityEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityParametersHumidityEntity
    extends DeviceCapabilityParametersEntity {
  const factory DeviceCapabilityParametersHumidityEntity(
          {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
          required final DeviceUnit? unit}) =
      _$DeviceCapabilityParametersHumidityEntityImpl;
  const DeviceCapabilityParametersHumidityEntity._() : super._();

  factory DeviceCapabilityParametersHumidityEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityParametersHumidityEntityImpl.fromJson;

  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  DeviceUnit? get unit;

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityParametersHumidityEntityImplCopyWith<
          _$DeviceCapabilityParametersHumidityEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityParametersOpenEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityParametersOpenEntityImplCopyWith(
          _$DeviceCapabilityParametersOpenEntityImpl value,
          $Res Function(_$DeviceCapabilityParametersOpenEntityImpl) then) =
      __$$DeviceCapabilityParametersOpenEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      DeviceUnit? unit,
      ({double max, double min, double? precision})? range});
}

/// @nodoc
class __$$DeviceCapabilityParametersOpenEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityParametersEntityCopyWithImpl<$Res,
        _$DeviceCapabilityParametersOpenEntityImpl>
    implements _$$DeviceCapabilityParametersOpenEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityParametersOpenEntityImplCopyWithImpl(
      _$DeviceCapabilityParametersOpenEntityImpl _value,
      $Res Function(_$DeviceCapabilityParametersOpenEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = freezed,
    Object? range = freezed,
  }) {
    return _then(_$DeviceCapabilityParametersOpenEntityImpl(
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as DeviceUnit?,
      range: freezed == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as ({double max, double min, double? precision})?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityParametersOpenEntityImpl
    extends DeviceCapabilityParametersOpenEntity {
  const _$DeviceCapabilityParametersOpenEntityImpl(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      required this.unit,
      required this.range,
      final String? $type})
      : $type = $type ?? 'open',
        super._();

  factory _$DeviceCapabilityParametersOpenEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityParametersOpenEntityImplFromJson(json);

  @override
  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  final DeviceUnit? unit;
  @override
  final ({double max, double min, double? precision})? range;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityParametersEntity.open(unit: $unit, range: $range)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityParametersOpenEntityImpl &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.range, range) || other.range == range));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unit, range);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityParametersOpenEntityImplCopyWith<
          _$DeviceCapabilityParametersOpenEntityImpl>
      get copyWith => __$$DeviceCapabilityParametersOpenEntityImplCopyWithImpl<
          _$DeviceCapabilityParametersOpenEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityParametersOnOffEntity value)
        onOff,
    required TResult Function(
            DeviceCapabilityParametersColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityParametersBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityParametersChannelEntity value)
        channel,
    required TResult Function(DeviceCapabilityParametersHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityParametersOpenEntity value) open,
    required TResult Function(DeviceCapabilityParametersTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityParametersVolumeEntity value)
        volume,
    required TResult Function(
            DeviceCapabilityParametersBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityParametersUnknownEntity value)
        unknown,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult? Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult? Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult? Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult? Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityParametersOpenEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityParametersOpenEntity
    extends DeviceCapabilityParametersEntity {
  const factory DeviceCapabilityParametersOpenEntity(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      required final DeviceUnit? unit,
      required final ({
        double max,
        double min,
        double? precision
      })? range}) = _$DeviceCapabilityParametersOpenEntityImpl;
  const DeviceCapabilityParametersOpenEntity._() : super._();

  factory DeviceCapabilityParametersOpenEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityParametersOpenEntityImpl.fromJson;

  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  DeviceUnit? get unit;
  ({double max, double min, double? precision})? get range;

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityParametersOpenEntityImplCopyWith<
          _$DeviceCapabilityParametersOpenEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityParametersTemperatureEntityImplCopyWith<
    $Res> {
  factory _$$DeviceCapabilityParametersTemperatureEntityImplCopyWith(
          _$DeviceCapabilityParametersTemperatureEntityImpl value,
          $Res Function(_$DeviceCapabilityParametersTemperatureEntityImpl)
              then) =
      __$$DeviceCapabilityParametersTemperatureEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool? randomAccess,
      @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      DeviceUnit? unit,
      ({double max, double min, double? precision})? range});
}

/// @nodoc
class __$$DeviceCapabilityParametersTemperatureEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityParametersEntityCopyWithImpl<$Res,
        _$DeviceCapabilityParametersTemperatureEntityImpl>
    implements
        _$$DeviceCapabilityParametersTemperatureEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityParametersTemperatureEntityImplCopyWithImpl(
      _$DeviceCapabilityParametersTemperatureEntityImpl _value,
      $Res Function(_$DeviceCapabilityParametersTemperatureEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? randomAccess = freezed,
    Object? unit = freezed,
    Object? range = freezed,
  }) {
    return _then(_$DeviceCapabilityParametersTemperatureEntityImpl(
      randomAccess: freezed == randomAccess
          ? _value.randomAccess
          : randomAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as DeviceUnit?,
      range: freezed == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as ({double max, double min, double? precision})?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityParametersTemperatureEntityImpl
    extends DeviceCapabilityParametersTemperatureEntity {
  const _$DeviceCapabilityParametersTemperatureEntityImpl(
      {required this.randomAccess,
      @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      required this.unit,
      required this.range,
      final String? $type})
      : $type = $type ?? 'temperature',
        super._();

  factory _$DeviceCapabilityParametersTemperatureEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityParametersTemperatureEntityImplFromJson(json);

  @override
  final bool? randomAccess;
  @override
  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  final DeviceUnit? unit;
  @override
  final ({double max, double min, double? precision})? range;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityParametersEntity.temperature(randomAccess: $randomAccess, unit: $unit, range: $range)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityParametersTemperatureEntityImpl &&
            (identical(other.randomAccess, randomAccess) ||
                other.randomAccess == randomAccess) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.range, range) || other.range == range));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, randomAccess, unit, range);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityParametersTemperatureEntityImplCopyWith<
          _$DeviceCapabilityParametersTemperatureEntityImpl>
      get copyWith =>
          __$$DeviceCapabilityParametersTemperatureEntityImplCopyWithImpl<
                  _$DeviceCapabilityParametersTemperatureEntityImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityParametersOnOffEntity value)
        onOff,
    required TResult Function(
            DeviceCapabilityParametersColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityParametersBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityParametersChannelEntity value)
        channel,
    required TResult Function(DeviceCapabilityParametersHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityParametersOpenEntity value) open,
    required TResult Function(DeviceCapabilityParametersTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityParametersVolumeEntity value)
        volume,
    required TResult Function(
            DeviceCapabilityParametersBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityParametersUnknownEntity value)
        unknown,
  }) {
    return temperature(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult? Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult? Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult? Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult? Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
  }) {
    return temperature?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (temperature != null) {
      return temperature(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityParametersTemperatureEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityParametersTemperatureEntity
    extends DeviceCapabilityParametersEntity {
  const factory DeviceCapabilityParametersTemperatureEntity(
      {required final bool? randomAccess,
      @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      required final DeviceUnit? unit,
      required final ({
        double max,
        double min,
        double? precision
      })? range}) = _$DeviceCapabilityParametersTemperatureEntityImpl;
  const DeviceCapabilityParametersTemperatureEntity._() : super._();

  factory DeviceCapabilityParametersTemperatureEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityParametersTemperatureEntityImpl.fromJson;

  bool? get randomAccess;
  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  DeviceUnit? get unit;
  ({double max, double min, double? precision})? get range;

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityParametersTemperatureEntityImplCopyWith<
          _$DeviceCapabilityParametersTemperatureEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityParametersVolumeEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityParametersVolumeEntityImplCopyWith(
          _$DeviceCapabilityParametersVolumeEntityImpl value,
          $Res Function(_$DeviceCapabilityParametersVolumeEntityImpl) then) =
      __$$DeviceCapabilityParametersVolumeEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      DeviceUnit? unit,
      ({double max, double min, double? precision})? range});
}

/// @nodoc
class __$$DeviceCapabilityParametersVolumeEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityParametersEntityCopyWithImpl<$Res,
        _$DeviceCapabilityParametersVolumeEntityImpl>
    implements _$$DeviceCapabilityParametersVolumeEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityParametersVolumeEntityImplCopyWithImpl(
      _$DeviceCapabilityParametersVolumeEntityImpl _value,
      $Res Function(_$DeviceCapabilityParametersVolumeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = freezed,
    Object? range = freezed,
  }) {
    return _then(_$DeviceCapabilityParametersVolumeEntityImpl(
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as DeviceUnit?,
      range: freezed == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as ({double max, double min, double? precision})?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityParametersVolumeEntityImpl
    extends DeviceCapabilityParametersVolumeEntity {
  const _$DeviceCapabilityParametersVolumeEntityImpl(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      required this.unit,
      required this.range,
      final String? $type})
      : $type = $type ?? 'volume',
        super._();

  factory _$DeviceCapabilityParametersVolumeEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityParametersVolumeEntityImplFromJson(json);

  @override
  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  final DeviceUnit? unit;
  @override
  final ({double max, double min, double? precision})? range;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityParametersEntity.volume(unit: $unit, range: $range)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityParametersVolumeEntityImpl &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.range, range) || other.range == range));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unit, range);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityParametersVolumeEntityImplCopyWith<
          _$DeviceCapabilityParametersVolumeEntityImpl>
      get copyWith =>
          __$$DeviceCapabilityParametersVolumeEntityImplCopyWithImpl<
              _$DeviceCapabilityParametersVolumeEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityParametersOnOffEntity value)
        onOff,
    required TResult Function(
            DeviceCapabilityParametersColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityParametersBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityParametersChannelEntity value)
        channel,
    required TResult Function(DeviceCapabilityParametersHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityParametersOpenEntity value) open,
    required TResult Function(DeviceCapabilityParametersTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityParametersVolumeEntity value)
        volume,
    required TResult Function(
            DeviceCapabilityParametersBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityParametersUnknownEntity value)
        unknown,
  }) {
    return volume(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult? Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult? Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult? Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult? Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
  }) {
    return volume?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (volume != null) {
      return volume(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityParametersVolumeEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityParametersVolumeEntity
    extends DeviceCapabilityParametersEntity {
  const factory DeviceCapabilityParametersVolumeEntity(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      required final DeviceUnit? unit,
      required final ({
        double max,
        double min,
        double? precision
      })? range}) = _$DeviceCapabilityParametersVolumeEntityImpl;
  const DeviceCapabilityParametersVolumeEntity._() : super._();

  factory DeviceCapabilityParametersVolumeEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityParametersVolumeEntityImpl.fromJson;

  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  DeviceUnit? get unit;
  ({double max, double min, double? precision})? get range;

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityParametersVolumeEntityImplCopyWith<
          _$DeviceCapabilityParametersVolumeEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityParametersBatteryLevelEntityImplCopyWith<
    $Res> {
  factory _$$DeviceCapabilityParametersBatteryLevelEntityImplCopyWith(
          _$DeviceCapabilityParametersBatteryLevelEntityImpl value,
          $Res Function(_$DeviceCapabilityParametersBatteryLevelEntityImpl)
              then) =
      __$$DeviceCapabilityParametersBatteryLevelEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      DeviceUnit? unit,
      ({double max, double min, double? precision})? range});
}

/// @nodoc
class __$$DeviceCapabilityParametersBatteryLevelEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityParametersEntityCopyWithImpl<$Res,
        _$DeviceCapabilityParametersBatteryLevelEntityImpl>
    implements
        _$$DeviceCapabilityParametersBatteryLevelEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityParametersBatteryLevelEntityImplCopyWithImpl(
      _$DeviceCapabilityParametersBatteryLevelEntityImpl _value,
      $Res Function(_$DeviceCapabilityParametersBatteryLevelEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = freezed,
    Object? range = freezed,
  }) {
    return _then(_$DeviceCapabilityParametersBatteryLevelEntityImpl(
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as DeviceUnit?,
      range: freezed == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as ({double max, double min, double? precision})?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityParametersBatteryLevelEntityImpl
    extends DeviceCapabilityParametersBatteryLevelEntity {
  const _$DeviceCapabilityParametersBatteryLevelEntityImpl(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      required this.unit,
      required this.range,
      final String? $type})
      : $type = $type ?? 'battery_level',
        super._();

  factory _$DeviceCapabilityParametersBatteryLevelEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityParametersBatteryLevelEntityImplFromJson(json);

  @override
  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  final DeviceUnit? unit;
  @override
  final ({double max, double min, double? precision})? range;

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityParametersEntity.batteryLevel(unit: $unit, range: $range)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityParametersBatteryLevelEntityImpl &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.range, range) || other.range == range));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unit, range);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityParametersBatteryLevelEntityImplCopyWith<
          _$DeviceCapabilityParametersBatteryLevelEntityImpl>
      get copyWith =>
          __$$DeviceCapabilityParametersBatteryLevelEntityImplCopyWithImpl<
                  _$DeviceCapabilityParametersBatteryLevelEntityImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityParametersOnOffEntity value)
        onOff,
    required TResult Function(
            DeviceCapabilityParametersColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityParametersBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityParametersChannelEntity value)
        channel,
    required TResult Function(DeviceCapabilityParametersHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityParametersOpenEntity value) open,
    required TResult Function(DeviceCapabilityParametersTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityParametersVolumeEntity value)
        volume,
    required TResult Function(
            DeviceCapabilityParametersBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityParametersUnknownEntity value)
        unknown,
  }) {
    return batteryLevel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult? Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult? Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult? Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult? Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
  }) {
    return batteryLevel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (batteryLevel != null) {
      return batteryLevel(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityParametersBatteryLevelEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityParametersBatteryLevelEntity
    extends DeviceCapabilityParametersEntity {
  const factory DeviceCapabilityParametersBatteryLevelEntity(
      {@JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
      required final DeviceUnit? unit,
      required final ({
        double max,
        double min,
        double? precision
      })? range}) = _$DeviceCapabilityParametersBatteryLevelEntityImpl;
  const DeviceCapabilityParametersBatteryLevelEntity._() : super._();

  factory DeviceCapabilityParametersBatteryLevelEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityParametersBatteryLevelEntityImpl.fromJson;

  @JsonKey(fromJson: _deviceUnitFromJson, toJson: _deviceUnitToJson)
  DeviceUnit? get unit;
  ({double max, double min, double? precision})? get range;

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityParametersBatteryLevelEntityImplCopyWith<
          _$DeviceCapabilityParametersBatteryLevelEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityParametersUnknownEntityImplCopyWith<$Res> {
  factory _$$DeviceCapabilityParametersUnknownEntityImplCopyWith(
          _$DeviceCapabilityParametersUnknownEntityImpl value,
          $Res Function(_$DeviceCapabilityParametersUnknownEntityImpl) then) =
      __$$DeviceCapabilityParametersUnknownEntityImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeviceCapabilityParametersUnknownEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityParametersEntityCopyWithImpl<$Res,
        _$DeviceCapabilityParametersUnknownEntityImpl>
    implements _$$DeviceCapabilityParametersUnknownEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityParametersUnknownEntityImplCopyWithImpl(
      _$DeviceCapabilityParametersUnknownEntityImpl _value,
      $Res Function(_$DeviceCapabilityParametersUnknownEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityParametersEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityParametersUnknownEntityImpl
    extends DeviceCapabilityParametersUnknownEntity {
  const _$DeviceCapabilityParametersUnknownEntityImpl({final String? $type})
      : $type = $type ?? 'unknown',
        super._();

  factory _$DeviceCapabilityParametersUnknownEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityParametersUnknownEntityImplFromJson(json);

  @JsonKey(name: 'instance')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityParametersEntity.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityParametersUnknownEntityImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityParametersOnOffEntity value)
        onOff,
    required TResult Function(
            DeviceCapabilityParametersColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)
        workSpeed,
    required TResult Function(DeviceCapabilityParametersBrightnessEntity value)
        brightness,
    required TResult Function(DeviceCapabilityParametersChannelEntity value)
        channel,
    required TResult Function(DeviceCapabilityParametersHumidityEntity value)
        humidity,
    required TResult Function(DeviceCapabilityParametersOpenEntity value) open,
    required TResult Function(DeviceCapabilityParametersTemperatureEntity value)
        temperature,
    required TResult Function(DeviceCapabilityParametersVolumeEntity value)
        volume,
    required TResult Function(
            DeviceCapabilityParametersBatteryLevelEntity value)
        batteryLevel,
    required TResult Function(DeviceCapabilityParametersUnknownEntity value)
        unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult? Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult? Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult? Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult? Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult? Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult? Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult? Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult? Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult? Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityParametersOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityParametersColorSettingEntity value)?
        colorSetting,
    TResult Function(DeviceCapabilityParametersWorkSpeedEntity value)?
        workSpeed,
    TResult Function(DeviceCapabilityParametersBrightnessEntity value)?
        brightness,
    TResult Function(DeviceCapabilityParametersChannelEntity value)? channel,
    TResult Function(DeviceCapabilityParametersHumidityEntity value)? humidity,
    TResult Function(DeviceCapabilityParametersOpenEntity value)? open,
    TResult Function(DeviceCapabilityParametersTemperatureEntity value)?
        temperature,
    TResult Function(DeviceCapabilityParametersVolumeEntity value)? volume,
    TResult Function(DeviceCapabilityParametersBatteryLevelEntity value)?
        batteryLevel,
    TResult Function(DeviceCapabilityParametersUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityParametersUnknownEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityParametersUnknownEntity
    extends DeviceCapabilityParametersEntity {
  const factory DeviceCapabilityParametersUnknownEntity() =
      _$DeviceCapabilityParametersUnknownEntityImpl;
  const DeviceCapabilityParametersUnknownEntity._() : super._();

  factory DeviceCapabilityParametersUnknownEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityParametersUnknownEntityImpl.fromJson;
}
