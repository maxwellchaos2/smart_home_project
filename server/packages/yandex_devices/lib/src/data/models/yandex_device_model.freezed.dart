// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yandex_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YandexDeviceModel {
  String get id;
  String get name;
  String get type;
  String? get skillId;
  List<Map<String, dynamic>> get capabilities;
  List<Map<String, dynamic>> get properties;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YandexDeviceModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.skillId, skillId) || other.skillId == skillId) &&
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
      skillId,
      const DeepCollectionEquality().hash(capabilities),
      const DeepCollectionEquality().hash(properties));

  @override
  String toString() {
    return 'YandexDeviceModel(id: $id, name: $name, type: $type, skillId: $skillId, capabilities: $capabilities, properties: $properties)';
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _YandexDeviceModel extends YandexDeviceModel {
  const _YandexDeviceModel(
      {required this.id,
      required this.name,
      required this.type,
      required this.skillId,
      required final List<Map<String, dynamic>> capabilities,
      required final List<Map<String, dynamic>> properties})
      : _capabilities = capabilities,
        _properties = properties,
        super._();
  factory _YandexDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$YandexDeviceModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String? skillId;
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
            other is _YandexDeviceModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.skillId, skillId) || other.skillId == skillId) &&
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
      skillId,
      const DeepCollectionEquality().hash(_capabilities),
      const DeepCollectionEquality().hash(_properties));

  @override
  String toString() {
    return 'YandexDeviceModel(id: $id, name: $name, type: $type, skillId: $skillId, capabilities: $capabilities, properties: $properties)';
  }
}

// dart format on
