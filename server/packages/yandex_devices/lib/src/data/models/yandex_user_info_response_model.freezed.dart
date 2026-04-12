// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yandex_user_info_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YandexUserInfoResponseModel {
  List<YandexDeviceModel> get devices;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YandexUserInfoResponseModel &&
            const DeepCollectionEquality().equals(other.devices, devices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(devices));

  @override
  String toString() {
    return 'YandexUserInfoResponseModel(devices: $devices)';
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _YandexUserInfoResponseModel extends YandexUserInfoResponseModel {
  const _YandexUserInfoResponseModel(
      {required final List<YandexDeviceModel> devices})
      : _devices = devices,
        super._();
  factory _YandexUserInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$YandexUserInfoResponseModelFromJson(json);

  final List<YandexDeviceModel> _devices;
  @override
  List<YandexDeviceModel> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YandexUserInfoResponseModel &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @override
  String toString() {
    return 'YandexUserInfoResponseModel(devices: $devices)';
  }
}

// dart format on
