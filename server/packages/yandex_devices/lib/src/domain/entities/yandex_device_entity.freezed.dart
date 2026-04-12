// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yandex_device_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YandexDeviceEntity {
  String get id;
  String get name;
  String get type;
  List<Map<String, dynamic>> get capabilities;
  List<Map<String, dynamic>> get properties;

  /// Create a copy of YandexDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $YandexDeviceEntityCopyWith<YandexDeviceEntity> get copyWith =>
      _$YandexDeviceEntityCopyWithImpl<YandexDeviceEntity>(
          this as YandexDeviceEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YandexDeviceEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.capabilities, capabilities) &&
            const DeepCollectionEquality()
                .equals(other.properties, properties));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      const DeepCollectionEquality().hash(capabilities),
      const DeepCollectionEquality().hash(properties));

  @override
  String toString() {
    return 'YandexDeviceEntity(id: $id, name: $name, type: $type, capabilities: $capabilities, properties: $properties)';
  }
}

/// @nodoc
abstract mixin class $YandexDeviceEntityCopyWith<$Res> {
  factory $YandexDeviceEntityCopyWith(
          YandexDeviceEntity value, $Res Function(YandexDeviceEntity) _then) =
      _$YandexDeviceEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      List<Map<String, dynamic>> capabilities,
      List<Map<String, dynamic>> properties});
}

/// @nodoc
class _$YandexDeviceEntityCopyWithImpl<$Res>
    implements $YandexDeviceEntityCopyWith<$Res> {
  _$YandexDeviceEntityCopyWithImpl(this._self, this._then);

  final YandexDeviceEntity _self;
  final $Res Function(YandexDeviceEntity) _then;

  /// Create a copy of YandexDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? capabilities = null,
    Object? properties = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      capabilities: null == capabilities
          ? _self.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      properties: null == properties
          ? _self.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _YandexDeviceEntity extends YandexDeviceEntity {
  const _YandexDeviceEntity(
      {required this.id,
      required this.name,
      required this.type,
      required final List<Map<String, dynamic>> capabilities,
      required final List<Map<String, dynamic>> properties})
      : _capabilities = capabilities,
        _properties = properties,
        super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  final List<Map<String, dynamic>> _capabilities;
  @override
  List<Map<String, dynamic>> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  final List<Map<String, dynamic>> _properties;
  @override
  List<Map<String, dynamic>> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  /// Create a copy of YandexDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$YandexDeviceEntityCopyWith<_YandexDeviceEntity> get copyWith =>
      __$YandexDeviceEntityCopyWithImpl<_YandexDeviceEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YandexDeviceEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      const DeepCollectionEquality().hash(_capabilities),
      const DeepCollectionEquality().hash(_properties));

  @override
  String toString() {
    return 'YandexDeviceEntity(id: $id, name: $name, type: $type, capabilities: $capabilities, properties: $properties)';
  }
}

/// @nodoc
abstract mixin class _$YandexDeviceEntityCopyWith<$Res>
    implements $YandexDeviceEntityCopyWith<$Res> {
  factory _$YandexDeviceEntityCopyWith(
          _YandexDeviceEntity value, $Res Function(_YandexDeviceEntity) _then) =
      __$YandexDeviceEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      List<Map<String, dynamic>> capabilities,
      List<Map<String, dynamic>> properties});
}

/// @nodoc
class __$YandexDeviceEntityCopyWithImpl<$Res>
    implements _$YandexDeviceEntityCopyWith<$Res> {
  __$YandexDeviceEntityCopyWithImpl(this._self, this._then);

  final _YandexDeviceEntity _self;
  final $Res Function(_YandexDeviceEntity) _then;

  /// Create a copy of YandexDeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? capabilities = null,
    Object? properties = null,
  }) {
    return _then(_YandexDeviceEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      capabilities: null == capabilities
          ? _self._capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      properties: null == properties
          ? _self._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

// dart format on
