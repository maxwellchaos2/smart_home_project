// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command_parser_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommandParserResultEntity {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommandParserResultOnOffEntity value) onOff,
    required TResult Function(CommandParserResultOpenEntity value) open,
    required TResult Function(CommandParserResultSayTemperatureEntity value)
        sayTemperature,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommandParserResultOnOffEntity value)? onOff,
    TResult? Function(CommandParserResultOpenEntity value)? open,
    TResult? Function(CommandParserResultSayTemperatureEntity value)?
        sayTemperature,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommandParserResultOnOffEntity value)? onOff,
    TResult Function(CommandParserResultOpenEntity value)? open,
    TResult Function(CommandParserResultSayTemperatureEntity value)?
        sayTemperature,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandParserResultEntityCopyWith<$Res> {
  factory $CommandParserResultEntityCopyWith(CommandParserResultEntity value,
          $Res Function(CommandParserResultEntity) then) =
      _$CommandParserResultEntityCopyWithImpl<$Res, CommandParserResultEntity>;
}

/// @nodoc
class _$CommandParserResultEntityCopyWithImpl<$Res,
        $Val extends CommandParserResultEntity>
    implements $CommandParserResultEntityCopyWith<$Res> {
  _$CommandParserResultEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CommandParserResultOnOffEntityImplCopyWith<$Res> {
  factory _$$CommandParserResultOnOffEntityImplCopyWith(
          _$CommandParserResultOnOffEntityImpl value,
          $Res Function(_$CommandParserResultOnOffEntityImpl) then) =
      __$$CommandParserResultOnOffEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceEntity device, bool isOn});

  $DeviceEntityCopyWith<$Res> get device;
}

/// @nodoc
class __$$CommandParserResultOnOffEntityImplCopyWithImpl<$Res>
    extends _$CommandParserResultEntityCopyWithImpl<$Res,
        _$CommandParserResultOnOffEntityImpl>
    implements _$$CommandParserResultOnOffEntityImplCopyWith<$Res> {
  __$$CommandParserResultOnOffEntityImplCopyWithImpl(
      _$CommandParserResultOnOffEntityImpl _value,
      $Res Function(_$CommandParserResultOnOffEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? isOn = null,
  }) {
    return _then(_$CommandParserResultOnOffEntityImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceEntity,
      isOn: null == isOn
          ? _value.isOn
          : isOn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceEntityCopyWith<$Res> get device {
    return $DeviceEntityCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc

class _$CommandParserResultOnOffEntityImpl
    extends CommandParserResultOnOffEntity {
  const _$CommandParserResultOnOffEntityImpl(
      {required this.device, required this.isOn})
      : super._();

  @override
  final DeviceEntity device;
  @override
  final bool isOn;

  @override
  String toString() {
    return 'CommandParserResultEntity.onOff(device: $device, isOn: $isOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandParserResultOnOffEntityImpl &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.isOn, isOn) || other.isOn == isOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device, isOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandParserResultOnOffEntityImplCopyWith<
          _$CommandParserResultOnOffEntityImpl>
      get copyWith => __$$CommandParserResultOnOffEntityImplCopyWithImpl<
          _$CommandParserResultOnOffEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommandParserResultOnOffEntity value) onOff,
    required TResult Function(CommandParserResultOpenEntity value) open,
    required TResult Function(CommandParserResultSayTemperatureEntity value)
        sayTemperature,
  }) {
    return onOff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommandParserResultOnOffEntity value)? onOff,
    TResult? Function(CommandParserResultOpenEntity value)? open,
    TResult? Function(CommandParserResultSayTemperatureEntity value)?
        sayTemperature,
  }) {
    return onOff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommandParserResultOnOffEntity value)? onOff,
    TResult Function(CommandParserResultOpenEntity value)? open,
    TResult Function(CommandParserResultSayTemperatureEntity value)?
        sayTemperature,
    required TResult orElse(),
  }) {
    if (onOff != null) {
      return onOff(this);
    }
    return orElse();
  }
}

abstract class CommandParserResultOnOffEntity
    extends CommandParserResultEntity {
  const factory CommandParserResultOnOffEntity(
      {required final DeviceEntity device,
      required final bool isOn}) = _$CommandParserResultOnOffEntityImpl;
  const CommandParserResultOnOffEntity._() : super._();

  DeviceEntity get device;
  bool get isOn;
  @JsonKey(ignore: true)
  _$$CommandParserResultOnOffEntityImplCopyWith<
          _$CommandParserResultOnOffEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommandParserResultOpenEntityImplCopyWith<$Res> {
  factory _$$CommandParserResultOpenEntityImplCopyWith(
          _$CommandParserResultOpenEntityImpl value,
          $Res Function(_$CommandParserResultOpenEntityImpl) then) =
      __$$CommandParserResultOpenEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceEntity device, double openValue});

  $DeviceEntityCopyWith<$Res> get device;
}

/// @nodoc
class __$$CommandParserResultOpenEntityImplCopyWithImpl<$Res>
    extends _$CommandParserResultEntityCopyWithImpl<$Res,
        _$CommandParserResultOpenEntityImpl>
    implements _$$CommandParserResultOpenEntityImplCopyWith<$Res> {
  __$$CommandParserResultOpenEntityImplCopyWithImpl(
      _$CommandParserResultOpenEntityImpl _value,
      $Res Function(_$CommandParserResultOpenEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
    Object? openValue = null,
  }) {
    return _then(_$CommandParserResultOpenEntityImpl(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as DeviceEntity,
      openValue: null == openValue
          ? _value.openValue
          : openValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceEntityCopyWith<$Res> get device {
    return $DeviceEntityCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc

class _$CommandParserResultOpenEntityImpl
    extends CommandParserResultOpenEntity {
  const _$CommandParserResultOpenEntityImpl(
      {required this.device, required this.openValue})
      : super._();

  @override
  final DeviceEntity device;
  @override
  final double openValue;

  @override
  String toString() {
    return 'CommandParserResultEntity.open(device: $device, openValue: $openValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandParserResultOpenEntityImpl &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.openValue, openValue) ||
                other.openValue == openValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device, openValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandParserResultOpenEntityImplCopyWith<
          _$CommandParserResultOpenEntityImpl>
      get copyWith => __$$CommandParserResultOpenEntityImplCopyWithImpl<
          _$CommandParserResultOpenEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommandParserResultOnOffEntity value) onOff,
    required TResult Function(CommandParserResultOpenEntity value) open,
    required TResult Function(CommandParserResultSayTemperatureEntity value)
        sayTemperature,
  }) {
    return open(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommandParserResultOnOffEntity value)? onOff,
    TResult? Function(CommandParserResultOpenEntity value)? open,
    TResult? Function(CommandParserResultSayTemperatureEntity value)?
        sayTemperature,
  }) {
    return open?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommandParserResultOnOffEntity value)? onOff,
    TResult Function(CommandParserResultOpenEntity value)? open,
    TResult Function(CommandParserResultSayTemperatureEntity value)?
        sayTemperature,
    required TResult orElse(),
  }) {
    if (open != null) {
      return open(this);
    }
    return orElse();
  }
}

abstract class CommandParserResultOpenEntity extends CommandParserResultEntity {
  const factory CommandParserResultOpenEntity(
      {required final DeviceEntity device,
      required final double openValue}) = _$CommandParserResultOpenEntityImpl;
  const CommandParserResultOpenEntity._() : super._();

  DeviceEntity get device;
  double get openValue;
  @JsonKey(ignore: true)
  _$$CommandParserResultOpenEntityImplCopyWith<
          _$CommandParserResultOpenEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommandParserResultSayTemperatureEntityImplCopyWith<$Res> {
  factory _$$CommandParserResultSayTemperatureEntityImplCopyWith(
          _$CommandParserResultSayTemperatureEntityImpl value,
          $Res Function(_$CommandParserResultSayTemperatureEntityImpl) then) =
      __$$CommandParserResultSayTemperatureEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int temperature});
}

/// @nodoc
class __$$CommandParserResultSayTemperatureEntityImplCopyWithImpl<$Res>
    extends _$CommandParserResultEntityCopyWithImpl<$Res,
        _$CommandParserResultSayTemperatureEntityImpl>
    implements _$$CommandParserResultSayTemperatureEntityImplCopyWith<$Res> {
  __$$CommandParserResultSayTemperatureEntityImplCopyWithImpl(
      _$CommandParserResultSayTemperatureEntityImpl _value,
      $Res Function(_$CommandParserResultSayTemperatureEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
  }) {
    return _then(_$CommandParserResultSayTemperatureEntityImpl(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CommandParserResultSayTemperatureEntityImpl
    extends CommandParserResultSayTemperatureEntity {
  const _$CommandParserResultSayTemperatureEntityImpl(
      {required this.temperature})
      : super._();

  @override
  final int temperature;

  @override
  String toString() {
    return 'CommandParserResultEntity.sayTemperature(temperature: $temperature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandParserResultSayTemperatureEntityImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature));
  }

  @override
  int get hashCode => Object.hash(runtimeType, temperature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandParserResultSayTemperatureEntityImplCopyWith<
          _$CommandParserResultSayTemperatureEntityImpl>
      get copyWith =>
          __$$CommandParserResultSayTemperatureEntityImplCopyWithImpl<
              _$CommandParserResultSayTemperatureEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CommandParserResultOnOffEntity value) onOff,
    required TResult Function(CommandParserResultOpenEntity value) open,
    required TResult Function(CommandParserResultSayTemperatureEntity value)
        sayTemperature,
  }) {
    return sayTemperature(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CommandParserResultOnOffEntity value)? onOff,
    TResult? Function(CommandParserResultOpenEntity value)? open,
    TResult? Function(CommandParserResultSayTemperatureEntity value)?
        sayTemperature,
  }) {
    return sayTemperature?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CommandParserResultOnOffEntity value)? onOff,
    TResult Function(CommandParserResultOpenEntity value)? open,
    TResult Function(CommandParserResultSayTemperatureEntity value)?
        sayTemperature,
    required TResult orElse(),
  }) {
    if (sayTemperature != null) {
      return sayTemperature(this);
    }
    return orElse();
  }
}

abstract class CommandParserResultSayTemperatureEntity
    extends CommandParserResultEntity {
  const factory CommandParserResultSayTemperatureEntity(
          {required final int temperature}) =
      _$CommandParserResultSayTemperatureEntityImpl;
  const CommandParserResultSayTemperatureEntity._() : super._();

  int get temperature;
  @JsonKey(ignore: true)
  _$$CommandParserResultSayTemperatureEntityImplCopyWith<
          _$CommandParserResultSayTemperatureEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
