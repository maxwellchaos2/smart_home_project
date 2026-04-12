// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_capability_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceCapabilityEntity _$DeviceCapabilityEntityFromJson(
    Map<String, dynamic> json) {
  switch (json['type']) {
    case 'on_off':
      return DeviceCapabilityOnOffEntity.fromJson(json);
    case 'color_setting':
      return DeviceCapabilityColorSettingEntity.fromJson(json);
    case 'range':
      return DeviceCapabilityRangeEntity.fromJson(json);
    case 'mode':
      return _DeviceCapabilityModeEntity.fromJson(json);
    case 'float':
      return _DeviceCapabilityFloatEntity.fromJson(json);

    default:
      return _DeviceCapabilityUnknownEntity.fromJson(json);
  }
}

/// @nodoc
mixin _$DeviceCapabilityEntity {
  bool? get reportable => throw _privateConstructorUsedError;
  DeviceCapabilityStateEntity? get state => throw _privateConstructorUsedError;
  DeviceCapabilityParametersEntity? get parameters =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityOnOffEntity value) onOff,
    required TResult Function(DeviceCapabilityColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityRangeEntity value) range,
    required TResult Function(_DeviceCapabilityModeEntity value) mode,
    required TResult Function(_DeviceCapabilityFloatEntity value) float,
    required TResult Function(_DeviceCapabilityUnknownEntity value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult? Function(DeviceCapabilityRangeEntity value)? range,
    TResult? Function(_DeviceCapabilityModeEntity value)? mode,
    TResult? Function(_DeviceCapabilityFloatEntity value)? float,
    TResult? Function(_DeviceCapabilityUnknownEntity value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult Function(DeviceCapabilityRangeEntity value)? range,
    TResult Function(_DeviceCapabilityModeEntity value)? mode,
    TResult Function(_DeviceCapabilityFloatEntity value)? float,
    TResult Function(_DeviceCapabilityUnknownEntity value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this DeviceCapabilityEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceCapabilityEntityCopyWith<DeviceCapabilityEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCapabilityEntityCopyWith<$Res> {
  factory $DeviceCapabilityEntityCopyWith(DeviceCapabilityEntity value,
          $Res Function(DeviceCapabilityEntity) then) =
      _$DeviceCapabilityEntityCopyWithImpl<$Res, DeviceCapabilityEntity>;
  @useResult
  $Res call(
      {bool? reportable,
      DeviceCapabilityStateEntity? state,
      DeviceCapabilityParametersEntity? parameters});

  $DeviceCapabilityStateEntityCopyWith<$Res>? get state;
  $DeviceCapabilityParametersEntityCopyWith<$Res>? get parameters;
}

/// @nodoc
class _$DeviceCapabilityEntityCopyWithImpl<$Res,
        $Val extends DeviceCapabilityEntity>
    implements $DeviceCapabilityEntityCopyWith<$Res> {
  _$DeviceCapabilityEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportable = freezed,
    Object? state = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_value.copyWith(
      reportable: freezed == reportable
          ? _value.reportable
          : reportable // ignore: cast_nullable_to_non_nullable
              as bool?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityStateEntity?,
      parameters: freezed == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityParametersEntity?,
    ) as $Val);
  }

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCapabilityStateEntityCopyWith<$Res>? get state {
    if (_value.state == null) {
      return null;
    }

    return $DeviceCapabilityStateEntityCopyWith<$Res>(_value.state!, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCapabilityParametersEntityCopyWith<$Res>? get parameters {
    if (_value.parameters == null) {
      return null;
    }

    return $DeviceCapabilityParametersEntityCopyWith<$Res>(_value.parameters!,
        (value) {
      return _then(_value.copyWith(parameters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeviceCapabilityOnOffEntityImplCopyWith<$Res>
    implements $DeviceCapabilityEntityCopyWith<$Res> {
  factory _$$DeviceCapabilityOnOffEntityImplCopyWith(
          _$DeviceCapabilityOnOffEntityImpl value,
          $Res Function(_$DeviceCapabilityOnOffEntityImpl) then) =
      __$$DeviceCapabilityOnOffEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? reportable,
      DeviceCapabilityStateEntity? state,
      DeviceCapabilityParametersEntity? parameters});

  @override
  $DeviceCapabilityStateEntityCopyWith<$Res>? get state;
  @override
  $DeviceCapabilityParametersEntityCopyWith<$Res>? get parameters;
}

/// @nodoc
class __$$DeviceCapabilityOnOffEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityEntityCopyWithImpl<$Res,
        _$DeviceCapabilityOnOffEntityImpl>
    implements _$$DeviceCapabilityOnOffEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityOnOffEntityImplCopyWithImpl(
      _$DeviceCapabilityOnOffEntityImpl _value,
      $Res Function(_$DeviceCapabilityOnOffEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportable = freezed,
    Object? state = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_$DeviceCapabilityOnOffEntityImpl(
      reportable: freezed == reportable
          ? _value.reportable
          : reportable // ignore: cast_nullable_to_non_nullable
              as bool?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityStateEntity?,
      parameters: freezed == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityParametersEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityOnOffEntityImpl extends DeviceCapabilityOnOffEntity {
  const _$DeviceCapabilityOnOffEntityImpl(
      {this.reportable,
      required this.state,
      required this.parameters,
      final String? $type})
      : $type = $type ?? 'on_off',
        super._();

  factory _$DeviceCapabilityOnOffEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityOnOffEntityImplFromJson(json);

  @override
  final bool? reportable;
  @override
  final DeviceCapabilityStateEntity? state;
  @override
  final DeviceCapabilityParametersEntity? parameters;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityEntity.onOff(reportable: $reportable, state: $state, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityOnOffEntityImpl &&
            (identical(other.reportable, reportable) ||
                other.reportable == reportable) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.parameters, parameters) ||
                other.parameters == parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reportable, state, parameters);

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityOnOffEntityImplCopyWith<_$DeviceCapabilityOnOffEntityImpl>
      get copyWith => __$$DeviceCapabilityOnOffEntityImplCopyWithImpl<
          _$DeviceCapabilityOnOffEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityOnOffEntity value) onOff,
    required TResult Function(DeviceCapabilityColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityRangeEntity value) range,
    required TResult Function(_DeviceCapabilityModeEntity value) mode,
    required TResult Function(_DeviceCapabilityFloatEntity value) float,
    required TResult Function(_DeviceCapabilityUnknownEntity value) unknown,
  }) {
    return onOff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult? Function(DeviceCapabilityRangeEntity value)? range,
    TResult? Function(_DeviceCapabilityModeEntity value)? mode,
    TResult? Function(_DeviceCapabilityFloatEntity value)? float,
    TResult? Function(_DeviceCapabilityUnknownEntity value)? unknown,
  }) {
    return onOff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult Function(DeviceCapabilityRangeEntity value)? range,
    TResult Function(_DeviceCapabilityModeEntity value)? mode,
    TResult Function(_DeviceCapabilityFloatEntity value)? float,
    TResult Function(_DeviceCapabilityUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (onOff != null) {
      return onOff(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityOnOffEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityOnOffEntity extends DeviceCapabilityEntity {
  const factory DeviceCapabilityOnOffEntity(
          {final bool? reportable,
          required final DeviceCapabilityStateEntity? state,
          required final DeviceCapabilityParametersEntity? parameters}) =
      _$DeviceCapabilityOnOffEntityImpl;
  const DeviceCapabilityOnOffEntity._() : super._();

  factory DeviceCapabilityOnOffEntity.fromJson(Map<String, dynamic> json) =
      _$DeviceCapabilityOnOffEntityImpl.fromJson;

  @override
  bool? get reportable;
  @override
  DeviceCapabilityStateEntity? get state;
  @override
  DeviceCapabilityParametersEntity? get parameters;

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityOnOffEntityImplCopyWith<_$DeviceCapabilityOnOffEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityColorSettingEntityImplCopyWith<$Res>
    implements $DeviceCapabilityEntityCopyWith<$Res> {
  factory _$$DeviceCapabilityColorSettingEntityImplCopyWith(
          _$DeviceCapabilityColorSettingEntityImpl value,
          $Res Function(_$DeviceCapabilityColorSettingEntityImpl) then) =
      __$$DeviceCapabilityColorSettingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? reportable,
      DeviceCapabilityStateEntity? state,
      DeviceCapabilityParametersEntity? parameters});

  @override
  $DeviceCapabilityStateEntityCopyWith<$Res>? get state;
  @override
  $DeviceCapabilityParametersEntityCopyWith<$Res>? get parameters;
}

/// @nodoc
class __$$DeviceCapabilityColorSettingEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityEntityCopyWithImpl<$Res,
        _$DeviceCapabilityColorSettingEntityImpl>
    implements _$$DeviceCapabilityColorSettingEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityColorSettingEntityImplCopyWithImpl(
      _$DeviceCapabilityColorSettingEntityImpl _value,
      $Res Function(_$DeviceCapabilityColorSettingEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportable = freezed,
    Object? state = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_$DeviceCapabilityColorSettingEntityImpl(
      reportable: freezed == reportable
          ? _value.reportable
          : reportable // ignore: cast_nullable_to_non_nullable
              as bool?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityStateEntity?,
      parameters: freezed == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityParametersEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityColorSettingEntityImpl
    extends DeviceCapabilityColorSettingEntity {
  const _$DeviceCapabilityColorSettingEntityImpl(
      {this.reportable,
      required this.state,
      required this.parameters,
      final String? $type})
      : $type = $type ?? 'color_setting',
        super._();

  factory _$DeviceCapabilityColorSettingEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityColorSettingEntityImplFromJson(json);

  @override
  final bool? reportable;
  @override
  final DeviceCapabilityStateEntity? state;
  @override
  final DeviceCapabilityParametersEntity? parameters;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityEntity.colorSetting(reportable: $reportable, state: $state, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityColorSettingEntityImpl &&
            (identical(other.reportable, reportable) ||
                other.reportable == reportable) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.parameters, parameters) ||
                other.parameters == parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reportable, state, parameters);

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityColorSettingEntityImplCopyWith<
          _$DeviceCapabilityColorSettingEntityImpl>
      get copyWith => __$$DeviceCapabilityColorSettingEntityImplCopyWithImpl<
          _$DeviceCapabilityColorSettingEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityOnOffEntity value) onOff,
    required TResult Function(DeviceCapabilityColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityRangeEntity value) range,
    required TResult Function(_DeviceCapabilityModeEntity value) mode,
    required TResult Function(_DeviceCapabilityFloatEntity value) float,
    required TResult Function(_DeviceCapabilityUnknownEntity value) unknown,
  }) {
    return colorSetting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult? Function(DeviceCapabilityRangeEntity value)? range,
    TResult? Function(_DeviceCapabilityModeEntity value)? mode,
    TResult? Function(_DeviceCapabilityFloatEntity value)? float,
    TResult? Function(_DeviceCapabilityUnknownEntity value)? unknown,
  }) {
    return colorSetting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult Function(DeviceCapabilityRangeEntity value)? range,
    TResult Function(_DeviceCapabilityModeEntity value)? mode,
    TResult Function(_DeviceCapabilityFloatEntity value)? float,
    TResult Function(_DeviceCapabilityUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (colorSetting != null) {
      return colorSetting(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityColorSettingEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityColorSettingEntity
    extends DeviceCapabilityEntity {
  const factory DeviceCapabilityColorSettingEntity(
          {final bool? reportable,
          required final DeviceCapabilityStateEntity? state,
          required final DeviceCapabilityParametersEntity? parameters}) =
      _$DeviceCapabilityColorSettingEntityImpl;
  const DeviceCapabilityColorSettingEntity._() : super._();

  factory DeviceCapabilityColorSettingEntity.fromJson(
          Map<String, dynamic> json) =
      _$DeviceCapabilityColorSettingEntityImpl.fromJson;

  @override
  bool? get reportable;
  @override
  DeviceCapabilityStateEntity? get state;
  @override
  DeviceCapabilityParametersEntity? get parameters;

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityColorSettingEntityImplCopyWith<
          _$DeviceCapabilityColorSettingEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityRangeEntityImplCopyWith<$Res>
    implements $DeviceCapabilityEntityCopyWith<$Res> {
  factory _$$DeviceCapabilityRangeEntityImplCopyWith(
          _$DeviceCapabilityRangeEntityImpl value,
          $Res Function(_$DeviceCapabilityRangeEntityImpl) then) =
      __$$DeviceCapabilityRangeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? reportable,
      DeviceCapabilityStateEntity? state,
      DeviceCapabilityParametersEntity? parameters});

  @override
  $DeviceCapabilityStateEntityCopyWith<$Res>? get state;
  @override
  $DeviceCapabilityParametersEntityCopyWith<$Res>? get parameters;
}

/// @nodoc
class __$$DeviceCapabilityRangeEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityEntityCopyWithImpl<$Res,
        _$DeviceCapabilityRangeEntityImpl>
    implements _$$DeviceCapabilityRangeEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityRangeEntityImplCopyWithImpl(
      _$DeviceCapabilityRangeEntityImpl _value,
      $Res Function(_$DeviceCapabilityRangeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportable = freezed,
    Object? state = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_$DeviceCapabilityRangeEntityImpl(
      reportable: freezed == reportable
          ? _value.reportable
          : reportable // ignore: cast_nullable_to_non_nullable
              as bool?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityStateEntity?,
      parameters: freezed == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityParametersEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityRangeEntityImpl extends DeviceCapabilityRangeEntity {
  const _$DeviceCapabilityRangeEntityImpl(
      {this.reportable,
      required this.state,
      required this.parameters,
      final String? $type})
      : $type = $type ?? 'range',
        super._();

  factory _$DeviceCapabilityRangeEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityRangeEntityImplFromJson(json);

  @override
  final bool? reportable;
  @override
  final DeviceCapabilityStateEntity? state;
  @override
  final DeviceCapabilityParametersEntity? parameters;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityEntity.range(reportable: $reportable, state: $state, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityRangeEntityImpl &&
            (identical(other.reportable, reportable) ||
                other.reportable == reportable) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.parameters, parameters) ||
                other.parameters == parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reportable, state, parameters);

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityRangeEntityImplCopyWith<_$DeviceCapabilityRangeEntityImpl>
      get copyWith => __$$DeviceCapabilityRangeEntityImplCopyWithImpl<
          _$DeviceCapabilityRangeEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityOnOffEntity value) onOff,
    required TResult Function(DeviceCapabilityColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityRangeEntity value) range,
    required TResult Function(_DeviceCapabilityModeEntity value) mode,
    required TResult Function(_DeviceCapabilityFloatEntity value) float,
    required TResult Function(_DeviceCapabilityUnknownEntity value) unknown,
  }) {
    return range(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult? Function(DeviceCapabilityRangeEntity value)? range,
    TResult? Function(_DeviceCapabilityModeEntity value)? mode,
    TResult? Function(_DeviceCapabilityFloatEntity value)? float,
    TResult? Function(_DeviceCapabilityUnknownEntity value)? unknown,
  }) {
    return range?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult Function(DeviceCapabilityRangeEntity value)? range,
    TResult Function(_DeviceCapabilityModeEntity value)? mode,
    TResult Function(_DeviceCapabilityFloatEntity value)? float,
    TResult Function(_DeviceCapabilityUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (range != null) {
      return range(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityRangeEntityImplToJson(
      this,
    );
  }
}

abstract class DeviceCapabilityRangeEntity extends DeviceCapabilityEntity {
  const factory DeviceCapabilityRangeEntity(
          {final bool? reportable,
          required final DeviceCapabilityStateEntity? state,
          required final DeviceCapabilityParametersEntity? parameters}) =
      _$DeviceCapabilityRangeEntityImpl;
  const DeviceCapabilityRangeEntity._() : super._();

  factory DeviceCapabilityRangeEntity.fromJson(Map<String, dynamic> json) =
      _$DeviceCapabilityRangeEntityImpl.fromJson;

  @override
  bool? get reportable;
  @override
  DeviceCapabilityStateEntity? get state;
  @override
  DeviceCapabilityParametersEntity? get parameters;

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityRangeEntityImplCopyWith<_$DeviceCapabilityRangeEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityModeEntityImplCopyWith<$Res>
    implements $DeviceCapabilityEntityCopyWith<$Res> {
  factory _$$DeviceCapabilityModeEntityImplCopyWith(
          _$DeviceCapabilityModeEntityImpl value,
          $Res Function(_$DeviceCapabilityModeEntityImpl) then) =
      __$$DeviceCapabilityModeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? reportable,
      DeviceCapabilityStateEntity? state,
      DeviceCapabilityParametersEntity? parameters});

  @override
  $DeviceCapabilityStateEntityCopyWith<$Res>? get state;
  @override
  $DeviceCapabilityParametersEntityCopyWith<$Res>? get parameters;
}

/// @nodoc
class __$$DeviceCapabilityModeEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityEntityCopyWithImpl<$Res,
        _$DeviceCapabilityModeEntityImpl>
    implements _$$DeviceCapabilityModeEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityModeEntityImplCopyWithImpl(
      _$DeviceCapabilityModeEntityImpl _value,
      $Res Function(_$DeviceCapabilityModeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportable = freezed,
    Object? state = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_$DeviceCapabilityModeEntityImpl(
      reportable: freezed == reportable
          ? _value.reportable
          : reportable // ignore: cast_nullable_to_non_nullable
              as bool?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityStateEntity?,
      parameters: freezed == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityParametersEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityModeEntityImpl extends _DeviceCapabilityModeEntity {
  const _$DeviceCapabilityModeEntityImpl(
      {this.reportable,
      required this.state,
      required this.parameters,
      final String? $type})
      : $type = $type ?? 'mode',
        super._();

  factory _$DeviceCapabilityModeEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityModeEntityImplFromJson(json);

  @override
  final bool? reportable;
  @override
  final DeviceCapabilityStateEntity? state;
  @override
  final DeviceCapabilityParametersEntity? parameters;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityEntity.mode(reportable: $reportable, state: $state, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityModeEntityImpl &&
            (identical(other.reportable, reportable) ||
                other.reportable == reportable) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.parameters, parameters) ||
                other.parameters == parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reportable, state, parameters);

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityModeEntityImplCopyWith<_$DeviceCapabilityModeEntityImpl>
      get copyWith => __$$DeviceCapabilityModeEntityImplCopyWithImpl<
          _$DeviceCapabilityModeEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityOnOffEntity value) onOff,
    required TResult Function(DeviceCapabilityColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityRangeEntity value) range,
    required TResult Function(_DeviceCapabilityModeEntity value) mode,
    required TResult Function(_DeviceCapabilityFloatEntity value) float,
    required TResult Function(_DeviceCapabilityUnknownEntity value) unknown,
  }) {
    return mode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult? Function(DeviceCapabilityRangeEntity value)? range,
    TResult? Function(_DeviceCapabilityModeEntity value)? mode,
    TResult? Function(_DeviceCapabilityFloatEntity value)? float,
    TResult? Function(_DeviceCapabilityUnknownEntity value)? unknown,
  }) {
    return mode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult Function(DeviceCapabilityRangeEntity value)? range,
    TResult Function(_DeviceCapabilityModeEntity value)? mode,
    TResult Function(_DeviceCapabilityFloatEntity value)? float,
    TResult Function(_DeviceCapabilityUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (mode != null) {
      return mode(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityModeEntityImplToJson(
      this,
    );
  }
}

abstract class _DeviceCapabilityModeEntity extends DeviceCapabilityEntity {
  const factory _DeviceCapabilityModeEntity(
          {final bool? reportable,
          required final DeviceCapabilityStateEntity? state,
          required final DeviceCapabilityParametersEntity? parameters}) =
      _$DeviceCapabilityModeEntityImpl;
  const _DeviceCapabilityModeEntity._() : super._();

  factory _DeviceCapabilityModeEntity.fromJson(Map<String, dynamic> json) =
      _$DeviceCapabilityModeEntityImpl.fromJson;

  @override
  bool? get reportable;
  @override
  DeviceCapabilityStateEntity? get state;
  @override
  DeviceCapabilityParametersEntity? get parameters;

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityModeEntityImplCopyWith<_$DeviceCapabilityModeEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityFloatEntityImplCopyWith<$Res>
    implements $DeviceCapabilityEntityCopyWith<$Res> {
  factory _$$DeviceCapabilityFloatEntityImplCopyWith(
          _$DeviceCapabilityFloatEntityImpl value,
          $Res Function(_$DeviceCapabilityFloatEntityImpl) then) =
      __$$DeviceCapabilityFloatEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? reportable,
      DeviceCapabilityStateEntity? state,
      DeviceCapabilityParametersEntity? parameters});

  @override
  $DeviceCapabilityStateEntityCopyWith<$Res>? get state;
  @override
  $DeviceCapabilityParametersEntityCopyWith<$Res>? get parameters;
}

/// @nodoc
class __$$DeviceCapabilityFloatEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityEntityCopyWithImpl<$Res,
        _$DeviceCapabilityFloatEntityImpl>
    implements _$$DeviceCapabilityFloatEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityFloatEntityImplCopyWithImpl(
      _$DeviceCapabilityFloatEntityImpl _value,
      $Res Function(_$DeviceCapabilityFloatEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportable = freezed,
    Object? state = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_$DeviceCapabilityFloatEntityImpl(
      reportable: freezed == reportable
          ? _value.reportable
          : reportable // ignore: cast_nullable_to_non_nullable
              as bool?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityStateEntity?,
      parameters: freezed == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityParametersEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityFloatEntityImpl extends _DeviceCapabilityFloatEntity {
  const _$DeviceCapabilityFloatEntityImpl(
      {this.reportable,
      required this.state,
      required this.parameters,
      final String? $type})
      : $type = $type ?? 'float',
        super._();

  factory _$DeviceCapabilityFloatEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityFloatEntityImplFromJson(json);

  @override
  final bool? reportable;
  @override
  final DeviceCapabilityStateEntity? state;
  @override
  final DeviceCapabilityParametersEntity? parameters;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityEntity.float(reportable: $reportable, state: $state, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityFloatEntityImpl &&
            (identical(other.reportable, reportable) ||
                other.reportable == reportable) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.parameters, parameters) ||
                other.parameters == parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reportable, state, parameters);

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityFloatEntityImplCopyWith<_$DeviceCapabilityFloatEntityImpl>
      get copyWith => __$$DeviceCapabilityFloatEntityImplCopyWithImpl<
          _$DeviceCapabilityFloatEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityOnOffEntity value) onOff,
    required TResult Function(DeviceCapabilityColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityRangeEntity value) range,
    required TResult Function(_DeviceCapabilityModeEntity value) mode,
    required TResult Function(_DeviceCapabilityFloatEntity value) float,
    required TResult Function(_DeviceCapabilityUnknownEntity value) unknown,
  }) {
    return float(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult? Function(DeviceCapabilityRangeEntity value)? range,
    TResult? Function(_DeviceCapabilityModeEntity value)? mode,
    TResult? Function(_DeviceCapabilityFloatEntity value)? float,
    TResult? Function(_DeviceCapabilityUnknownEntity value)? unknown,
  }) {
    return float?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult Function(DeviceCapabilityRangeEntity value)? range,
    TResult Function(_DeviceCapabilityModeEntity value)? mode,
    TResult Function(_DeviceCapabilityFloatEntity value)? float,
    TResult Function(_DeviceCapabilityUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (float != null) {
      return float(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityFloatEntityImplToJson(
      this,
    );
  }
}

abstract class _DeviceCapabilityFloatEntity extends DeviceCapabilityEntity {
  const factory _DeviceCapabilityFloatEntity(
          {final bool? reportable,
          required final DeviceCapabilityStateEntity? state,
          required final DeviceCapabilityParametersEntity? parameters}) =
      _$DeviceCapabilityFloatEntityImpl;
  const _DeviceCapabilityFloatEntity._() : super._();

  factory _DeviceCapabilityFloatEntity.fromJson(Map<String, dynamic> json) =
      _$DeviceCapabilityFloatEntityImpl.fromJson;

  @override
  bool? get reportable;
  @override
  DeviceCapabilityStateEntity? get state;
  @override
  DeviceCapabilityParametersEntity? get parameters;

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityFloatEntityImplCopyWith<_$DeviceCapabilityFloatEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceCapabilityUnknownEntityImplCopyWith<$Res>
    implements $DeviceCapabilityEntityCopyWith<$Res> {
  factory _$$DeviceCapabilityUnknownEntityImplCopyWith(
          _$DeviceCapabilityUnknownEntityImpl value,
          $Res Function(_$DeviceCapabilityUnknownEntityImpl) then) =
      __$$DeviceCapabilityUnknownEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? reportable,
      DeviceCapabilityStateEntity? state,
      DeviceCapabilityParametersEntity? parameters});

  @override
  $DeviceCapabilityStateEntityCopyWith<$Res>? get state;
  @override
  $DeviceCapabilityParametersEntityCopyWith<$Res>? get parameters;
}

/// @nodoc
class __$$DeviceCapabilityUnknownEntityImplCopyWithImpl<$Res>
    extends _$DeviceCapabilityEntityCopyWithImpl<$Res,
        _$DeviceCapabilityUnknownEntityImpl>
    implements _$$DeviceCapabilityUnknownEntityImplCopyWith<$Res> {
  __$$DeviceCapabilityUnknownEntityImplCopyWithImpl(
      _$DeviceCapabilityUnknownEntityImpl _value,
      $Res Function(_$DeviceCapabilityUnknownEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportable = freezed,
    Object? state = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_$DeviceCapabilityUnknownEntityImpl(
      reportable: freezed == reportable
          ? _value.reportable
          : reportable // ignore: cast_nullable_to_non_nullable
              as bool?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityStateEntity?,
      parameters: freezed == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as DeviceCapabilityParametersEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCapabilityUnknownEntityImpl
    extends _DeviceCapabilityUnknownEntity {
  const _$DeviceCapabilityUnknownEntityImpl(
      {this.reportable,
      required this.state,
      required this.parameters,
      final String? $type})
      : $type = $type ?? 'unknown',
        super._();

  factory _$DeviceCapabilityUnknownEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceCapabilityUnknownEntityImplFromJson(json);

  @override
  final bool? reportable;
  @override
  final DeviceCapabilityStateEntity? state;
  @override
  final DeviceCapabilityParametersEntity? parameters;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'DeviceCapabilityEntity.unknown(reportable: $reportable, state: $state, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceCapabilityUnknownEntityImpl &&
            (identical(other.reportable, reportable) ||
                other.reportable == reportable) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.parameters, parameters) ||
                other.parameters == parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reportable, state, parameters);

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCapabilityUnknownEntityImplCopyWith<
          _$DeviceCapabilityUnknownEntityImpl>
      get copyWith => __$$DeviceCapabilityUnknownEntityImplCopyWithImpl<
          _$DeviceCapabilityUnknownEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DeviceCapabilityOnOffEntity value) onOff,
    required TResult Function(DeviceCapabilityColorSettingEntity value)
        colorSetting,
    required TResult Function(DeviceCapabilityRangeEntity value) range,
    required TResult Function(_DeviceCapabilityModeEntity value) mode,
    required TResult Function(_DeviceCapabilityFloatEntity value) float,
    required TResult Function(_DeviceCapabilityUnknownEntity value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult? Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult? Function(DeviceCapabilityRangeEntity value)? range,
    TResult? Function(_DeviceCapabilityModeEntity value)? mode,
    TResult? Function(_DeviceCapabilityFloatEntity value)? float,
    TResult? Function(_DeviceCapabilityUnknownEntity value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DeviceCapabilityOnOffEntity value)? onOff,
    TResult Function(DeviceCapabilityColorSettingEntity value)? colorSetting,
    TResult Function(DeviceCapabilityRangeEntity value)? range,
    TResult Function(_DeviceCapabilityModeEntity value)? mode,
    TResult Function(_DeviceCapabilityFloatEntity value)? float,
    TResult Function(_DeviceCapabilityUnknownEntity value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCapabilityUnknownEntityImplToJson(
      this,
    );
  }
}

abstract class _DeviceCapabilityUnknownEntity extends DeviceCapabilityEntity {
  const factory _DeviceCapabilityUnknownEntity(
          {final bool? reportable,
          required final DeviceCapabilityStateEntity? state,
          required final DeviceCapabilityParametersEntity? parameters}) =
      _$DeviceCapabilityUnknownEntityImpl;
  const _DeviceCapabilityUnknownEntity._() : super._();

  factory _DeviceCapabilityUnknownEntity.fromJson(Map<String, dynamic> json) =
      _$DeviceCapabilityUnknownEntityImpl.fromJson;

  @override
  bool? get reportable;
  @override
  DeviceCapabilityStateEntity? get state;
  @override
  DeviceCapabilityParametersEntity? get parameters;

  /// Create a copy of DeviceCapabilityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCapabilityUnknownEntityImplCopyWith<
          _$DeviceCapabilityUnknownEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
