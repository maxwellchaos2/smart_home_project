// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_input_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomInputRequestModel _$RoomInputRequestModelFromJson(
    Map<String, dynamic> json) {
  return _RoomInputRequestModel.fromJson(json);
}

/// @nodoc
mixin _$RoomInputRequestModel {
  String get name => throw _privateConstructorUsedError;
  int get floorId => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$RoomInputRequestModelImpl extends _RoomInputRequestModel {
  const _$RoomInputRequestModelImpl({required this.name, required this.floorId})
      : super._();

  factory _$RoomInputRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomInputRequestModelImplFromJson(json);

  @override
  final String name;
  @override
  final int floorId;

  @override
  String toString() {
    return 'RoomInputRequestModel(name: $name, floorId: $floorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomInputRequestModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.floorId, floorId) || other.floorId == floorId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, floorId);
}

abstract class _RoomInputRequestModel extends RoomInputRequestModel {
  const factory _RoomInputRequestModel(
      {required final String name,
      required final int floorId}) = _$RoomInputRequestModelImpl;
  const _RoomInputRequestModel._() : super._();

  factory _RoomInputRequestModel.fromJson(Map<String, dynamic> json) =
      _$RoomInputRequestModelImpl.fromJson;

  @override
  String get name;
  @override
  int get floorId;
}
