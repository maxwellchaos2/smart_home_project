// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_project_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateProjectRequestModel _$CreateProjectRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreateProjectRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateProjectRequestModel {
  String get name => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CreateProjectRequestModelImpl extends _CreateProjectRequestModel {
  const _$CreateProjectRequestModelImpl({required this.name}) : super._();

  factory _$CreateProjectRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateProjectRequestModelImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'CreateProjectRequestModel(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateProjectRequestModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);
}

abstract class _CreateProjectRequestModel extends CreateProjectRequestModel {
  const factory _CreateProjectRequestModel({required final String name}) =
      _$CreateProjectRequestModelImpl;
  const _CreateProjectRequestModel._() : super._();

  factory _CreateProjectRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateProjectRequestModelImpl.fromJson;

  @override
  String get name;
}
