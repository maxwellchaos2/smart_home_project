// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'isapi_event_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IsapiEventInputModel {
  bool get timeReverseOrder => throw _privateConstructorUsedError;
  String get searchID => throw _privateConstructorUsedError;
  int get searchResultPosition => throw _privateConstructorUsedError;
  int get maxResults => throw _privateConstructorUsedError;
  int get major => throw _privateConstructorUsedError;
  int get minor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$IsapiEventInputModelImpl extends _IsapiEventInputModel {
  const _$IsapiEventInputModelImpl(
      {required this.timeReverseOrder,
      required this.searchID,
      required this.searchResultPosition,
      required this.maxResults,
      required this.major,
      required this.minor})
      : super._();

  @override
  final bool timeReverseOrder;
  @override
  final String searchID;
  @override
  final int searchResultPosition;
  @override
  final int maxResults;
  @override
  final int major;
  @override
  final int minor;

  @override
  String toString() {
    return 'IsapiEventInputModel(timeReverseOrder: $timeReverseOrder, searchID: $searchID, searchResultPosition: $searchResultPosition, maxResults: $maxResults, major: $major, minor: $minor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsapiEventInputModelImpl &&
            (identical(other.timeReverseOrder, timeReverseOrder) ||
                other.timeReverseOrder == timeReverseOrder) &&
            (identical(other.searchID, searchID) ||
                other.searchID == searchID) &&
            (identical(other.searchResultPosition, searchResultPosition) ||
                other.searchResultPosition == searchResultPosition) &&
            (identical(other.maxResults, maxResults) ||
                other.maxResults == maxResults) &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.minor, minor) || other.minor == minor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timeReverseOrder, searchID,
      searchResultPosition, maxResults, major, minor);

  @override
  Map<String, dynamic> toJson() {
    return _$$IsapiEventInputModelImplToJson(
      this,
    );
  }
}

abstract class _IsapiEventInputModel extends IsapiEventInputModel {
  const factory _IsapiEventInputModel(
      {required final bool timeReverseOrder,
      required final String searchID,
      required final int searchResultPosition,
      required final int maxResults,
      required final int major,
      required final int minor}) = _$IsapiEventInputModelImpl;
  const _IsapiEventInputModel._() : super._();

  @override
  bool get timeReverseOrder;
  @override
  String get searchID;
  @override
  int get searchResultPosition;
  @override
  int get maxResults;
  @override
  int get major;
  @override
  int get minor;
}
