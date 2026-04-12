// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceInputEntity {
  String? get providerDeviceId => throw _privateConstructorUsedError;
  DeviceProviderType get providerType => throw _privateConstructorUsedError;
  DeviceType get type => throw _privateConstructorUsedError;
  int? get inputId => throw _privateConstructorUsedError;
  int? get outputId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<DeviceCapabilityEntity> get capabilities =>
      throw _privateConstructorUsedError;
  List<DevicePropertyEntity> get properties =>
      throw _privateConstructorUsedError;
  int? get roomId => throw _privateConstructorUsedError;
  int? get floorId => throw _privateConstructorUsedError;
}

/// @nodoc

class _$DeviceInputEntityImpl implements _DeviceInputEntity {
  const _$DeviceInputEntityImpl(
      {required this.providerDeviceId,
      required this.providerType,
      required this.type,
      required this.inputId,
      required this.outputId,
      required this.name,
      required final List<DeviceCapabilityEntity> capabilities,
      required final List<DevicePropertyEntity> properties,
      required this.roomId,
      required this.floorId})
      : _capabilities = capabilities,
        _properties = properties;

  @override
  final String? providerDeviceId;
  @override
  final DeviceProviderType providerType;
  @override
  final DeviceType type;
  @override
  final int? inputId;
  @override
  final int? outputId;
  @override
  final String name;
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
  final int? roomId;
  @override
  final int? floorId;

  @override
  String toString() {
    return 'DeviceInputEntity(providerDeviceId: $providerDeviceId, providerType: $providerType, type: $type, inputId: $inputId, outputId: $outputId, name: $name, capabilities: $capabilities, properties: $properties, roomId: $roomId, floorId: $floorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceInputEntityImpl &&
            (identical(other.providerDeviceId, providerDeviceId) ||
                other.providerDeviceId == providerDeviceId) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.inputId, inputId) || other.inputId == inputId) &&
            (identical(other.outputId, outputId) ||
                other.outputId == outputId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.floorId, floorId) || other.floorId == floorId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      providerDeviceId,
      providerType,
      type,
      inputId,
      outputId,
      name,
      const DeepCollectionEquality().hash(_capabilities),
      const DeepCollectionEquality().hash(_properties),
      roomId,
      floorId);
}

abstract class _DeviceInputEntity implements DeviceInputEntity {
  const factory _DeviceInputEntity(
      {required final String? providerDeviceId,
      required final DeviceProviderType providerType,
      required final DeviceType type,
      required final int? inputId,
      required final int? outputId,
      required final String name,
      required final List<DeviceCapabilityEntity> capabilities,
      required final List<DevicePropertyEntity> properties,
      required final int? roomId,
      required final int? floorId}) = _$DeviceInputEntityImpl;

  @override
  String? get providerDeviceId;
  @override
  DeviceProviderType get providerType;
  @override
  DeviceType get type;
  @override
  int? get inputId;
  @override
  int? get outputId;
  @override
  String get name;
  @override
  List<DeviceCapabilityEntity> get capabilities;
  @override
  List<DevicePropertyEntity> get properties;
  @override
  int? get roomId;
  @override
  int? get floorId;
}
