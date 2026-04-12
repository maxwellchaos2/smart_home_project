// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'isapi_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IsapiEventModel _$IsapiEventModelFromJson(Map<String, dynamic> json) {
  return _IsapiEventModel.fromJson(json);
}

/// @nodoc
mixin _$IsapiEventModel {
  DateTime get time => throw _privateConstructorUsedError;
  int get minor => throw _privateConstructorUsedError;
  int get major => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$IsapiEventModelImpl extends _IsapiEventModel {
  const _$IsapiEventModelImpl(
      {required this.time,
      required this.minor,
      required this.major,
      required this.name})
      : super._();

  factory _$IsapiEventModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IsapiEventModelImplFromJson(json);

  @override
  final DateTime time;
  @override
  final int minor;
  @override
  final int major;
  @override
  final String? name;

  @override
  String toString() {
    return 'IsapiEventModel(time: $time, minor: $minor, major: $major, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsapiEventModelImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.minor, minor) || other.minor == minor) &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, minor, major, name);
}

abstract class _IsapiEventModel extends IsapiEventModel {
  const factory _IsapiEventModel(
      {required final DateTime time,
      required final int minor,
      required final int major,
      required final String? name}) = _$IsapiEventModelImpl;
  const _IsapiEventModel._() : super._();

  factory _IsapiEventModel.fromJson(Map<String, dynamic> json) =
      _$IsapiEventModelImpl.fromJson;

  @override
  DateTime get time;
  @override
  int get minor;
  @override
  int get major;
  @override
  String? get name;
}
