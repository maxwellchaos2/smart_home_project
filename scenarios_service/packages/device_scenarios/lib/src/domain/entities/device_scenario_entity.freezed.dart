// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_scenario_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceScenarioEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ConditionEntity get condition => throw _privateConstructorUsedError;
  List<ActionEntity> get actions => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceScenarioEntityCopyWith<DeviceScenarioEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceScenarioEntityCopyWith<$Res> {
  factory $DeviceScenarioEntityCopyWith(DeviceScenarioEntity value,
          $Res Function(DeviceScenarioEntity) then) =
      _$DeviceScenarioEntityCopyWithImpl<$Res, DeviceScenarioEntity>;
  @useResult
  $Res call(
      {int id,
      String name,
      ConditionEntity condition,
      List<ActionEntity> actions,
      DateTime createdAt,
      DateTime updatedAt});

  $ConditionEntityCopyWith<$Res> get condition;
}

/// @nodoc
class _$DeviceScenarioEntityCopyWithImpl<$Res,
        $Val extends DeviceScenarioEntity>
    implements $DeviceScenarioEntityCopyWith<$Res> {
  _$DeviceScenarioEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? condition = null,
    Object? actions = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as ConditionEntity,
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<ActionEntity>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConditionEntityCopyWith<$Res> get condition {
    return $ConditionEntityCopyWith<$Res>(_value.condition, (value) {
      return _then(_value.copyWith(condition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeviceScenarioEntityImplCopyWith<$Res>
    implements $DeviceScenarioEntityCopyWith<$Res> {
  factory _$$DeviceScenarioEntityImplCopyWith(_$DeviceScenarioEntityImpl value,
          $Res Function(_$DeviceScenarioEntityImpl) then) =
      __$$DeviceScenarioEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      ConditionEntity condition,
      List<ActionEntity> actions,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $ConditionEntityCopyWith<$Res> get condition;
}

/// @nodoc
class __$$DeviceScenarioEntityImplCopyWithImpl<$Res>
    extends _$DeviceScenarioEntityCopyWithImpl<$Res, _$DeviceScenarioEntityImpl>
    implements _$$DeviceScenarioEntityImplCopyWith<$Res> {
  __$$DeviceScenarioEntityImplCopyWithImpl(_$DeviceScenarioEntityImpl _value,
      $Res Function(_$DeviceScenarioEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? condition = null,
    Object? actions = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DeviceScenarioEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as ConditionEntity,
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<ActionEntity>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DeviceScenarioEntityImpl extends _DeviceScenarioEntity {
  const _$DeviceScenarioEntityImpl(
      {required this.id,
      required this.name,
      required this.condition,
      required final List<ActionEntity> actions,
      required this.createdAt,
      required this.updatedAt})
      : _actions = actions,
        super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final ConditionEntity condition;
  final List<ActionEntity> _actions;
  @override
  List<ActionEntity> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DeviceScenarioEntity(id: $id, name: $name, condition: $condition, actions: $actions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceScenarioEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, condition,
      const DeepCollectionEquality().hash(_actions), createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceScenarioEntityImplCopyWith<_$DeviceScenarioEntityImpl>
      get copyWith =>
          __$$DeviceScenarioEntityImplCopyWithImpl<_$DeviceScenarioEntityImpl>(
              this, _$identity);
}

abstract class _DeviceScenarioEntity extends DeviceScenarioEntity {
  const factory _DeviceScenarioEntity(
      {required final int id,
      required final String name,
      required final ConditionEntity condition,
      required final List<ActionEntity> actions,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$DeviceScenarioEntityImpl;
  const _DeviceScenarioEntity._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  ConditionEntity get condition;
  @override
  List<ActionEntity> get actions;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DeviceScenarioEntityImplCopyWith<_$DeviceScenarioEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
