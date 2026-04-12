// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_scenario_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceScenarioResponseModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ConditionResponseModel get condition => throw _privateConstructorUsedError;
  List<ActionResponseModel> get actions => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DeviceScenarioResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$DeviceScenarioResponseModelImpl extends _DeviceScenarioResponseModel {
  const _$DeviceScenarioResponseModelImpl(
      {required this.id,
      required this.name,
      required this.condition,
      required final List<ActionResponseModel> actions,
      required this.createdAt,
      required this.updatedAt})
      : _actions = actions,
        super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final ConditionResponseModel condition;
  final List<ActionResponseModel> _actions;
  @override
  List<ActionResponseModel> get actions {
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
    return 'DeviceScenarioResponseModel(id: $id, name: $name, condition: $condition, actions: $actions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceScenarioResponseModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, condition,
      const DeepCollectionEquality().hash(_actions), createdAt, updatedAt);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceScenarioResponseModelImplToJson(
      this,
    );
  }
}

abstract class _DeviceScenarioResponseModel
    extends DeviceScenarioResponseModel {
  const factory _DeviceScenarioResponseModel(
      {required final int id,
      required final String name,
      required final ConditionResponseModel condition,
      required final List<ActionResponseModel> actions,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$DeviceScenarioResponseModelImpl;
  const _DeviceScenarioResponseModel._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  ConditionResponseModel get condition;
  @override
  List<ActionResponseModel> get actions;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
}
