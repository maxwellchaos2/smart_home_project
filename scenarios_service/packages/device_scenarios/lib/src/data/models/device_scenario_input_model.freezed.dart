// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_scenario_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceScenarioInputModel {
  String get name => throw _privateConstructorUsedError;
  ConditionModel get condition => throw _privateConstructorUsedError;
  List<ActionModel> get actions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$DeviceScenarioInputModelImpl extends _DeviceScenarioInputModel {
  const _$DeviceScenarioInputModelImpl(
      {required this.name,
      required this.condition,
      required final List<ActionModel> actions})
      : _actions = actions,
        super._();

  @override
  final String name;
  @override
  final ConditionModel condition;
  final List<ActionModel> _actions;
  @override
  List<ActionModel> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  String toString() {
    return 'DeviceScenarioInputModel(name: $name, condition: $condition, actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceScenarioInputModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            const DeepCollectionEquality().equals(other._actions, _actions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, condition,
      const DeepCollectionEquality().hash(_actions));

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceScenarioInputModelImplToJson(
      this,
    );
  }
}

abstract class _DeviceScenarioInputModel extends DeviceScenarioInputModel {
  const factory _DeviceScenarioInputModel(
          {required final String name,
          required final ConditionModel condition,
          required final List<ActionModel> actions}) =
      _$DeviceScenarioInputModelImpl;
  const _DeviceScenarioInputModel._() : super._();

  @override
  String get name;
  @override
  ConditionModel get condition;
  @override
  List<ActionModel> get actions;
}
