// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConditionModel _$ConditionModelFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'logic':
      return _ConditionLogicModel.fromJson(json);
    case 'state':
      return _ConditionStateModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'ConditionModel',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ConditionModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicModel value) logic,
    required TResult Function(_ConditionStateModel value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicModel value)? logic,
    TResult? Function(_ConditionStateModel value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicModel value)? logic,
    TResult Function(_ConditionStateModel value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ConditionLogicModelImpl extends _ConditionLogicModel {
  const _$ConditionLogicModelImpl(
      {required this.logic,
      required final List<ConditionModel> conditions,
      final String? $type})
      : _conditions = conditions,
        $type = $type ?? 'logic',
        super._();

  factory _$ConditionLogicModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionLogicModelImplFromJson(json);

  @override
  final String logic;
  final List<ConditionModel> _conditions;
  @override
  List<ConditionModel> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionModel.logic(logic: $logic, conditions: $conditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionLogicModelImpl &&
            (identical(other.logic, logic) || other.logic == logic) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, logic, const DeepCollectionEquality().hash(_conditions));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicModel value) logic,
    required TResult Function(_ConditionStateModel value) state,
  }) {
    return logic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicModel value)? logic,
    TResult? Function(_ConditionStateModel value)? state,
  }) {
    return logic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicModel value)? logic,
    TResult Function(_ConditionStateModel value)? state,
    required TResult orElse(),
  }) {
    if (logic != null) {
      return logic(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionLogicModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionLogicModel extends ConditionModel {
  const factory _ConditionLogicModel(
          {required final String logic,
          required final List<ConditionModel> conditions}) =
      _$ConditionLogicModelImpl;
  const _ConditionLogicModel._() : super._();

  factory _ConditionLogicModel.fromJson(Map<String, dynamic> json) =
      _$ConditionLogicModelImpl.fromJson;

  String get logic;
  List<ConditionModel> get conditions;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ConditionStateModelImpl extends _ConditionStateModel {
  const _$ConditionStateModelImpl(
      {required this.deviceId, required this.state, final String? $type})
      : $type = $type ?? 'state',
        super._();

  factory _$ConditionStateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionStateModelImplFromJson(json);

  @override
  final String deviceId;
  @override
  final bool? state;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionModel.state(deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionStateModelImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, state);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicModel value) logic,
    required TResult Function(_ConditionStateModel value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicModel value)? logic,
    TResult? Function(_ConditionStateModel value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicModel value)? logic,
    TResult Function(_ConditionStateModel value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionStateModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionStateModel extends ConditionModel {
  const factory _ConditionStateModel(
      {required final String deviceId,
      required final bool? state}) = _$ConditionStateModelImpl;
  const _ConditionStateModel._() : super._();

  factory _ConditionStateModel.fromJson(Map<String, dynamic> json) =
      _$ConditionStateModelImpl.fromJson;

  String get deviceId;
  bool? get state;
}
