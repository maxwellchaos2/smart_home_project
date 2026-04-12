// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_scenario_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceScenarioModel _$DeviceScenarioModelFromJson(Map<String, dynamic> json) {
  return _DeviceScenarioModel.fromJson(json);
}

/// @nodoc
mixin _$DeviceScenarioModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromStringConditionModel)
  ConditionModel get condition => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromStringActionModel)
  List<ActionModel> get actions => throw _privateConstructorUsedError;
  int get projectId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: fromJsonDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DeviceScenarioModelImpl extends _DeviceScenarioModel {
  const _$DeviceScenarioModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(fromJson: fromStringConditionModel) required this.condition,
      @JsonKey(fromJson: fromStringActionModel)
      required final List<ActionModel> actions,
      required this.projectId,
      @JsonKey(fromJson: fromJsonDateTime) required this.createdAt,
      @JsonKey(fromJson: fromJsonDateTime) required this.updatedAt})
      : _actions = actions,
        super._();

  factory _$DeviceScenarioModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceScenarioModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(fromJson: fromStringConditionModel)
  final ConditionModel condition;
  final List<ActionModel> _actions;
  @override
  @JsonKey(fromJson: fromStringActionModel)
  List<ActionModel> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  final int projectId;
  @override
  @JsonKey(fromJson: fromJsonDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: fromJsonDateTime)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DeviceScenarioModel(id: $id, name: $name, condition: $condition, actions: $actions, projectId: $projectId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceScenarioModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      condition,
      const DeepCollectionEquality().hash(_actions),
      projectId,
      createdAt,
      updatedAt);
}

abstract class _DeviceScenarioModel extends DeviceScenarioModel {
  const factory _DeviceScenarioModel(
      {required final int id,
      required final String name,
      @JsonKey(fromJson: fromStringConditionModel)
      required final ConditionModel condition,
      @JsonKey(fromJson: fromStringActionModel)
      required final List<ActionModel> actions,
      required final int projectId,
      @JsonKey(fromJson: fromJsonDateTime) required final DateTime createdAt,
      @JsonKey(fromJson: fromJsonDateTime)
      required final DateTime updatedAt}) = _$DeviceScenarioModelImpl;
  const _DeviceScenarioModel._() : super._();

  factory _DeviceScenarioModel.fromJson(Map<String, dynamic> json) =
      _$DeviceScenarioModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(fromJson: fromStringConditionModel)
  ConditionModel get condition;
  @override
  @JsonKey(fromJson: fromStringActionModel)
  List<ActionModel> get actions;
  @override
  int get projectId;
  @override
  @JsonKey(fromJson: fromJsonDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: fromJsonDateTime)
  DateTime get updatedAt;
}
