// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceInputModel {
  String get type => throw _privateConstructorUsedError;
  String get providerType => throw _privateConstructorUsedError;
  String? get providerDeviceId => throw _privateConstructorUsedError;
  int? get inputId => throw _privateConstructorUsedError;
  int? get outputId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get capabilities =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get properties =>
      throw _privateConstructorUsedError;
  int? get roomId => throw _privateConstructorUsedError;
  int? get floorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$DeviceInputModelImpl extends _DeviceInputModel {
  const _$DeviceInputModelImpl(
      {required this.type,
      required this.providerType,
      required this.providerDeviceId,
      required this.inputId,
      required this.outputId,
      required this.name,
      required final List<Map<String, dynamic>> capabilities,
      required final List<Map<String, dynamic>> properties,
      required this.roomId,
      required this.floorId})
      : _capabilities = capabilities,
        _properties = properties,
        super._();

  @override
  final String type;
  @override
  final String providerType;
  @override
  final String? providerDeviceId;
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
  final int? roomId;
  @override
  final int? floorId;

  @override
  String toString() {
    return 'DeviceInputModel(type: $type, providerType: $providerType, providerDeviceId: $providerDeviceId, inputId: $inputId, outputId: $outputId, name: $name, capabilities: $capabilities, properties: $properties, roomId: $roomId, floorId: $floorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceInputModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.providerDeviceId, providerDeviceId) ||
                other.providerDeviceId == providerDeviceId) &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      providerType,
      providerDeviceId,
      inputId,
      outputId,
      name,
      const DeepCollectionEquality().hash(_capabilities),
      const DeepCollectionEquality().hash(_properties),
      roomId,
      floorId);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceInputModelImplToJson(
      this,
    );
  }
}

abstract class _DeviceInputModel extends DeviceInputModel {
  const factory _DeviceInputModel(
      {required final String type,
      required final String providerType,
      required final String? providerDeviceId,
      required final int? inputId,
      required final int? outputId,
      required final String name,
      required final List<Map<String, dynamic>> capabilities,
      required final List<Map<String, dynamic>> properties,
      required final int? roomId,
      required final int? floorId}) = _$DeviceInputModelImpl;
  const _DeviceInputModel._() : super._();

  @override
  String get type;
  @override
  String get providerType;
  @override
  String? get providerDeviceId;
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
  int? get roomId;
  @override
  int? get floorId;
}
