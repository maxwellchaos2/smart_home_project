// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserInputEntity {
  String get name => throw _privateConstructorUsedError;
  UserType get type => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
}

/// @nodoc

class _$UserInputEntityImpl implements _UserInputEntity {
  const _$UserInputEntityImpl(
      {required this.name,
      required this.type,
      required this.username,
      required this.password,
      required this.email});

  @override
  final String name;
  @override
  final UserType type;
  @override
  final String username;
  @override
  final String password;
  @override
  final String? email;

  @override
  String toString() {
    return 'UserInputEntity(name: $name, type: $type, username: $username, password: $password, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInputEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, type, username, password, email);
}

abstract class _UserInputEntity implements UserInputEntity {
  const factory _UserInputEntity(
      {required final String name,
      required final UserType type,
      required final String username,
      required final String password,
      required final String? email}) = _$UserInputEntityImpl;

  @override
  String get name;
  @override
  UserType get type;
  @override
  String get username;
  @override
  String get password;
  @override
  String? get email;
}
