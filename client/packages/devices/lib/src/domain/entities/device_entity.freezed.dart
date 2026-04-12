// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceEntity {
  int get id => throw _privateConstructorUsedError;
  String? get providerDeviceId => throw _privateConstructorUsedError;
  DeviceProviderType get providerType => throw _privateConstructorUsedError;
  DeviceType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  List<DeviceCapabilityEntity> get capabilities =>
      throw _privateConstructorUsedError;
  List<DevicePropertyEntity> get properties =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int? get roomId => throw _privateConstructorUsedError;
  int? get floorId => throw _privateConstructorUsedError;
  int get projectId => throw _privateConstructorUsedError;
  Map<String, Object?>? get customData => throw _privateConstructorUsedError;
  DeviceStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of DeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceEntityCopyWith<DeviceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceEntityCopyWith<$Res> {
  factory $DeviceEntityCopyWith(
          DeviceEntity value, $Res Function(DeviceEntity) then) =
      _$DeviceEntityCopyWithImpl<$Res, DeviceEntity>;
  @useResult
  $Res call(
      {int id,
      String? providerDeviceId,
      DeviceProviderType providerType,
      DeviceType type,
      String name,
      bool isHidden,
      List<DeviceCapabilityEntity> capabilities,
      List<DevicePropertyEntity> properties,
      DateTime createdAt,
      DateTime updatedAt,
      int? roomId,
      int? floorId,
      int projectId,
      Map<String, Object?>? customData,
      DeviceStatus status});
}

/// @nodoc
class _$DeviceEntityCopyWithImpl<$Res, $Val extends DeviceEntity>
    implements $DeviceEntityCopyWith<$Res> {
  _$DeviceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? providerDeviceId = freezed,
    Object? providerType = null,
    Object? type = null,
    Object? name = null,
    Object? isHidden = null,
    Object? capabilities = null,
    Object? properties = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? roomId = freezed,
    Object? floorId = freezed,
    Object? projectId = null,
    Object? customData = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      providerDeviceId: freezed == providerDeviceId
          ? _value.providerDeviceId
          : providerDeviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerType: null == providerType
          ? _value.providerType
          : providerType // ignore: cast_nullable_to_non_nullable
              as DeviceProviderType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      capabilities: null == capabilities
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<DeviceCapabilityEntity>,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<DevicePropertyEntity>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      roomId: freezed == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
      floorId: freezed == floorId
          ? _value.floorId
          : floorId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      customData: freezed == customData
          ? _value.customData
          : customData // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeviceStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceEntityImplCopyWith<$Res>
    implements $DeviceEntityCopyWith<$Res> {
  factory _$$DeviceEntityImplCopyWith(
          _$DeviceEntityImpl value, $Res Function(_$DeviceEntityImpl) then) =
      __$$DeviceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? providerDeviceId,
      DeviceProviderType providerType,
      DeviceType type,
      String name,
      bool isHidden,
      List<DeviceCapabilityEntity> capabilities,
      List<DevicePropertyEntity> properties,
      DateTime createdAt,
      DateTime updatedAt,
      int? roomId,
      int? floorId,
      int projectId,
      Map<String, Object?>? customData,
      DeviceStatus status});
}

/// @nodoc
class __$$DeviceEntityImplCopyWithImpl<$Res>
    extends _$DeviceEntityCopyWithImpl<$Res, _$DeviceEntityImpl>
    implements _$$DeviceEntityImplCopyWith<$Res> {
  __$$DeviceEntityImplCopyWithImpl(
      _$DeviceEntityImpl _value, $Res Function(_$DeviceEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? providerDeviceId = freezed,
    Object? providerType = null,
    Object? type = null,
    Object? name = null,
    Object? isHidden = null,
    Object? capabilities = null,
    Object? properties = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? roomId = freezed,
    Object? floorId = freezed,
    Object? projectId = null,
    Object? customData = freezed,
    Object? status = null,
  }) {
    return _then(_$DeviceEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      providerDeviceId: freezed == providerDeviceId
          ? _value.providerDeviceId
          : providerDeviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerType: null == providerType
          ? _value.providerType
          : providerType // ignore: cast_nullable_to_non_nullable
              as DeviceProviderType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      capabilities: null == capabilities
          ? _value._capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<DeviceCapabilityEntity>,
      properties: null == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<DevicePropertyEntity>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      roomId: freezed == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int?,
      floorId: freezed == floorId
          ? _value.floorId
          : floorId // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int,
      customData: freezed == customData
          ? _value._customData
          : customData // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DeviceStatus,
    ));
  }
}

/// @nodoc

class _$DeviceEntityImpl extends _DeviceEntity {
  const _$DeviceEntityImpl(
      {required this.id,
      required this.providerDeviceId,
      required this.providerType,
      required this.type,
      required this.name,
      required this.isHidden,
      required final List<DeviceCapabilityEntity> capabilities,
      required final List<DevicePropertyEntity> properties,
      required this.createdAt,
      required this.updatedAt,
      required this.roomId,
      required this.floorId,
      required this.projectId,
      required final Map<String, Object?>? customData,
      required this.status})
      : _capabilities = capabilities,
        _properties = properties,
        _customData = customData,
        super._();

  @override
  final int id;
  @override
  final String? providerDeviceId;
  @override
  final DeviceProviderType providerType;
  @override
  final DeviceType type;
  @override
  final String name;
  @override
  final bool isHidden;
  final List<DeviceCapabilityEntity> _capabilities;
  @override
  List<DeviceCapabilityEntity> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  final List<DevicePropertyEntity> _properties;
  @override
  List<DevicePropertyEntity> get properties {
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_properties);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int? roomId;
  @override
  final int? floorId;
  @override
  final int projectId;
  final Map<String, Object?>? _customData;
  @override
  Map<String, Object?>? get customData {
    final value = _customData;
    if (value == null) return null;
    if (_customData is EqualUnmodifiableMapView) return _customData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DeviceStatus status;

  @override
  String toString() {
    return 'DeviceEntity(id: $id, providerDeviceId: $providerDeviceId, providerType: $providerType, type: $type, name: $name, isHidden: $isHidden, capabilities: $capabilities, properties: $properties, createdAt: $createdAt, updatedAt: $updatedAt, roomId: $roomId, floorId: $floorId, projectId: $projectId, customData: $customData, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.providerDeviceId, providerDeviceId) ||
                other.providerDeviceId == providerDeviceId) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.floorId, floorId) || other.floorId == floorId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality()
                .equals(other._customData, _customData) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      providerDeviceId,
      providerType,
      type,
      name,
      isHidden,
      const DeepCollectionEquality().hash(_capabilities),
      const DeepCollectionEquality().hash(_properties),
      createdAt,
      updatedAt,
      roomId,
      floorId,
      projectId,
      const DeepCollectionEquality().hash(_customData),
      status);

  /// Create a copy of DeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceEntityImplCopyWith<_$DeviceEntityImpl> get copyWith =>
      __$$DeviceEntityImplCopyWithImpl<_$DeviceEntityImpl>(this, _$identity);
}

abstract class _DeviceEntity extends DeviceEntity {
  const factory _DeviceEntity(
      {required final int id,
      required final String? providerDeviceId,
      required final DeviceProviderType providerType,
      required final DeviceType type,
      required final String name,
      required final bool isHidden,
      required final List<DeviceCapabilityEntity> capabilities,
      required final List<DevicePropertyEntity> properties,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final int? roomId,
      required final int? floorId,
      required final int projectId,
      required final Map<String, Object?>? customData,
      required final DeviceStatus status}) = _$DeviceEntityImpl;
  const _DeviceEntity._() : super._();

  @override
  int get id;
  @override
  String? get providerDeviceId;
  @override
  DeviceProviderType get providerType;
  @override
  DeviceType get type;
  @override
  String get name;
  @override
  bool get isHidden;
  @override
  List<DeviceCapabilityEntity> get capabilities;
  @override
  List<DevicePropertyEntity> get properties;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int? get roomId;
  @override
  int? get floorId;
  @override
  int get projectId;
  @override
  Map<String, Object?>? get customData;
  @override
  DeviceStatus get status;

  /// Create a copy of DeviceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceEntityImplCopyWith<_$DeviceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
