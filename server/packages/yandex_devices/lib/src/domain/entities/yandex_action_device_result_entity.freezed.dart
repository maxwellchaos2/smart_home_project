// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yandex_action_device_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YandexActionDeviceResultEntity {
  String get type;
  bool get isDone;

  /// Create a copy of YandexActionDeviceResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $YandexActionDeviceResultEntityCopyWith<YandexActionDeviceResultEntity>
      get copyWith => _$YandexActionDeviceResultEntityCopyWithImpl<
              YandexActionDeviceResultEntity>(
          this as YandexActionDeviceResultEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YandexActionDeviceResultEntity &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, isDone);

  @override
  String toString() {
    return 'YandexActionDeviceResultEntity(type: $type, isDone: $isDone)';
  }
}

/// @nodoc
abstract mixin class $YandexActionDeviceResultEntityCopyWith<$Res> {
  factory $YandexActionDeviceResultEntityCopyWith(
          YandexActionDeviceResultEntity value,
          $Res Function(YandexActionDeviceResultEntity) _then) =
      _$YandexActionDeviceResultEntityCopyWithImpl;
  @useResult
  $Res call({String type, bool isDone});
}

/// @nodoc
class _$YandexActionDeviceResultEntityCopyWithImpl<$Res>
    implements $YandexActionDeviceResultEntityCopyWith<$Res> {
  _$YandexActionDeviceResultEntityCopyWithImpl(this._self, this._then);

  final YandexActionDeviceResultEntity _self;
  final $Res Function(YandexActionDeviceResultEntity) _then;

  /// Create a copy of YandexActionDeviceResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? isDone = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _self.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _YandexActionDeviceResultEntity extends YandexActionDeviceResultEntity {
  const _YandexActionDeviceResultEntity(
      {required this.type, required this.isDone})
      : super._();

  @override
  final String type;
  @override
  final bool isDone;

  /// Create a copy of YandexActionDeviceResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$YandexActionDeviceResultEntityCopyWith<_YandexActionDeviceResultEntity>
      get copyWith => __$YandexActionDeviceResultEntityCopyWithImpl<
          _YandexActionDeviceResultEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YandexActionDeviceResultEntity &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, isDone);

  @override
  String toString() {
    return 'YandexActionDeviceResultEntity(type: $type, isDone: $isDone)';
  }
}

/// @nodoc
abstract mixin class _$YandexActionDeviceResultEntityCopyWith<$Res>
    implements $YandexActionDeviceResultEntityCopyWith<$Res> {
  factory _$YandexActionDeviceResultEntityCopyWith(
          _YandexActionDeviceResultEntity value,
          $Res Function(_YandexActionDeviceResultEntity) _then) =
      __$YandexActionDeviceResultEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String type, bool isDone});
}

/// @nodoc
class __$YandexActionDeviceResultEntityCopyWithImpl<$Res>
    implements _$YandexActionDeviceResultEntityCopyWith<$Res> {
  __$YandexActionDeviceResultEntityCopyWithImpl(this._self, this._then);

  final _YandexActionDeviceResultEntity _self;
  final $Res Function(_YandexActionDeviceResultEntity) _then;

  /// Create a copy of YandexActionDeviceResultEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? isDone = null,
  }) {
    return _then(_YandexActionDeviceResultEntity(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _self.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
