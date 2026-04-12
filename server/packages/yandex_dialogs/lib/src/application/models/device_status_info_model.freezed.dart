// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_status_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceStatusInfoModel {
  bool get reportable;

  /// Serializes this DeviceStatusInfoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceStatusInfoModel &&
            (identical(other.reportable, reportable) ||
                other.reportable == reportable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reportable);

  @override
  String toString() {
    return 'DeviceStatusInfoModel(reportable: $reportable)';
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _DeviceStatusInfoModel extends DeviceStatusInfoModel {
  const _DeviceStatusInfoModel({required this.reportable}) : super._();

  @override
  final bool reportable;

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceStatusInfoModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceStatusInfoModel &&
            (identical(other.reportable, reportable) ||
                other.reportable == reportable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reportable);

  @override
  String toString() {
    return 'DeviceStatusInfoModel(reportable: $reportable)';
  }
}

// dart format on
