// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_zigbee_devices_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchZigbeeDevicesEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Found value) $found,
    required TResult Function(_StartSearchZigbeeDevices value)
        startSearchZigbeeDevices,
    required TResult Function(_TimeoutEvent value) $timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Found value)? $found,
    TResult? Function(_StartSearchZigbeeDevices value)?
        startSearchZigbeeDevices,
    TResult? Function(_TimeoutEvent value)? $timeout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Found value)? $found,
    TResult Function(_StartSearchZigbeeDevices value)? startSearchZigbeeDevices,
    TResult Function(_TimeoutEvent value)? $timeout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

@visibleForTesting
class _$FoundImpl implements _Found {
  const _$FoundImpl({required this.device});

  @override
  final ZigbeeDeviceEntity device;

  @override
  String toString() {
    return 'SearchZigbeeDevicesEvent.\$found(device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoundImpl &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Found value) $found,
    required TResult Function(_StartSearchZigbeeDevices value)
        startSearchZigbeeDevices,
    required TResult Function(_TimeoutEvent value) $timeout,
  }) {
    return $found(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Found value)? $found,
    TResult? Function(_StartSearchZigbeeDevices value)?
        startSearchZigbeeDevices,
    TResult? Function(_TimeoutEvent value)? $timeout,
  }) {
    return $found?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Found value)? $found,
    TResult Function(_StartSearchZigbeeDevices value)? startSearchZigbeeDevices,
    TResult Function(_TimeoutEvent value)? $timeout,
    required TResult orElse(),
  }) {
    if ($found != null) {
      return $found(this);
    }
    return orElse();
  }
}

abstract class _Found implements SearchZigbeeDevicesEvent {
  const factory _Found({required final ZigbeeDeviceEntity device}) =
      _$FoundImpl;

  ZigbeeDeviceEntity get device;
}

/// @nodoc

class _$StartSearchZigbeeDevicesImpl implements _StartSearchZigbeeDevices {
  const _$StartSearchZigbeeDevicesImpl();

  @override
  String toString() {
    return 'SearchZigbeeDevicesEvent.startSearchZigbeeDevices()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartSearchZigbeeDevicesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Found value) $found,
    required TResult Function(_StartSearchZigbeeDevices value)
        startSearchZigbeeDevices,
    required TResult Function(_TimeoutEvent value) $timeout,
  }) {
    return startSearchZigbeeDevices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Found value)? $found,
    TResult? Function(_StartSearchZigbeeDevices value)?
        startSearchZigbeeDevices,
    TResult? Function(_TimeoutEvent value)? $timeout,
  }) {
    return startSearchZigbeeDevices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Found value)? $found,
    TResult Function(_StartSearchZigbeeDevices value)? startSearchZigbeeDevices,
    TResult Function(_TimeoutEvent value)? $timeout,
    required TResult orElse(),
  }) {
    if (startSearchZigbeeDevices != null) {
      return startSearchZigbeeDevices(this);
    }
    return orElse();
  }
}

abstract class _StartSearchZigbeeDevices implements SearchZigbeeDevicesEvent {
  const factory _StartSearchZigbeeDevices() = _$StartSearchZigbeeDevicesImpl;
}

/// @nodoc

@visibleForTesting
class _$TimeoutEventImpl implements _TimeoutEvent {
  const _$TimeoutEventImpl();

  @override
  String toString() {
    return 'SearchZigbeeDevicesEvent.\$timeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimeoutEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Found value) $found,
    required TResult Function(_StartSearchZigbeeDevices value)
        startSearchZigbeeDevices,
    required TResult Function(_TimeoutEvent value) $timeout,
  }) {
    return $timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Found value)? $found,
    TResult? Function(_StartSearchZigbeeDevices value)?
        startSearchZigbeeDevices,
    TResult? Function(_TimeoutEvent value)? $timeout,
  }) {
    return $timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Found value)? $found,
    TResult Function(_StartSearchZigbeeDevices value)? startSearchZigbeeDevices,
    TResult Function(_TimeoutEvent value)? $timeout,
    required TResult orElse(),
  }) {
    if ($timeout != null) {
      return $timeout(this);
    }
    return orElse();
  }
}

abstract class _TimeoutEvent implements SearchZigbeeDevicesEvent {
  const factory _TimeoutEvent() = _$TimeoutEventImpl;
}

/// @nodoc
mixin _$SearchZigbeeDevicesState {
  ZigbeeDeviceEntity? get data => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl({this.data}) : super._();

  @override
  final ZigbeeDeviceEntity? data;

  @override
  String toString() {
    return 'SearchZigbeeDevicesState.loading(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends SearchZigbeeDevicesState {
  const factory _Loading({final ZigbeeDeviceEntity? data}) = _$LoadingImpl;
  const _Loading._() : super._();

  @override
  ZigbeeDeviceEntity? get data;
}

/// @nodoc

class _$TimeoutImpl extends _Timeout {
  const _$TimeoutImpl({this.data}) : super._();

  @override
  final ZigbeeDeviceEntity? data;

  @override
  String toString() {
    return 'SearchZigbeeDevicesState.timeout(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeoutImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Success value) success,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Success value)? success,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class _Timeout extends SearchZigbeeDevicesState {
  const factory _Timeout({final ZigbeeDeviceEntity? data}) = _$TimeoutImpl;
  const _Timeout._() : super._();

  @override
  ZigbeeDeviceEntity? get data;
}

/// @nodoc

class _$SuccessImpl extends _Success {
  const _$SuccessImpl({required this.data}) : super._();

  @override
  final ZigbeeDeviceEntity data;

  @override
  String toString() {
    return 'SearchZigbeeDevicesState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success extends SearchZigbeeDevicesState {
  const factory _Success({required final ZigbeeDeviceEntity data}) =
      _$SuccessImpl;
  const _Success._() : super._();

  @override
  ZigbeeDeviceEntity get data;
}
