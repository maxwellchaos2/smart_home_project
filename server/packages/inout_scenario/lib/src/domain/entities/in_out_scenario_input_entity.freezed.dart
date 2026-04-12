// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'in_out_scenario_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InOutScenarioInputEntity {
  String get name => throw _privateConstructorUsedError;
  ConditionEntity get condition => throw _privateConstructorUsedError;
  List<ActionEntity> get actions => throw _privateConstructorUsedError;
  int get projectId => throw _privateConstructorUsedError;
}

/// @nodoc

class _$InOutScenarioInputEntityImpl implements _InOutScenarioInputEntity {
  const _$InOutScenarioInputEntityImpl(
      {required this.name,
      required this.condition,
      required final List<ActionEntity> actions,
      required this.projectId})
      : _actions = actions;

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
  final int projectId;

  @override
  String toString() {
    return 'InOutScenarioInputEntity(name: $name, condition: $condition, actions: $actions, projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InOutScenarioInputEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, condition,
      const DeepCollectionEquality().hash(_actions), projectId);
}

abstract class _InOutScenarioInputEntity implements InOutScenarioInputEntity {
  const factory _InOutScenarioInputEntity(
      {required final String name,
      required final ConditionEntity condition,
      required final List<ActionEntity> actions,
      required final int projectId}) = _$InOutScenarioInputEntityImpl;

  @override
  String get name;
  @override
  ConditionEntity get condition;
  @override
  List<ActionEntity> get actions;
  @override
  int get projectId;
}
