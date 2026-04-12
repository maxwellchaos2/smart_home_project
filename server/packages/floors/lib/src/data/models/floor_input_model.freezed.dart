// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FloorInputModel {
  String get name => throw _privateConstructorUsedError;
  int get projectId => throw _privateConstructorUsedError;
  String? get planMediaPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$FloorInputModelImpl extends _FloorInputModel {
  const _$FloorInputModelImpl(
      {required this.name,
      required this.projectId,
      required this.planMediaPath})
      : super._();

  @override
  final String name;
  @override
  final int projectId;
  @override
  final String? planMediaPath;

  @override
  String toString() {
    return 'FloorInputModel(name: $name, projectId: $projectId, planMediaPath: $planMediaPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloorInputModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.planMediaPath, planMediaPath) ||
                other.planMediaPath == planMediaPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, projectId, planMediaPath);

  @override
  Map<String, dynamic> toJson() {
    return _$$FloorInputModelImplToJson(
      this,
    );
  }
}

abstract class _FloorInputModel extends FloorInputModel {
  const factory _FloorInputModel(
      {required final String name,
      required final int projectId,
      required final String? planMediaPath}) = _$FloorInputModelImpl;
  const _FloorInputModel._() : super._();

  @override
  String get name;
  @override
  int get projectId;
  @override
  String? get planMediaPath;
}
