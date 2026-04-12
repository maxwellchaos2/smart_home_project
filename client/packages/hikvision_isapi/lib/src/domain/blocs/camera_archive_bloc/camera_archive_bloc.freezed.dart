// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_archive_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraArchiveEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchRecordings value) searchRecordings,
    required TResult Function(_SelectTime value) selectTime,
    required TResult Function(_UpdatePlaybackPosition value)
        updatePlaybackPosition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchRecordings value)? searchRecordings,
    TResult? Function(_SelectTime value)? selectTime,
    TResult? Function(_UpdatePlaybackPosition value)? updatePlaybackPosition,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchRecordings value)? searchRecordings,
    TResult Function(_SelectTime value)? selectTime,
    TResult Function(_UpdatePlaybackPosition value)? updatePlaybackPosition,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$SearchRecordingsImpl implements _SearchRecordings {
  const _$SearchRecordingsImpl({required this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'CameraArchiveEvent.searchRecordings(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchRecordingsImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchRecordings value) searchRecordings,
    required TResult Function(_SelectTime value) selectTime,
    required TResult Function(_UpdatePlaybackPosition value)
        updatePlaybackPosition,
  }) {
    return searchRecordings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchRecordings value)? searchRecordings,
    TResult? Function(_SelectTime value)? selectTime,
    TResult? Function(_UpdatePlaybackPosition value)? updatePlaybackPosition,
  }) {
    return searchRecordings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchRecordings value)? searchRecordings,
    TResult Function(_SelectTime value)? selectTime,
    TResult Function(_UpdatePlaybackPosition value)? updatePlaybackPosition,
    required TResult orElse(),
  }) {
    if (searchRecordings != null) {
      return searchRecordings(this);
    }
    return orElse();
  }
}

abstract class _SearchRecordings implements CameraArchiveEvent {
  const factory _SearchRecordings({required final DateTime date}) =
      _$SearchRecordingsImpl;

  DateTime get date;
}

/// @nodoc

class _$SelectTimeImpl implements _SelectTime {
  const _$SelectTimeImpl({required this.time});

  @override
  final TimeOfDay time;

  @override
  String toString() {
    return 'CameraArchiveEvent.selectTime(time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectTimeImpl &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchRecordings value) searchRecordings,
    required TResult Function(_SelectTime value) selectTime,
    required TResult Function(_UpdatePlaybackPosition value)
        updatePlaybackPosition,
  }) {
    return selectTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchRecordings value)? searchRecordings,
    TResult? Function(_SelectTime value)? selectTime,
    TResult? Function(_UpdatePlaybackPosition value)? updatePlaybackPosition,
  }) {
    return selectTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchRecordings value)? searchRecordings,
    TResult Function(_SelectTime value)? selectTime,
    TResult Function(_UpdatePlaybackPosition value)? updatePlaybackPosition,
    required TResult orElse(),
  }) {
    if (selectTime != null) {
      return selectTime(this);
    }
    return orElse();
  }
}

abstract class _SelectTime implements CameraArchiveEvent {
  const factory _SelectTime({required final TimeOfDay time}) = _$SelectTimeImpl;

  TimeOfDay get time;
}

/// @nodoc

class _$UpdatePlaybackPositionImpl implements _UpdatePlaybackPosition {
  const _$UpdatePlaybackPositionImpl({required this.position});

  @override
  final Duration position;

  @override
  String toString() {
    return 'CameraArchiveEvent.updatePlaybackPosition(position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePlaybackPositionImpl &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchRecordings value) searchRecordings,
    required TResult Function(_SelectTime value) selectTime,
    required TResult Function(_UpdatePlaybackPosition value)
        updatePlaybackPosition,
  }) {
    return updatePlaybackPosition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchRecordings value)? searchRecordings,
    TResult? Function(_SelectTime value)? selectTime,
    TResult? Function(_UpdatePlaybackPosition value)? updatePlaybackPosition,
  }) {
    return updatePlaybackPosition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchRecordings value)? searchRecordings,
    TResult Function(_SelectTime value)? selectTime,
    TResult Function(_UpdatePlaybackPosition value)? updatePlaybackPosition,
    required TResult orElse(),
  }) {
    if (updatePlaybackPosition != null) {
      return updatePlaybackPosition(this);
    }
    return orElse();
  }
}

abstract class _UpdatePlaybackPosition implements CameraArchiveEvent {
  const factory _UpdatePlaybackPosition({required final Duration position}) =
      _$UpdatePlaybackPositionImpl;

  Duration get position;
}

/// @nodoc
mixin _$CameraArchiveState {
  List<RecordingEntity>? get data => throw _privateConstructorUsedError;
  RecordingEntity? get currentRecording => throw _privateConstructorUsedError;
  String? get currentPlaybackUrl => throw _privateConstructorUsedError;
  TimeOfDay get selectedTime => throw _privateConstructorUsedError;
  DateTime? get playbackStartTime => throw _privateConstructorUsedError;
  DateTime? get currentPlaybackTime => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<RecordingEntity>? data,
      this.currentRecording,
      this.currentPlaybackUrl,
      this.selectedTime = const TimeOfDay(hour: 0, minute: 0),
      this.playbackStartTime,
      this.currentPlaybackTime})
      : _data = data;

  final List<RecordingEntity>? _data;
  @override
  List<RecordingEntity>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final RecordingEntity? currentRecording;
  @override
  final String? currentPlaybackUrl;
  @override
  @JsonKey()
  final TimeOfDay selectedTime;
  @override
  final DateTime? playbackStartTime;
  @override
  final DateTime? currentPlaybackTime;

  @override
  String toString() {
    return 'CameraArchiveState.initial(data: $data, currentRecording: $currentRecording, currentPlaybackUrl: $currentPlaybackUrl, selectedTime: $selectedTime, playbackStartTime: $playbackStartTime, currentPlaybackTime: $currentPlaybackTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.currentRecording, currentRecording) ||
                other.currentRecording == currentRecording) &&
            (identical(other.currentPlaybackUrl, currentPlaybackUrl) ||
                other.currentPlaybackUrl == currentPlaybackUrl) &&
            (identical(other.selectedTime, selectedTime) ||
                other.selectedTime == selectedTime) &&
            (identical(other.playbackStartTime, playbackStartTime) ||
                other.playbackStartTime == playbackStartTime) &&
            (identical(other.currentPlaybackTime, currentPlaybackTime) ||
                other.currentPlaybackTime == currentPlaybackTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      currentRecording,
      currentPlaybackUrl,
      selectedTime,
      playbackStartTime,
      currentPlaybackTime);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CameraArchiveState {
  const factory _Initial(
      {final List<RecordingEntity>? data,
      final RecordingEntity? currentRecording,
      final String? currentPlaybackUrl,
      final TimeOfDay selectedTime,
      final DateTime? playbackStartTime,
      final DateTime? currentPlaybackTime}) = _$InitialImpl;

  @override
  List<RecordingEntity>? get data;
  @override
  RecordingEntity? get currentRecording;
  @override
  String? get currentPlaybackUrl;
  @override
  TimeOfDay get selectedTime;
  @override
  DateTime? get playbackStartTime;
  @override
  DateTime? get currentPlaybackTime;
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(
      {final List<RecordingEntity>? data,
      this.currentRecording,
      this.currentPlaybackUrl,
      this.selectedTime = const TimeOfDay(hour: 0, minute: 0),
      this.playbackStartTime,
      this.currentPlaybackTime})
      : _data = data;

  final List<RecordingEntity>? _data;
  @override
  List<RecordingEntity>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final RecordingEntity? currentRecording;
  @override
  final String? currentPlaybackUrl;
  @override
  @JsonKey()
  final TimeOfDay selectedTime;
  @override
  final DateTime? playbackStartTime;
  @override
  final DateTime? currentPlaybackTime;

  @override
  String toString() {
    return 'CameraArchiveState.loading(data: $data, currentRecording: $currentRecording, currentPlaybackUrl: $currentPlaybackUrl, selectedTime: $selectedTime, playbackStartTime: $playbackStartTime, currentPlaybackTime: $currentPlaybackTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.currentRecording, currentRecording) ||
                other.currentRecording == currentRecording) &&
            (identical(other.currentPlaybackUrl, currentPlaybackUrl) ||
                other.currentPlaybackUrl == currentPlaybackUrl) &&
            (identical(other.selectedTime, selectedTime) ||
                other.selectedTime == selectedTime) &&
            (identical(other.playbackStartTime, playbackStartTime) ||
                other.playbackStartTime == playbackStartTime) &&
            (identical(other.currentPlaybackTime, currentPlaybackTime) ||
                other.currentPlaybackTime == currentPlaybackTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      currentRecording,
      currentPlaybackUrl,
      selectedTime,
      playbackStartTime,
      currentPlaybackTime);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CameraArchiveState {
  const factory _Loading(
      {final List<RecordingEntity>? data,
      final RecordingEntity? currentRecording,
      final String? currentPlaybackUrl,
      final TimeOfDay selectedTime,
      final DateTime? playbackStartTime,
      final DateTime? currentPlaybackTime}) = _$LoadingImpl;

  @override
  List<RecordingEntity>? get data;
  @override
  RecordingEntity? get currentRecording;
  @override
  String? get currentPlaybackUrl;
  @override
  TimeOfDay get selectedTime;
  @override
  DateTime? get playbackStartTime;
  @override
  DateTime? get currentPlaybackTime;
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      {required final List<RecordingEntity> data,
      this.currentRecording,
      this.currentPlaybackUrl,
      this.selectedTime = const TimeOfDay(hour: 0, minute: 0),
      this.playbackStartTime,
      this.currentPlaybackTime})
      : _data = data;

  final List<RecordingEntity> _data;
  @override
  List<RecordingEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final RecordingEntity? currentRecording;
  @override
  final String? currentPlaybackUrl;
  @override
  @JsonKey()
  final TimeOfDay selectedTime;
  @override
  final DateTime? playbackStartTime;
  @override
  final DateTime? currentPlaybackTime;

  @override
  String toString() {
    return 'CameraArchiveState.success(data: $data, currentRecording: $currentRecording, currentPlaybackUrl: $currentPlaybackUrl, selectedTime: $selectedTime, playbackStartTime: $playbackStartTime, currentPlaybackTime: $currentPlaybackTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.currentRecording, currentRecording) ||
                other.currentRecording == currentRecording) &&
            (identical(other.currentPlaybackUrl, currentPlaybackUrl) ||
                other.currentPlaybackUrl == currentPlaybackUrl) &&
            (identical(other.selectedTime, selectedTime) ||
                other.selectedTime == selectedTime) &&
            (identical(other.playbackStartTime, playbackStartTime) ||
                other.playbackStartTime == playbackStartTime) &&
            (identical(other.currentPlaybackTime, currentPlaybackTime) ||
                other.currentPlaybackTime == currentPlaybackTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      currentRecording,
      currentPlaybackUrl,
      selectedTime,
      playbackStartTime,
      currentPlaybackTime);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CameraArchiveState {
  const factory _Success(
      {required final List<RecordingEntity> data,
      final RecordingEntity? currentRecording,
      final String? currentPlaybackUrl,
      final TimeOfDay selectedTime,
      final DateTime? playbackStartTime,
      final DateTime? currentPlaybackTime}) = _$SuccessImpl;

  @override
  List<RecordingEntity> get data;
  @override
  RecordingEntity? get currentRecording;
  @override
  String? get currentPlaybackUrl;
  @override
  TimeOfDay get selectedTime;
  @override
  DateTime? get playbackStartTime;
  @override
  DateTime? get currentPlaybackTime;
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(
      {this.failure,
      final List<RecordingEntity>? data,
      this.currentRecording,
      this.currentPlaybackUrl,
      this.selectedTime = const TimeOfDay(hour: 0, minute: 0),
      this.playbackStartTime,
      this.currentPlaybackTime})
      : _data = data;

  @override
  final Failure? failure;
  final List<RecordingEntity>? _data;
  @override
  List<RecordingEntity>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final RecordingEntity? currentRecording;
  @override
  final String? currentPlaybackUrl;
  @override
  @JsonKey()
  final TimeOfDay selectedTime;
  @override
  final DateTime? playbackStartTime;
  @override
  final DateTime? currentPlaybackTime;

  @override
  String toString() {
    return 'CameraArchiveState.failure(failure: $failure, data: $data, currentRecording: $currentRecording, currentPlaybackUrl: $currentPlaybackUrl, selectedTime: $selectedTime, playbackStartTime: $playbackStartTime, currentPlaybackTime: $currentPlaybackTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.currentRecording, currentRecording) ||
                other.currentRecording == currentRecording) &&
            (identical(other.currentPlaybackUrl, currentPlaybackUrl) ||
                other.currentPlaybackUrl == currentPlaybackUrl) &&
            (identical(other.selectedTime, selectedTime) ||
                other.selectedTime == selectedTime) &&
            (identical(other.playbackStartTime, playbackStartTime) ||
                other.playbackStartTime == playbackStartTime) &&
            (identical(other.currentPlaybackTime, currentPlaybackTime) ||
                other.currentPlaybackTime == currentPlaybackTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      failure,
      const DeepCollectionEquality().hash(_data),
      currentRecording,
      currentPlaybackUrl,
      selectedTime,
      playbackStartTime,
      currentPlaybackTime);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements CameraArchiveState {
  const factory _Failure(
      {final Failure? failure,
      final List<RecordingEntity>? data,
      final RecordingEntity? currentRecording,
      final String? currentPlaybackUrl,
      final TimeOfDay selectedTime,
      final DateTime? playbackStartTime,
      final DateTime? currentPlaybackTime}) = _$FailureImpl;

  Failure? get failure;
  @override
  List<RecordingEntity>? get data;
  @override
  RecordingEntity? get currentRecording;
  @override
  String? get currentPlaybackUrl;
  @override
  TimeOfDay get selectedTime;
  @override
  DateTime? get playbackStartTime;
  @override
  DateTime? get currentPlaybackTime;
}
