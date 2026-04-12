// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'isapi_events_chunk_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IsapiEventsChunkModel _$IsapiEventsChunkModelFromJson(
    Map<String, dynamic> json) {
  return _IsapiEventsChunkModel.fromJson(json);
}

/// @nodoc
mixin _$IsapiEventsChunkModel {
  int get totalMatches => throw _privateConstructorUsedError;
  List<IsapiEventModel> get InfoList => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$IsapiEventsChunkModelImpl extends _IsapiEventsChunkModel {
  const _$IsapiEventsChunkModelImpl(
      {required this.totalMatches,
      required final List<IsapiEventModel> InfoList})
      : _InfoList = InfoList,
        super._();

  factory _$IsapiEventsChunkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IsapiEventsChunkModelImplFromJson(json);

  @override
  final int totalMatches;
  final List<IsapiEventModel> _InfoList;
  @override
  List<IsapiEventModel> get InfoList {
    if (_InfoList is EqualUnmodifiableListView) return _InfoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_InfoList);
  }

  @override
  String toString() {
    return 'IsapiEventsChunkModel(totalMatches: $totalMatches, InfoList: $InfoList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsapiEventsChunkModelImpl &&
            (identical(other.totalMatches, totalMatches) ||
                other.totalMatches == totalMatches) &&
            const DeepCollectionEquality().equals(other._InfoList, _InfoList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalMatches,
      const DeepCollectionEquality().hash(_InfoList));
}

abstract class _IsapiEventsChunkModel extends IsapiEventsChunkModel {
  const factory _IsapiEventsChunkModel(
          {required final int totalMatches,
          required final List<IsapiEventModel> InfoList}) =
      _$IsapiEventsChunkModelImpl;
  const _IsapiEventsChunkModel._() : super._();

  factory _IsapiEventsChunkModel.fromJson(Map<String, dynamic> json) =
      _$IsapiEventsChunkModelImpl.fromJson;

  @override
  int get totalMatches;
  @override
  List<IsapiEventModel> get InfoList;
}
