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
  String get name => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get capabilities =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get properties =>
      throw _privateConstructorUsedError;
  int? get roomId => throw _privateConstructorUsedError;
  int? get floorId => throw _privateConstructorUsedError;
  Map<String, Object?>? get customData => throw _privateConstructorUsedError;

  /// Serializes this DeviceInputModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$DeviceInputModelImpl extends _DeviceInputModel {
  const _$DeviceInputModelImpl(
      {required this.type,
      required this.providerType,
      required this.providerDeviceId,
      required this.name,
      required this.isHidden,
      required final List<Map<String, dynamic>> capabilities,
      required final List<Map<String, dynamic>> properties,
      required this.roomId,
      required this.floorId,
      required final Map<String, Object?>? customData})
      : _capabilities = capabilities,
        _properties = properties,
        _customData = customData,
        super._();

  @override
  final String type;
  @override
  final String providerType;
  @override
  final String? providerDeviceId;
  @override
  final String name;
  @override
  final bool isHidden;
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
    return 'DeviceInputModel(type: $type, providerType: $providerType, providerDeviceId: $providerDeviceId, name: $name, isHidden: $isHidden, capabilities: $capabilities, properties: $properties, roomId: $roomId, floorId: $floorId, customData: $customData)';
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
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.floorId, floorId) || other.floorId == floorId) &&
            const DeepCollectionEquality()
                .equals(other._customData, _customData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      providerType,
      providerDeviceId,
      name,
      isHidden,
      const DeepCollectionEquality().hash(_capabilities),
      const DeepCollectionEquality().hash(_properties),
      roomId,
      floorId,
      const DeepCollectionEquality().hash(_customData));

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
          required final String name,
          required final bool isHidden,
          required final List<Map<String, dynamic>> capabilities,
          required final List<Map<String, dynamic>> properties,
          required final int? roomId,
          required final int? floorId,
          required final Map<String, Object?>? customData}) =
      _$DeviceInputModelImpl;
  const _DeviceInputModel._() : super._();

  @override
  String get type;
  @override
  String get providerType;
  @override
  String? get providerDeviceId;
  @override
  String get name;
  @override
  bool get isHidden;
  @override
  List<Map<String, dynamic>> get capabilities;
  @override
  List<Map<String, dynamic>> get properties;
  @override
  int? get roomId;
  @override
  int? get floorId;
  @override
  Map<String, Object?>? get customData;
}
