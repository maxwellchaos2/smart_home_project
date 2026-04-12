// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zigbee_device_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ZigbeeDeviceEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<DeviceCapabilityEntity> get capabilities =>
      throw _privateConstructorUsedError;
  List<DevicePropertyEntity> get properties =>
      throw _privateConstructorUsedError;
  bool get interviewCompleted => throw _privateConstructorUsedError;

  /// Create a copy of ZigbeeDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ZigbeeDeviceEntityCopyWith<ZigbeeDeviceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZigbeeDeviceEntityCopyWith<$Res> {
  factory $ZigbeeDeviceEntityCopyWith(
          ZigbeeDeviceEntity value, $Res Function(ZigbeeDeviceEntity) then) =
      _$ZigbeeDeviceEntityCopyWithImpl<$Res, ZigbeeDeviceEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      List<DeviceCapabilityEntity> capabilities,
      List<DevicePropertyEntity> properties,
      bool interviewCompleted});
}

/// @nodoc
class _$ZigbeeDeviceEntityCopyWithImpl<$Res, $Val extends ZigbeeDeviceEntity>
    implements $ZigbeeDeviceEntityCopyWith<$Res> {
  _$ZigbeeDeviceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? interviewCompleted = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      capabilities: null == capabilities
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<DeviceCapabilityEntity>,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<DevicePropertyEntity>,
      interviewCompleted: null == interviewCompleted
          ? _value.interviewCompleted
          : interviewCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ZigbeeDeviceEntityImplCopyWith<$Res>
    implements $ZigbeeDeviceEntityCopyWith<$Res> {
  factory _$$ZigbeeDeviceEntityImplCopyWith(_$ZigbeeDeviceEntityImpl value,
          $Res Function(_$ZigbeeDeviceEntityImpl) then) =
      __$$ZigbeeDeviceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      List<DeviceCapabilityEntity> capabilities,
      List<DevicePropertyEntity> properties,
      bool interviewCompleted});
}

/// @nodoc
class __$$ZigbeeDeviceEntityImplCopyWithImpl<$Res>
    extends _$ZigbeeDeviceEntityCopyWithImpl<$Res, _$ZigbeeDeviceEntityImpl>
    implements _$$ZigbeeDeviceEntityImplCopyWith<$Res> {
  __$$ZigbeeDeviceEntityImplCopyWithImpl(_$ZigbeeDeviceEntityImpl _value,
      $Res Function(_$ZigbeeDeviceEntityImpl) _then)
      : super(_value, _then);

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
    Object? interviewCompleted = null,
  }) {
    return _then(_$ZigbeeDeviceEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      capabilities: null == capabilities
          ? _value._capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<DeviceCapabilityEntity>,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<DevicePropertyEntity>,
      interviewCompleted: null == interviewCompleted
          ? _value.interviewCompleted
          : interviewCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ZigbeeDeviceEntityImpl extends _ZigbeeDeviceEntity {
  const _$ZigbeeDeviceEntityImpl(
      {required this.id,
      required this.name,
      required this.type,
      required final List<DeviceCapabilityEntity> capabilities,
      required final List<DevicePropertyEntity> properties,
      required this.interviewCompleted})
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

  @override
  final bool interviewCompleted;

  @override
  String toString() {
    return 'ZigbeeDeviceEntity(id: $id, name: $name, type: $type, capabilities: $capabilities, properties: $properties, interviewCompleted: $interviewCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZigbeeDeviceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            (identical(other.interviewCompleted, interviewCompleted) ||
                other.interviewCompleted == interviewCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      const DeepCollectionEquality().hash(_capabilities),
      const DeepCollectionEquality().hash(_properties),
      interviewCompleted);

  /// Create a copy of ZigbeeDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ZigbeeDeviceEntityImplCopyWith<_$ZigbeeDeviceEntityImpl> get copyWith =>
      __$$ZigbeeDeviceEntityImplCopyWithImpl<_$ZigbeeDeviceEntityImpl>(
          this, _$identity);
}

abstract class _ZigbeeDeviceEntity extends ZigbeeDeviceEntity {
  const factory _ZigbeeDeviceEntity(
      {required final String id,
      required final String name,
      required final String type,
      required final List<DeviceCapabilityEntity> capabilities,
      required final List<DevicePropertyEntity> properties,
      required final bool interviewCompleted}) = _$ZigbeeDeviceEntityImpl;
  const _ZigbeeDeviceEntity._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  @override
  List<DeviceCapabilityEntity> get capabilities;
  @override
  List<DevicePropertyEntity> get properties;
  @override
  bool get interviewCompleted;

  /// Create a copy of ZigbeeDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ZigbeeDeviceEntityImplCopyWith<_$ZigbeeDeviceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
