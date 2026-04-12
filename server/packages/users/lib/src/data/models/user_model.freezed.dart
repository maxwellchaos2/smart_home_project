// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  List<int> get projectsId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get passwordHash => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.name,
      required this.type,
      @JsonKey(fromJson: dateTimeFromJson) required this.createdAt,
      @JsonKey(fromJson: dateTimeFromJson) required this.updatedAt,
      required final List<int> projectsId,
      required this.email,
      required this.username,
      required this.passwordHash})
      : _projectsId = projectsId,
        super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String type;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  final DateTime updatedAt;
  final List<int> _projectsId;
  @override
  List<int> get projectsId {
    if (_projectsId is EqualUnmodifiableListView) return _projectsId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectsId);
  }

  @override
  final String? email;
  @override
  final String username;
  @override
  final String passwordHash;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, projectsId: $projectsId, email: $email, username: $username, passwordHash: $passwordHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._projectsId, _projectsId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_projectsId),
      email,
      username,
      passwordHash);
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {required final int id,
      required final String name,
      required final String type,
      @JsonKey(fromJson: dateTimeFromJson) required final DateTime createdAt,
      @JsonKey(fromJson: dateTimeFromJson) required final DateTime updatedAt,
      required final List<int> projectsId,
      required final String? email,
      required final String username,
      required final String passwordHash}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get type;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson)
  DateTime get updatedAt;
  @override
  List<int> get projectsId;
  @override
  String? get email;
  @override
  String get username;
  @override
  String get passwordHash;
}
