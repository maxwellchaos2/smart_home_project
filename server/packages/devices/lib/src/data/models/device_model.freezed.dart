// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) {
  return _DeviceControllerInputModel.fromJson(json);
}

/// @nodoc
mixin _$DeviceModel {
  int get id => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  String? get providerDeviceId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int? get inputId => throw _privateConstructorUsedError;
  int? get outputId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  List<dynamic> get capabilities => throw _privateConstructorUsedError;
  List<dynamic> get properties => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int? get roomId => throw _privateConstructorUsedError;
  int? get floorId => throw _privateConstructorUsedError;
  int get projectId => throw _privateConstructorUsedError;
  Map<String, Object?>? get customData => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDateTime)
  DateTime get lastHeartbeat => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DeviceControllerInputModelImpl extends _DeviceControllerInputModel {
  const _$DeviceControllerInputModelImpl(
      {required this.id,
      required this.provider,
      required this.providerDeviceId,
      required this.type,
      required this.inputId,
      required this.outputId,
      required this.name,
      this.isHidden = false,
      required final List<dynamic> capabilities,
      required final List<dynamic> properties,
      @JsonKey(fromJson: fromJsonDateTime) required this.createdAt,
      @JsonKey(fromJson: fromJsonDateTime) required this.updatedAt,
      required this.roomId,
      required this.floorId,
      required this.projectId,
      final Map<String, Object?>? customData,
      @JsonKey(fromJson: fromJsonDateTime) required this.lastHeartbeat,
      required this.status})
      : _capabilities = capabilities,
        _properties = properties,
        _customData = customData,
        super._();

  factory _$DeviceControllerInputModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DeviceControllerInputModelImplFromJson(json);

  @override
  final int id;
  @override
  final String provider;
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
  @override
  @JsonKey()
  final bool isHidden;
  final List<dynamic> _capabilities;
  @override
  List<dynamic> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  final List<dynamic> _properties;
  @override
  List<dynamic> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  @JsonKey(fromJson: fromJsonDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: fromJsonDateTime)
  final DateTime updatedAt;
  @override
  final int? roomId;
  @override
  final int? floorId;
  @override
  final int projectId;
  final Map<String, Object?>? _customData;
  @override
  Map<String, Object?>? get customData {
    final value = _customData;
    if (value == null) return null;
    if (_customData is EqualUnmodifiableMapView) return _customData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(fromJson: fromJsonDateTime)
  final DateTime lastHeartbeat;
  @override
  final String status;

  @override
  String toString() {
    return 'DeviceModel(id: $id, provider: $provider, providerDeviceId: $providerDeviceId, type: $type, inputId: $inputId, outputId: $outputId, name: $name, isHidden: $isHidden, capabilities: $capabilities, properties: $properties, createdAt: $createdAt, updatedAt: $updatedAt, roomId: $roomId, floorId: $floorId, projectId: $projectId, customData: $customData, lastHeartbeat: $lastHeartbeat, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceControllerInputModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerDeviceId, providerDeviceId) ||
                other.providerDeviceId == providerDeviceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.inputId, inputId) || other.inputId == inputId) &&
            (identical(other.outputId, outputId) ||
                other.outputId == outputId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
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
                other.projectId == projectId) &&
            const DeepCollectionEquality()
                .equals(other._customData, _customData) &&
            (identical(other.lastHeartbeat, lastHeartbeat) ||
                other.lastHeartbeat == lastHeartbeat) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      provider,
      providerDeviceId,
      type,
      inputId,
      outputId,
      name,
      isHidden,
      const DeepCollectionEquality().hash(_capabilities),
      const DeepCollectionEquality().hash(_properties),
      createdAt,
      updatedAt,
      roomId,
      floorId,
      projectId,
      const DeepCollectionEquality().hash(_customData),
      lastHeartbeat,
      status);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceControllerInputModelImplToJson(
      this,
    );
  }
}

abstract class _DeviceControllerInputModel extends DeviceModel {
  const factory _DeviceControllerInputModel(
      {required final int id,
      required final String provider,
      required final String? providerDeviceId,
      required final String type,
      required final int? inputId,
      required final int? outputId,
      required final String name,
      final bool isHidden,
      required final List<dynamic> capabilities,
      required final List<dynamic> properties,
      @JsonKey(fromJson: fromJsonDateTime) required final DateTime createdAt,
      @JsonKey(fromJson: fromJsonDateTime) required final DateTime updatedAt,
      required final int? roomId,
      required final int? floorId,
      required final int projectId,
      final Map<String, Object?>? customData,
      @JsonKey(fromJson: fromJsonDateTime)
      required final DateTime lastHeartbeat,
      required final String status}) = _$DeviceControllerInputModelImpl;
  const _DeviceControllerInputModel._() : super._();

  factory _DeviceControllerInputModel.fromJson(Map<String, dynamic> json) =
      _$DeviceControllerInputModelImpl.fromJson;

  @override
  int get id;
  @override
  String get provider;
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
  bool get isHidden;
  @override
  List<dynamic> get capabilities;
  @override
  List<dynamic> get properties;
  @override
  @JsonKey(fromJson: fromJsonDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: fromJsonDateTime)
  DateTime get updatedAt;
  @override
  int? get roomId;
  @override
  int? get floorId;
  @override
  int get projectId;
  @override
  Map<String, Object?>? get customData;
  @override
  @JsonKey(fromJson: fromJsonDateTime)
  DateTime get lastHeartbeat;
  @override
  String get status;
}
