// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get hasYandexAuth => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ProjectModelImpl extends _ProjectModel {
  const _$ProjectModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(fromJson: dateTimeFromJson) required this.createdAt,
      required this.hasYandexAuth,
      required this.userId})
      : super._();

  factory _$ProjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime createdAt;
  @override
  final bool hasYandexAuth;
  @override
  final int userId;

  @override
  String toString() {
    return 'ProjectModel(id: $id, name: $name, createdAt: $createdAt, hasYandexAuth: $hasYandexAuth, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.hasYandexAuth, hasYandexAuth) ||
                other.hasYandexAuth == hasYandexAuth) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, createdAt, hasYandexAuth, userId);
}

abstract class _ProjectModel extends ProjectModel {
  const factory _ProjectModel(
      {required final int id,
      required final String name,
      @JsonKey(fromJson: dateTimeFromJson) required final DateTime createdAt,
      required final bool hasYandexAuth,
      required final int userId}) = _$ProjectModelImpl;
  const _ProjectModel._() : super._();

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$ProjectModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt;
  @override
  bool get hasYandexAuth;
  @override
  int get userId;
}
