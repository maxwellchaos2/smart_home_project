// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateUserRequestModel _$CreateUserRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CreateUserRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateUserRequestModel {
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$CreateUserRequestModelImpl extends _CreateUserRequestModel {
  const _$CreateUserRequestModelImpl(
      {required this.name,
      required this.type,
      required this.username,
      required this.password,
      required this.email})
      : super._();

  factory _$CreateUserRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateUserRequestModelImplFromJson(json);

  @override
  final String name;
  @override
  final String type;
  @override
  final String username;
  @override
  final String password;
  @override
  final String? email;

  @override
  String toString() {
    return 'CreateUserRequestModel(name: $name, type: $type, username: $username, password: $password, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserRequestModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, type, username, password, email);
}

abstract class _CreateUserRequestModel extends CreateUserRequestModel {
  const factory _CreateUserRequestModel(
      {required final String name,
      required final String type,
      required final String username,
      required final String password,
      required final String? email}) = _$CreateUserRequestModelImpl;
  const _CreateUserRequestModel._() : super._();

  factory _CreateUserRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateUserRequestModelImpl.fromJson;

  @override
  String get name;
  @override
  String get type;
  @override
  String get username;
  @override
  String get password;
  @override
  String? get email;
}
