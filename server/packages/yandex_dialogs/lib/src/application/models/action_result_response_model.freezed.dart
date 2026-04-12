// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_result_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActionResultResponseModel {
  String get status;
  String? get errorCode;

  /// Serializes this ActionResultResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActionResultResponseModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, errorCode);

  @override
  String toString() {
    return 'ActionResultResponseModel(status: $status, errorCode: $errorCode)';
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _ActionResultResponseModel extends ActionResultResponseModel {
  const _ActionResultResponseModel({required this.status, this.errorCode})
      : super._();

  @override
  final String status;
  @override
  final String? errorCode;

  @override
  Map<String, dynamic> toJson() {
    return _$ActionResultResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActionResultResponseModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, errorCode);

  @override
  String toString() {
    return 'ActionResultResponseModel(status: $status, errorCode: $errorCode)';
  }
}

/// @nodoc
mixin _$ActionDeviceResultResponseModel {
  String get id;
  ActionResultResponseModel get actionResult;

  /// Serializes this ActionDeviceResultResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActionDeviceResultResponseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actionResult, actionResult) ||
                other.actionResult == actionResult));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, actionResult);

  @override
  String toString() {
    return 'ActionDeviceResultResponseModel(id: $id, actionResult: $actionResult)';
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _ActionDeviceResultResponseModel extends ActionDeviceResultResponseModel {
  const _ActionDeviceResultResponseModel(
      {required this.id, required this.actionResult})
      : super._();

  @override
  final String id;
  @override
  final ActionResultResponseModel actionResult;

  @override
  Map<String, dynamic> toJson() {
    return _$ActionDeviceResultResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActionDeviceResultResponseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actionResult, actionResult) ||
                other.actionResult == actionResult));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, actionResult);

  @override
  String toString() {
    return 'ActionDeviceResultResponseModel(id: $id, actionResult: $actionResult)';
  }
}

// dart format on
