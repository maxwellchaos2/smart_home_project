// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserResponseModel {
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  List<int> get projectsId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$UserResponseModelImpl extends _UserResponseModel {
  const _$UserResponseModelImpl(
      {required this.name,
      required this.type,
      required this.createdAt,
      required this.updatedAt,
      required this.username,
      required this.email,
      required final List<int> projectsId})
      : _projectsId = projectsId,
        super._();

  @override
  final String name;
  @override
  final String type;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String username;
  @override
  final String? email;
  final List<int> _projectsId;
  @override
  List<int> get projectsId {
    if (_projectsId is EqualUnmodifiableListView) return _projectsId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectsId);
  }

  @override
  String toString() {
    return 'UserResponseModel(name: $name, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, username: $username, email: $email, projectsId: $projectsId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._projectsId, _projectsId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, type, createdAt, updatedAt,
      username, email, const DeepCollectionEquality().hash(_projectsId));

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseModelImplToJson(
      this,
    );
  }
}

abstract class _UserResponseModel extends UserResponseModel {
  const factory _UserResponseModel(
      {required final String name,
      required final String type,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String username,
      required final String? email,
      required final List<int> projectsId}) = _$UserResponseModelImpl;
  const _UserResponseModel._() : super._();

  @override
  String get name;
  @override
  String get type;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get username;
  @override
  String? get email;
  @override
  List<int> get projectsId;
}
