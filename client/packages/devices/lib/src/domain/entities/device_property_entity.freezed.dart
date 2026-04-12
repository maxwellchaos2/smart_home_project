// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_property_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DevicePropertyEntity _$DevicePropertyEntityFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'float':
      return DevicePropertyFloatEntity.fromJson(json);
    case 'event':
      return DevicePropertyEventEntity.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'DevicePropertyEntity',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$DevicePropertyEntity {
  Object? get state => throw _privateConstructorUsedError;
  Object? get parameters => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DevicePropertyFloatEntity value) float,
    required TResult Function(DevicePropertyEventEntity value) event,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DevicePropertyFloatEntity value)? float,
    TResult? Function(DevicePropertyEventEntity value)? event,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DevicePropertyFloatEntity value)? float,
    TResult Function(DevicePropertyEventEntity value)? event,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this DevicePropertyEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevicePropertyEntityCopyWith<$Res> {
  factory $DevicePropertyEntityCopyWith(DevicePropertyEntity value,
          $Res Function(DevicePropertyEntity) then) =
      _$DevicePropertyEntityCopyWithImpl<$Res, DevicePropertyEntity>;
}

/// @nodoc
class _$DevicePropertyEntityCopyWithImpl<$Res,
        $Val extends DevicePropertyEntity>
    implements $DevicePropertyEntityCopyWith<$Res> {
  _$DevicePropertyEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DevicePropertyEntity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DevicePropertyFloatEntityImplCopyWith<$Res> {
  factory _$$DevicePropertyFloatEntityImplCopyWith(
          _$DevicePropertyFloatEntityImpl value,
          $Res Function(_$DevicePropertyFloatEntityImpl) then) =
      __$$DevicePropertyFloatEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DeviceCapabilityStateEntity? state,
      DeviceCapabilityParametersEntity? parameters});

  $DeviceCapabilityStateEntityCopyWith<$Res>? get state;
  $DeviceCapabilityParametersEntityCopyWith<$Res>? get parameters;
}

/// @nodoc
class __$$DevicePropertyFloatEntityImplCopyWithImpl<$Res>
    extends _$DevicePropertyEntityCopyWithImpl<$Res,
        _$DevicePropertyFloatEntityImpl>
    implements _$$DevicePropertyFloatEntityImplCopyWith<$Res> {
  __$$DevicePropertyFloatEntityImplCopyWithImpl(
      _$DevicePropertyFloatEntityImpl _value,
      $Res Function(_$DevicePropertyFloatEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DevicePropertyEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_$DevicePropertyFloatEntityImpl(
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

  /// Create a copy of DevicePropertyEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCapabilityStateEntityCopyWith<$Res>? get state {
    if (_value.state == null) {
      return null;
    }

    return $DeviceCapabilityStateEntityCopyWith<$Res>(_value.state!, (value) {
      return _then(_value.copyWith(state: value));
    });
  }

  /// Create a copy of DevicePropertyEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeviceCapabilityParametersEntityCopyWith<$Res>? get parameters {
    if (_value.parameters == null) {
      return null;
    }

    return $DeviceCapabilityParametersEntityCopyWith<$Res>(_value.parameters!,
        (value) {
      return _then(_value.copyWith(parameters: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$DevicePropertyFloatEntityImpl extends DevicePropertyFloatEntity {
  const _$DevicePropertyFloatEntityImpl(
      {required this.state, required this.parameters, final String? $type})
      : $type = $type ?? 'float',
        super._();

  factory _$DevicePropertyFloatEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DevicePropertyFloatEntityImplFromJson(json);

  @override
  final DeviceCapabilityStateEntity? state;
  @override
  final DeviceCapabilityParametersEntity? parameters;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'DevicePropertyEntity.float(state: $state, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevicePropertyFloatEntityImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.parameters, parameters) ||
                other.parameters == parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state, parameters);

  /// Create a copy of DevicePropertyEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DevicePropertyFloatEntityImplCopyWith<_$DevicePropertyFloatEntityImpl>
      get copyWith => __$$DevicePropertyFloatEntityImplCopyWithImpl<
          _$DevicePropertyFloatEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DevicePropertyFloatEntity value) float,
    required TResult Function(DevicePropertyEventEntity value) event,
  }) {
    return float(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DevicePropertyFloatEntity value)? float,
    TResult? Function(DevicePropertyEventEntity value)? event,
  }) {
    return float?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DevicePropertyFloatEntity value)? float,
    TResult Function(DevicePropertyEventEntity value)? event,
    required TResult orElse(),
  }) {
    if (float != null) {
      return float(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DevicePropertyFloatEntityImplToJson(
      this,
    );
  }
}

abstract class DevicePropertyFloatEntity extends DevicePropertyEntity {
  const factory DevicePropertyFloatEntity(
          {required final DeviceCapabilityStateEntity? state,
          required final DeviceCapabilityParametersEntity? parameters}) =
      _$DevicePropertyFloatEntityImpl;
  const DevicePropertyFloatEntity._() : super._();

  factory DevicePropertyFloatEntity.fromJson(Map<String, dynamic> json) =
      _$DevicePropertyFloatEntityImpl.fromJson;

  @override
  DeviceCapabilityStateEntity? get state;
  @override
  DeviceCapabilityParametersEntity? get parameters;

  /// Create a copy of DevicePropertyEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DevicePropertyFloatEntityImplCopyWith<_$DevicePropertyFloatEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DevicePropertyEventEntityImplCopyWith<$Res> {
  factory _$$DevicePropertyEventEntityImplCopyWith(
          _$DevicePropertyEventEntityImpl value,
          $Res Function(_$DevicePropertyEventEntityImpl) then) =
      __$$DevicePropertyEventEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic>? state, Map<String, dynamic>? parameters});
}

/// @nodoc
class __$$DevicePropertyEventEntityImplCopyWithImpl<$Res>
    extends _$DevicePropertyEntityCopyWithImpl<$Res,
        _$DevicePropertyEventEntityImpl>
    implements _$$DevicePropertyEventEntityImplCopyWith<$Res> {
  __$$DevicePropertyEventEntityImplCopyWithImpl(
      _$DevicePropertyEventEntityImpl _value,
      $Res Function(_$DevicePropertyEventEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DevicePropertyEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_$DevicePropertyEventEntityImpl(
      state: freezed == state
          ? _value._state
          : state // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      parameters: freezed == parameters
          ? _value._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DevicePropertyEventEntityImpl extends DevicePropertyEventEntity {
  const _$DevicePropertyEventEntityImpl(
      {required final Map<String, dynamic>? state,
      required final Map<String, dynamic>? parameters,
      final String? $type})
      : _state = state,
        _parameters = parameters,
        $type = $type ?? 'event',
        super._();

  factory _$DevicePropertyEventEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DevicePropertyEventEntityImplFromJson(json);

  final Map<String, dynamic>? _state;
  @override
  Map<String, dynamic>? get state {
    final value = _state;
    if (value == null) return null;
    if (_state is EqualUnmodifiableMapView) return _state;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _parameters;
  @override
  Map<String, dynamic>? get parameters {
    final value = _parameters;
    if (value == null) return null;
    if (_parameters is EqualUnmodifiableMapView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'DevicePropertyEntity.event(state: $state, parameters: $parameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevicePropertyEventEntityImpl &&
            const DeepCollectionEquality().equals(other._state, _state) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_state),
      const DeepCollectionEquality().hash(_parameters));

  /// Create a copy of DevicePropertyEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DevicePropertyEventEntityImplCopyWith<_$DevicePropertyEventEntityImpl>
      get copyWith => __$$DevicePropertyEventEntityImplCopyWithImpl<
          _$DevicePropertyEventEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DevicePropertyFloatEntity value) float,
    required TResult Function(DevicePropertyEventEntity value) event,
  }) {
    return event(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DevicePropertyFloatEntity value)? float,
    TResult? Function(DevicePropertyEventEntity value)? event,
  }) {
    return event?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DevicePropertyFloatEntity value)? float,
    TResult Function(DevicePropertyEventEntity value)? event,
    required TResult orElse(),
  }) {
    if (event != null) {
      return event(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DevicePropertyEventEntityImplToJson(
      this,
    );
  }
}

abstract class DevicePropertyEventEntity extends DevicePropertyEntity {
  const factory DevicePropertyEventEntity(
          {required final Map<String, dynamic>? state,
          required final Map<String, dynamic>? parameters}) =
      _$DevicePropertyEventEntityImpl;
  const DevicePropertyEventEntity._() : super._();

  factory DevicePropertyEventEntity.fromJson(Map<String, dynamic> json) =
      _$DevicePropertyEventEntityImpl.fromJson;

  @override
  Map<String, dynamic>? get state;
  @override
  Map<String, dynamic>? get parameters;

  /// Create a copy of DevicePropertyEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DevicePropertyEventEntityImplCopyWith<_$DevicePropertyEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
