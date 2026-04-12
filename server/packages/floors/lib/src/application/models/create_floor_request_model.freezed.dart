// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_floor_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateFloorRequestModel _$CreateFloorRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreateFloorRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateFloorRequestModel {
  String get name => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CreateFloorRequestModelImpl extends _CreateFloorRequestModel {
  const _$CreateFloorRequestModelImpl({required this.name}) : super._();

  factory _$CreateFloorRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFloorRequestModelImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'CreateFloorRequestModel(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFloorRequestModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);
}

abstract class _CreateFloorRequestModel extends CreateFloorRequestModel {
  const factory _CreateFloorRequestModel({required final String name}) =
      _$CreateFloorRequestModelImpl;
  const _CreateFloorRequestModel._() : super._();

  factory _CreateFloorRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateFloorRequestModelImpl.fromJson;

  @override
  String get name;
}
