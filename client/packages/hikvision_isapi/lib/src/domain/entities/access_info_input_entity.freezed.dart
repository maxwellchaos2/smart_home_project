// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_info_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccessInfoInputEntity {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get ipAddress => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
}

/// @nodoc

class _$AccessInfoInputEntityImpl implements _AccessInfoInputEntity {
  const _$AccessInfoInputEntityImpl(
      {required this.username,
      required this.password,
      required this.ipAddress,
      required this.port});

  @override
  final String username;
  @override
  final String password;
  @override
  final String ipAddress;
  @override
  final int port;

  @override
  String toString() {
    return 'AccessInfoInputEntity(username: $username, password: $password, ipAddress: $ipAddress, port: $port)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessInfoInputEntityImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.port, port) || other.port == port));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, username, password, ipAddress, port);
}

abstract class _AccessInfoInputEntity implements AccessInfoInputEntity {
  const factory _AccessInfoInputEntity(
      {required final String username,
      required final String password,
      required final String ipAddress,
      required final int port}) = _$AccessInfoInputEntityImpl;

  @override
  String get username;
  @override
  String get password;
  @override
  String get ipAddress;
  @override
  int get port;
}
