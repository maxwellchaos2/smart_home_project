// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_device_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActionDeviceRequestModel {
  String get id;
  Map<String, dynamic>? get customData;
  List<Map<String, dynamic>>? get capabilities;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActionDeviceRequestModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.customData, customData) &&
            const DeepCollectionEquality()
                .equals(other.capabilities, capabilities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(customData),
      const DeepCollectionEquality().hash(capabilities));

  @override
  String toString() {
    return 'ActionDeviceRequestModel(id: $id, customData: $customData, capabilities: $capabilities)';
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _ActionDeviceRequestModel extends ActionDeviceRequestModel {
  const _ActionDeviceRequestModel(
      {required this.id,
      required final Map<String, dynamic>? customData,
      required final List<Map<String, dynamic>>? capabilities})
      : _customData = customData,
        _capabilities = capabilities,
        super._();
  factory _ActionDeviceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ActionDeviceRequestModelFromJson(json);

  @override
  final String id;
  final Map<String, dynamic>? _customData;
  @override
  Map<String, dynamic>? get customData {
    final value = _customData;
    if (value == null) return null;
    if (_customData is EqualUnmodifiableMapView) return _customData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Map<String, dynamic>>? _capabilities;
  @override
  List<Map<String, dynamic>>? get capabilities {
    final value = _capabilities;
    if (value == null) return null;
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActionDeviceRequestModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._customData, _customData) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_customData),
      const DeepCollectionEquality().hash(_capabilities));

  @override
  String toString() {
    return 'ActionDeviceRequestModel(id: $id, customData: $customData, capabilities: $capabilities)';
  }
}

// dart format on
