// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventsRequestModel _$EventsRequestModelFromJson(Map<String, dynamic> json) {
  return _EventsRequestModel.fromJson(json);
}

/// @nodoc
mixin _$EventsRequestModel {
  @JsonKey(defaultValue: 100)
  int get limit => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get offset => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$EventsRequestModelImpl extends _EventsRequestModel {
  const _$EventsRequestModelImpl(
      {@JsonKey(defaultValue: 100) required this.limit,
      @JsonKey(defaultValue: 0) required this.offset})
      : super._();

  factory _$EventsRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventsRequestModelImplFromJson(json);

  @override
  @JsonKey(defaultValue: 100)
  final int limit;
  @override
  @JsonKey(defaultValue: 0)
  final int offset;

  @override
  String toString() {
    return 'EventsRequestModel(limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsRequestModelImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, limit, offset);
}

abstract class _EventsRequestModel extends EventsRequestModel {
  const factory _EventsRequestModel(
          {@JsonKey(defaultValue: 100) required final int limit,
          @JsonKey(defaultValue: 0) required final int offset}) =
      _$EventsRequestModelImpl;
  const _EventsRequestModel._() : super._();

  factory _EventsRequestModel.fromJson(Map<String, dynamic> json) =
      _$EventsRequestModelImpl.fromJson;

  @override
  @JsonKey(defaultValue: 100)
  int get limit;
  @override
  @JsonKey(defaultValue: 0)
  int get offset;
}
