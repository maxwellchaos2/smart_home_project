// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'isapi_event_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IsapiEventInputEntity {
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
}

/// @nodoc

class _$IsapiEventInputEntityImpl implements _IsapiEventInputEntity {
  const _$IsapiEventInputEntityImpl(
      {required this.limit, required this.offset});

  @override
  final int limit;
  @override
  final int offset;

  @override
  String toString() {
    return 'IsapiEventInputEntity(limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsapiEventInputEntityImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, offset);
}

abstract class _IsapiEventInputEntity implements IsapiEventInputEntity {
  const factory _IsapiEventInputEntity(
      {required final int limit,
      required final int offset}) = _$IsapiEventInputEntityImpl;

  @override
  int get limit;
  @override
  int get offset;
}
