// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceResponseModel _$DeviceResponseModelFromJson(Map<String, dynamic> json) {
  return _DeviceResponseModel.fromJson(json);
}

/// @nodoc
mixin _$DeviceResponseModel {
  int get id => throw _privateConstructorUsedError;
  String get providerType => throw _privateConstructorUsedError;
  String? get providerDeviceId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int? get inputId => throw _privateConstructorUsedError;
  int? get outputId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get capabilities =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get properties =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int? get roomId => throw _privateConstructorUsedError;
  int? get floorId => throw _privateConstructorUsedError;
  int get projectId => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$DeviceResponseModelImpl extends _DeviceResponseModel {
  const _$DeviceResponseModelImpl(
      {required this.id,
      required this.providerType,
      required this.providerDeviceId,
      required this.type,
      required this.inputId,
      required this.outputId,
      required this.name,
      required final List<Map<String, dynamic>> capabilities,
      required final List<Map<String, dynamic>> properties,
      required this.createdAt,
      required this.updatedAt,
      required this.roomId,
      required this.floorId,
      required this.projectId})
      : _capabilities = capabilities,
        _properties = properties,
        super._();

  factory _$DeviceResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceResponseModelImplFromJson(json);

  @override
  final int id;
  @override
  final String providerType;
  @override
  final String? providerDeviceId;
  @override
  final String type;
  @override
  final int? inputId;
  @override
  final int? outputId;
  @override
  final String name;
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
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int? roomId;
  @override
  final int? floorId;
  @override
  final int projectId;

  @override
  String toString() {
    return 'DeviceResponseModel(id: $id, providerType: $providerType, providerDeviceId: $providerDeviceId, type: $type, inputId: $inputId, outputId: $outputId, name: $name, capabilities: $capabilities, properties: $properties, createdAt: $createdAt, updatedAt: $updatedAt, roomId: $roomId, floorId: $floorId, projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.providerDeviceId, providerDeviceId) ||
                other.providerDeviceId == providerDeviceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.inputId, inputId) || other.inputId == inputId) &&
            (identical(other.outputId, outputId) ||
                other.outputId == outputId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.floorId, floorId) || other.floorId == floorId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      providerType,
      providerDeviceId,
      type,
      inputId,
      outputId,
      name,
      const DeepCollectionEquality().hash(_capabilities),
      const DeepCollectionEquality().hash(_properties),
      createdAt,
      updatedAt,
      roomId,
      floorId,
      projectId);
}

abstract class _DeviceResponseModel extends DeviceResponseModel {
  const factory _DeviceResponseModel(
      {required final int id,
      required final String providerType,
      required final String? providerDeviceId,
      required final String type,
      required final int? inputId,
      required final int? outputId,
      required final String name,
      required final List<Map<String, dynamic>> capabilities,
      required final List<Map<String, dynamic>> properties,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final int? roomId,
      required final int? floorId,
      required final int projectId}) = _$DeviceResponseModelImpl;
  const _DeviceResponseModel._() : super._();

  factory _DeviceResponseModel.fromJson(Map<String, dynamic> json) =
      _$DeviceResponseModelImpl.fromJson;

  @override
  int get id;
  @override
  String get providerType;
  @override
  String? get providerDeviceId;
  @override
  String get type;
  @override
  int? get inputId;
  @override
  int? get outputId;
  @override
  String get name;
  @override
  List<Map<String, dynamic>> get capabilities;
  @override
  List<Map<String, dynamic>> get properties;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int? get roomId;
  @override
  int? get floorId;
  @override
  int get projectId;
}
