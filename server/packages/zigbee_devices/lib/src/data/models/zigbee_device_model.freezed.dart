// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zigbee_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ZigbeeDeviceModel {
  String get id;
  String get name;
  String get type;
  List<Map<String, dynamic>> get capabilities;
  List<Map<String, dynamic>> get properties;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ZigbeeDeviceModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.capabilities, capabilities) &&
            const DeepCollectionEquality()
                .equals(other.properties, properties));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'ZigbeeDeviceModel(id: $id, name: $name, type: $type, capabilities: $capabilities, properties: $properties)';
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _ZigbeeDeviceModel extends ZigbeeDeviceModel {
  const _ZigbeeDeviceModel(
      {required this.id,
      required this.name,
      required this.type,
      required final List<Map<String, dynamic>> capabilities,
      required final List<Map<String, dynamic>> properties})
      : _capabilities = capabilities,
        _properties = properties,
        super._();
  factory _ZigbeeDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$ZigbeeDeviceModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  final List<Map<String, dynamic>> _capabilities;
  @override
  List<Map<String, dynamic>> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  final List<Map<String, dynamic>> _properties;
  @override
  List<Map<String, dynamic>> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ZigbeeDeviceModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    return 'ZigbeeDeviceModel(id: $id, name: $name, type: $type, capabilities: $capabilities, properties: $properties)';
  }
}

// dart format on
