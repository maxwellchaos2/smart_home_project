// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  String? get message => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownFailure value) unknown,
    required TResult Function(_ApiFailure value) api,
    required TResult Function(_LocalStorageFailure value) localStorage,
    required TResult Function(_PlatfromFailure value) platform,
    required TResult Function(_NoInternetFailure value) noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownFailure value)? unknown,
    TResult? Function(_ApiFailure value)? api,
    TResult? Function(_LocalStorageFailure value)? localStorage,
    TResult? Function(_PlatfromFailure value)? platform,
    TResult? Function(_NoInternetFailure value)? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownFailure value)? unknown,
    TResult Function(_ApiFailure value)? api,
    TResult Function(_LocalStorageFailure value)? localStorage,
    TResult Function(_PlatfromFailure value)? platform,
    TResult Function(_NoInternetFailure value)? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$UnknownFailureImpl extends _UnknownFailure {
  const _$UnknownFailureImpl(
      {this.message = "Unknown error", this.code = 'unknown'})
      : super._();

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownFailure value) unknown,
    required TResult Function(_ApiFailure value) api,
    required TResult Function(_LocalStorageFailure value) localStorage,
    required TResult Function(_PlatfromFailure value) platform,
    required TResult Function(_NoInternetFailure value) noInternet,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownFailure value)? unknown,
    TResult? Function(_ApiFailure value)? api,
    TResult? Function(_LocalStorageFailure value)? localStorage,
    TResult? Function(_PlatfromFailure value)? platform,
    TResult? Function(_NoInternetFailure value)? noInternet,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownFailure value)? unknown,
    TResult Function(_ApiFailure value)? api,
    TResult Function(_LocalStorageFailure value)? localStorage,
    TResult Function(_PlatfromFailure value)? platform,
    TResult Function(_NoInternetFailure value)? noInternet,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _UnknownFailure extends Failure {
  const factory _UnknownFailure({final String message, final String code}) =
      _$UnknownFailureImpl;
  const _UnknownFailure._() : super._();

  @override
  String get message;
  @override
  String get code;
}

/// @nodoc

class _$ApiFailureImpl extends _ApiFailure {
  const _$ApiFailureImpl({this.message, this.code = 'api-error'}) : super._();

  @override
  final String? message;
  @override
  @JsonKey()
  final String code;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownFailure value) unknown,
    required TResult Function(_ApiFailure value) api,
    required TResult Function(_LocalStorageFailure value) localStorage,
    required TResult Function(_PlatfromFailure value) platform,
    required TResult Function(_NoInternetFailure value) noInternet,
  }) {
    return api(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownFailure value)? unknown,
    TResult? Function(_ApiFailure value)? api,
    TResult? Function(_LocalStorageFailure value)? localStorage,
    TResult? Function(_PlatfromFailure value)? platform,
    TResult? Function(_NoInternetFailure value)? noInternet,
  }) {
    return api?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownFailure value)? unknown,
    TResult Function(_ApiFailure value)? api,
    TResult Function(_LocalStorageFailure value)? localStorage,
    TResult Function(_PlatfromFailure value)? platform,
    TResult Function(_NoInternetFailure value)? noInternet,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(this);
    }
    return orElse();
  }
}

abstract class _ApiFailure extends Failure {
  const factory _ApiFailure({final String? message, final String code}) =
      _$ApiFailureImpl;
  const _ApiFailure._() : super._();

  @override
  String? get message;
  @override
  String get code;
}

/// @nodoc

class _$LocalStorageFailureImpl extends _LocalStorageFailure {
  const _$LocalStorageFailureImpl(
      {this.message, this.code = 'locale-storage-error'})
      : super._();

  @override
  final String? message;
  @override
  @JsonKey()
  final String code;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalStorageFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownFailure value) unknown,
    required TResult Function(_ApiFailure value) api,
    required TResult Function(_LocalStorageFailure value) localStorage,
    required TResult Function(_PlatfromFailure value) platform,
    required TResult Function(_NoInternetFailure value) noInternet,
  }) {
    return localStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownFailure value)? unknown,
    TResult? Function(_ApiFailure value)? api,
    TResult? Function(_LocalStorageFailure value)? localStorage,
    TResult? Function(_PlatfromFailure value)? platform,
    TResult? Function(_NoInternetFailure value)? noInternet,
  }) {
    return localStorage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownFailure value)? unknown,
    TResult Function(_ApiFailure value)? api,
    TResult Function(_LocalStorageFailure value)? localStorage,
    TResult Function(_PlatfromFailure value)? platform,
    TResult Function(_NoInternetFailure value)? noInternet,
    required TResult orElse(),
  }) {
    if (localStorage != null) {
      return localStorage(this);
    }
    return orElse();
  }
}

abstract class _LocalStorageFailure extends Failure {
  const factory _LocalStorageFailure(
      {final String? message, final String code}) = _$LocalStorageFailureImpl;
  const _LocalStorageFailure._() : super._();

  @override
  String? get message;
  @override
  String get code;
}

/// @nodoc

class _$PlatfromFailureImpl extends _PlatfromFailure {
  const _$PlatfromFailureImpl({this.message, this.code = 'platform-error'})
      : super._();

  @override
  final String? message;
  @override
  @JsonKey()
  final String code;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlatfromFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownFailure value) unknown,
    required TResult Function(_ApiFailure value) api,
    required TResult Function(_LocalStorageFailure value) localStorage,
    required TResult Function(_PlatfromFailure value) platform,
    required TResult Function(_NoInternetFailure value) noInternet,
  }) {
    return platform(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownFailure value)? unknown,
    TResult? Function(_ApiFailure value)? api,
    TResult? Function(_LocalStorageFailure value)? localStorage,
    TResult? Function(_PlatfromFailure value)? platform,
    TResult? Function(_NoInternetFailure value)? noInternet,
  }) {
    return platform?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownFailure value)? unknown,
    TResult Function(_ApiFailure value)? api,
    TResult Function(_LocalStorageFailure value)? localStorage,
    TResult Function(_PlatfromFailure value)? platform,
    TResult Function(_NoInternetFailure value)? noInternet,
    required TResult orElse(),
  }) {
    if (platform != null) {
      return platform(this);
    }
    return orElse();
  }
}

abstract class _PlatfromFailure extends Failure {
  const factory _PlatfromFailure({final String? message, final String code}) =
      _$PlatfromFailureImpl;
  const _PlatfromFailure._() : super._();

  @override
  String? get message;
  @override
  String get code;
}

/// @nodoc

class _$NoInternetFailureImpl extends _NoInternetFailure {
  const _$NoInternetFailureImpl(
      {this.message = 'No internet connection', this.code = 'no-internet'})
      : super._();

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final String code;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoInternetFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UnknownFailure value) unknown,
    required TResult Function(_ApiFailure value) api,
    required TResult Function(_LocalStorageFailure value) localStorage,
    required TResult Function(_PlatfromFailure value) platform,
    required TResult Function(_NoInternetFailure value) noInternet,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UnknownFailure value)? unknown,
    TResult? Function(_ApiFailure value)? api,
    TResult? Function(_LocalStorageFailure value)? localStorage,
    TResult? Function(_PlatfromFailure value)? platform,
    TResult? Function(_NoInternetFailure value)? noInternet,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UnknownFailure value)? unknown,
    TResult Function(_ApiFailure value)? api,
    TResult Function(_LocalStorageFailure value)? localStorage,
    TResult Function(_PlatfromFailure value)? platform,
    TResult Function(_NoInternetFailure value)? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class _NoInternetFailure extends Failure {
  const factory _NoInternetFailure({final String message, final String code}) =
      _$NoInternetFailureImpl;
  const _NoInternetFailure._() : super._();

  @override
  String get message;
  @override
  String get code;
}
