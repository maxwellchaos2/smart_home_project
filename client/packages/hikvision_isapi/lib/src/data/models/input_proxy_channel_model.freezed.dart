// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_proxy_channel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InputProxyChannelModel _$InputProxyChannelModelFromJson(
    Map<String, dynamic> json) {
  return _InputProxyChannelModel.fromJson(json);
}

/// @nodoc
mixin _$InputProxyChannelModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$InputProxyChannelModelImpl extends _InputProxyChannelModel {
  const _$InputProxyChannelModelImpl({required this.id, required this.name})
      : super._();

  factory _$InputProxyChannelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputProxyChannelModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'InputProxyChannelModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputProxyChannelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);
}

abstract class _InputProxyChannelModel extends InputProxyChannelModel {
  const factory _InputProxyChannelModel(
      {required final String id,
      required final String name}) = _$InputProxyChannelModelImpl;
  const _InputProxyChannelModel._() : super._();

  factory _InputProxyChannelModel.fromJson(Map<String, dynamic> json) =
      _$InputProxyChannelModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
}
