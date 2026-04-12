// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zigbee_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ZigbeeDeviceModel _$ZigbeeDeviceModelFromJson(Map<String, dynamic> json) {
  return _ZigbeeDeviceModel.fromJson(json);
}

/// @nodoc
mixin _$ZigbeeDeviceModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get capabilities =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get properties =>
      throw _privateConstructorUsedError;
  bool get interviewCompleted => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ZigbeeDeviceModelImpl extends _ZigbeeDeviceModel {
  const _$ZigbeeDeviceModelImpl(
      {required this.id,
      required this.name,
      required this.type,
      required final List<Map<String, dynamic>> capabilities,
      required final List<Map<String, dynamic>> properties,
      required this.interviewCompleted})
      : _capabilities = capabilities,
        _properties = properties,
        super._();

  factory _$ZigbeeDeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZigbeeDeviceModelImplFromJson(json);

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
  final bool interviewCompleted;

  @override
  String toString() {
    return 'ZigbeeDeviceModel(id: $id, name: $name, type: $type, capabilities: $capabilities, properties: $properties, interviewCompleted: $interviewCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZigbeeDeviceModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      const DeepCollectionEquality().hash(_capabilities),
      const DeepCollectionEquality().hash(_properties),
      interviewCompleted);
}

abstract class _ZigbeeDeviceModel extends ZigbeeDeviceModel {
  const factory _ZigbeeDeviceModel(
      {required final String id,
      required final String name,
      required final String type,
      required final List<Map<String, dynamic>> capabilities,
      required final List<Map<String, dynamic>> properties,
      required final bool interviewCompleted}) = _$ZigbeeDeviceModelImpl;
  const _ZigbeeDeviceModel._() : super._();

  factory _ZigbeeDeviceModel.fromJson(Map<String, dynamic> json) =
      _$ZigbeeDeviceModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  @override
  List<Map<String, dynamic>> get capabilities;
  @override
  List<Map<String, dynamic>> get properties;
  @override
  bool get interviewCompleted;
}
