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
  String get provider => throw _privateConstructorUsedError;
  String? get providerDeviceId => throw _privateConstructorUsedError;
  int? get inputId => throw _privateConstructorUsedError;
  int? get outputId => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get capabilities => throw _privateConstructorUsedError;
  String get properties => throw _privateConstructorUsedError;
  int? get roomId => throw _privateConstructorUsedError;
  int? get floorId => throw _privateConstructorUsedError;
  int get projectId => throw _privateConstructorUsedError;
  Map<String, Object?>? get customData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DeviceControllerInputInputModelImpl
    extends _DeviceControllerInputInputModel {
  const _$DeviceControllerInputInputModelImpl(
      {required this.type,
      required this.provider,
      required this.providerDeviceId,
      required this.inputId,
      required this.outputId,
      required this.isHidden,
      required this.name,
      required this.capabilities,
      required this.properties,
      required this.roomId,
      required this.floorId,
      required this.projectId,
      final Map<String, Object?>? customData})
      : _customData = customData,
        super._();

  @override
  final String type;
  @override
  final String provider;
  @override
  final String? providerDeviceId;
  @override
  final int? inputId;
  @override
  final int? outputId;
  @override
  final bool isHidden;
  @override
  final String name;
  @override
  final String capabilities;
  @override
  final String properties;
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
  String toString() {
    return 'DeviceInputModel(type: $type, provider: $provider, providerDeviceId: $providerDeviceId, inputId: $inputId, outputId: $outputId, isHidden: $isHidden, name: $name, capabilities: $capabilities, properties: $properties, roomId: $roomId, floorId: $floorId, projectId: $projectId, customData: $customData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceControllerInputInputModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerDeviceId, providerDeviceId) ||
                other.providerDeviceId == providerDeviceId) &&
            (identical(other.inputId, inputId) || other.inputId == inputId) &&
            (identical(other.outputId, outputId) ||
                other.outputId == outputId) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.capabilities, capabilities) ||
                other.capabilities == capabilities) &&
            (identical(other.properties, properties) ||
                other.properties == properties) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.floorId, floorId) || other.floorId == floorId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality()
                .equals(other._customData, _customData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      provider,
      providerDeviceId,
      inputId,
      outputId,
      isHidden,
      name,
      capabilities,
      properties,
      roomId,
      floorId,
      projectId,
      const DeepCollectionEquality().hash(_customData));

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceControllerInputInputModelImplToJson(
      this,
    );
  }
}

abstract class _DeviceControllerInputInputModel extends DeviceInputModel {
  const factory _DeviceControllerInputInputModel(
          {required final String type,
          required final String provider,
          required final String? providerDeviceId,
          required final int? inputId,
          required final int? outputId,
          required final bool isHidden,
          required final String name,
          required final String capabilities,
          required final String properties,
          required final int? roomId,
          required final int? floorId,
          required final int projectId,
          final Map<String, Object?>? customData}) =
      _$DeviceControllerInputInputModelImpl;
  const _DeviceControllerInputInputModel._() : super._();

  @override
  String get type;
  @override
  String get provider;
  @override
  String? get providerDeviceId;
  @override
  int? get inputId;
  @override
  int? get outputId;
  @override
  bool get isHidden;
  @override
  String get name;
  @override
  String get capabilities;
  @override
  String get properties;
  @override
  int? get roomId;
  @override
  int? get floorId;
  @override
  int get projectId;
  @override
  Map<String, Object?>? get customData;
}
