// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'in_out_scenario_input_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InOutScenarioInputRequestModel _$InOutScenarioInputRequestModelFromJson(
    Map<String, dynamic> json) {
  return _InOutScenarioInputRequestModel.fromJson(json);
}

/// @nodoc
mixin _$InOutScenarioInputRequestModel {
  String get name => throw _privateConstructorUsedError;
  ConditionRequestModel get condition => throw _privateConstructorUsedError;
  List<ActionRequestModel> get actions => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$InOutScenarioInputRequestModelImpl
    extends _InOutScenarioInputRequestModel {
  const _$InOutScenarioInputRequestModelImpl(
      {required this.name,
      required this.condition,
      required final List<ActionRequestModel> actions})
      : _actions = actions,
        super._();

  factory _$InOutScenarioInputRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$InOutScenarioInputRequestModelImplFromJson(json);

  @override
  final String name;
  @override
  final ConditionRequestModel condition;
  final List<ActionRequestModel> _actions;
  @override
  List<ActionRequestModel> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  String toString() {
    return 'InOutScenarioInputRequestModel(name: $name, condition: $condition, actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InOutScenarioInputRequestModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            const DeepCollectionEquality().equals(other._actions, _actions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, condition,
      const DeepCollectionEquality().hash(_actions));
}

abstract class _InOutScenarioInputRequestModel
    extends InOutScenarioInputRequestModel {
  const factory _InOutScenarioInputRequestModel(
          {required final String name,
          required final ConditionRequestModel condition,
          required final List<ActionRequestModel> actions}) =
      _$InOutScenarioInputRequestModelImpl;
  const _InOutScenarioInputRequestModel._() : super._();

  factory _InOutScenarioInputRequestModel.fromJson(Map<String, dynamic> json) =
      _$InOutScenarioInputRequestModelImpl.fromJson;

  @override
  String get name;
  @override
  ConditionRequestModel get condition;
  @override
  List<ActionRequestModel> get actions;
}
