// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zigbee_device_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ZigbeeDeviceEntity {
  String get id;
  String get name;
  String get type;
  List<DeviceCapabilityEntity> get capabilities;
  List<DevicePropertyEntity> get properties;

  /// Create a copy of ZigbeeDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ZigbeeDeviceEntityCopyWith<ZigbeeDeviceEntity> get copyWith =>
      _$ZigbeeDeviceEntityCopyWithImpl<ZigbeeDeviceEntity>(
          this as ZigbeeDeviceEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZigbeeDeviceEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.capabilities, capabilities) &&
            const DeepCollectionEquality()
                .equals(other.properties, properties));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      const DeepCollectionEquality().hash(capabilities),
      const DeepCollectionEquality().hash(properties));

  @override
  String toString() {
    return 'ZigbeeDeviceEntity(id: $id, name: $name, type: $type, capabilities: $capabilities, properties: $properties)';
  }
}

/// @nodoc
abstract mixin class $ZigbeeDeviceEntityCopyWith<$Res> {
  factory $ZigbeeDeviceEntityCopyWith(
          ZigbeeDeviceEntity value, $Res Function(ZigbeeDeviceEntity) _then) =
      _$ZigbeeDeviceEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      List<DeviceCapabilityEntity> capabilities,
      List<DevicePropertyEntity> properties});
}

/// @nodoc
class _$ZigbeeDeviceEntityCopyWithImpl<$Res>
    implements $ZigbeeDeviceEntityCopyWith<$Res> {
  _$ZigbeeDeviceEntityCopyWithImpl(this._self, this._then);

  final ZigbeeDeviceEntity _self;
  final $Res Function(ZigbeeDeviceEntity) _then;

  /// Create a copy of ZigbeeDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? capabilities = null,
    Object? properties = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      capabilities: null == capabilities
          ? _self.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<DeviceCapabilityEntity>,
      properties: null == properties
          ? _self.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<DevicePropertyEntity>,
    ));
  }
}

/// @nodoc

class _ZigbeeDeviceEntity extends ZigbeeDeviceEntity {
  const _ZigbeeDeviceEntity(
      {required this.id,
      required this.name,
      required this.type,
      required final List<DeviceCapabilityEntity> capabilities,
      required final List<DevicePropertyEntity> properties})
      : _capabilities = capabilities,
        _properties = properties,
        super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  final List<DeviceCapabilityEntity> _capabilities;
  @override
  List<DeviceCapabilityEntity> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  final List<DevicePropertyEntity> _properties;
  @override
  List<DevicePropertyEntity> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  /// Create a copy of ZigbeeDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ZigbeeDeviceEntityCopyWith<_ZigbeeDeviceEntity> get copyWith =>
      __$ZigbeeDeviceEntityCopyWithImpl<_ZigbeeDeviceEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ZigbeeDeviceEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      const DeepCollectionEquality().hash(_capabilities),
      const DeepCollectionEquality().hash(_properties));

  @override
  String toString() {
    return 'ZigbeeDeviceEntity(id: $id, name: $name, type: $type, capabilities: $capabilities, properties: $properties)';
  }
}

/// @nodoc
abstract mixin class _$ZigbeeDeviceEntityCopyWith<$Res>
    implements $ZigbeeDeviceEntityCopyWith<$Res> {
  factory _$ZigbeeDeviceEntityCopyWith(
          _ZigbeeDeviceEntity value, $Res Function(_ZigbeeDeviceEntity) _then) =
      __$ZigbeeDeviceEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      List<DeviceCapabilityEntity> capabilities,
      List<DevicePropertyEntity> properties});
}

/// @nodoc
class __$ZigbeeDeviceEntityCopyWithImpl<$Res>
    implements _$ZigbeeDeviceEntityCopyWith<$Res> {
  __$ZigbeeDeviceEntityCopyWithImpl(this._self, this._then);

  final _ZigbeeDeviceEntity _self;
  final $Res Function(_ZigbeeDeviceEntity) _then;

  /// Create a copy of ZigbeeDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? capabilities = null,
    Object? properties = null,
  }) {
    return _then(_ZigbeeDeviceEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      capabilities: null == capabilities
          ? _self._capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<DeviceCapabilityEntity>,
      properties: null == properties
          ? _self._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<DevicePropertyEntity>,
    ));
  }
}

// dart format on
