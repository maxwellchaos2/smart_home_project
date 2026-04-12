// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recording_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecordingEntity {
  String get trackId => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String get playbackUrl => throw _privateConstructorUsedError;
  String get contentType => throw _privateConstructorUsedError;
  String get codecType => throw _privateConstructorUsedError;
  String? get sourceId => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
}

/// @nodoc

class _$RecordingEntityImpl implements _RecordingEntity {
  const _$RecordingEntityImpl(
      {required this.trackId,
      required this.startTime,
      required this.endTime,
      required this.playbackUrl,
      required this.contentType,
      required this.codecType,
      this.sourceId,
      this.size});

  @override
  final String trackId;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String playbackUrl;
  @override
  final String contentType;
  @override
  final String codecType;
  @override
  final String? sourceId;
  @override
  final int? size;

  @override
  String toString() {
    return 'RecordingEntity(trackId: $trackId, startTime: $startTime, endTime: $endTime, playbackUrl: $playbackUrl, contentType: $contentType, codecType: $codecType, sourceId: $sourceId, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingEntityImpl &&
            (identical(other.trackId, trackId) || other.trackId == trackId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.playbackUrl, playbackUrl) ||
                other.playbackUrl == playbackUrl) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.codecType, codecType) ||
                other.codecType == codecType) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, trackId, startTime, endTime,
      playbackUrl, contentType, codecType, sourceId, size);
}

abstract class _RecordingEntity implements RecordingEntity {
  const factory _RecordingEntity(
      {required final String trackId,
      required final DateTime startTime,
      required final DateTime endTime,
      required final String playbackUrl,
      required final String contentType,
      required final String codecType,
      final String? sourceId,
      final int? size}) = _$RecordingEntityImpl;

  @override
  String get trackId;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String get playbackUrl;
  @override
  String get contentType;
  @override
  String get codecType;
  @override
  String? get sourceId;
  @override
  int? get size;
}

/// @nodoc
mixin _$RecordingSearchInputEntity {
  String get trackId => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int get maxResults => throw _privateConstructorUsedError;
  int get searchResultPosition => throw _privateConstructorUsedError;
}

/// @nodoc

class _$RecordingSearchInputEntityImpl implements _RecordingSearchInputEntity {
  const _$RecordingSearchInputEntityImpl(
      {required this.trackId,
      required this.startTime,
      required this.endTime,
      this.maxResults = 100,
      this.searchResultPosition = 0});

  @override
  final String trackId;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  @JsonKey()
  final int maxResults;
  @override
  @JsonKey()
  final int searchResultPosition;

  @override
  String toString() {
    return 'RecordingSearchInputEntity(trackId: $trackId, startTime: $startTime, endTime: $endTime, maxResults: $maxResults, searchResultPosition: $searchResultPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingSearchInputEntityImpl &&
            (identical(other.trackId, trackId) || other.trackId == trackId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.maxResults, maxResults) ||
                other.maxResults == maxResults) &&
            (identical(other.searchResultPosition, searchResultPosition) ||
                other.searchResultPosition == searchResultPosition));
  }

  @override
  int get hashCode => Object.hash(runtimeType, trackId, startTime, endTime,
      maxResults, searchResultPosition);
}

abstract class _RecordingSearchInputEntity
    implements RecordingSearchInputEntity {
  const factory _RecordingSearchInputEntity(
      {required final String trackId,
      required final DateTime startTime,
      required final DateTime endTime,
      final int maxResults,
      final int searchResultPosition}) = _$RecordingSearchInputEntityImpl;

  @override
  String get trackId;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  int get maxResults;
  @override
  int get searchResultPosition;
}

/// @nodoc
mixin _$RecordingSearchResultEntity {
  String get searchId => throw _privateConstructorUsedError;
  bool get responseStatus => throw _privateConstructorUsedError;
  String get responseStatusString => throw _privateConstructorUsedError;
  int get numOfMatches => throw _privateConstructorUsedError;
  List<RecordingEntity> get recordings => throw _privateConstructorUsedError;
}

/// @nodoc

class _$RecordingSearchResultEntityImpl
    implements _RecordingSearchResultEntity {
  const _$RecordingSearchResultEntityImpl(
      {required this.searchId,
      required this.responseStatus,
      required this.responseStatusString,
      required this.numOfMatches,
      required final List<RecordingEntity> recordings})
      : _recordings = recordings;

  @override
  final String searchId;
  @override
  final bool responseStatus;
  @override
  final String responseStatusString;
  @override
  final int numOfMatches;
  final List<RecordingEntity> _recordings;
  @override
  List<RecordingEntity> get recordings {
    if (_recordings is EqualUnmodifiableListView) return _recordings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recordings);
  }

  @override
  String toString() {
    return 'RecordingSearchResultEntity(searchId: $searchId, responseStatus: $responseStatus, responseStatusString: $responseStatusString, numOfMatches: $numOfMatches, recordings: $recordings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingSearchResultEntityImpl &&
            (identical(other.searchId, searchId) ||
                other.searchId == searchId) &&
            (identical(other.responseStatus, responseStatus) ||
                other.responseStatus == responseStatus) &&
            (identical(other.responseStatusString, responseStatusString) ||
                other.responseStatusString == responseStatusString) &&
            (identical(other.numOfMatches, numOfMatches) ||
                other.numOfMatches == numOfMatches) &&
            const DeepCollectionEquality()
                .equals(other._recordings, _recordings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchId,
      responseStatus,
      responseStatusString,
      numOfMatches,
      const DeepCollectionEquality().hash(_recordings));
}

abstract class _RecordingSearchResultEntity
    implements RecordingSearchResultEntity {
  const factory _RecordingSearchResultEntity(
          {required final String searchId,
          required final bool responseStatus,
          required final String responseStatusString,
          required final int numOfMatches,
          required final List<RecordingEntity> recordings}) =
      _$RecordingSearchResultEntityImpl;

  @override
  String get searchId;
  @override
  bool get responseStatus;
  @override
  String get responseStatusString;
  @override
  int get numOfMatches;
  @override
  List<RecordingEntity> get recordings;
}
