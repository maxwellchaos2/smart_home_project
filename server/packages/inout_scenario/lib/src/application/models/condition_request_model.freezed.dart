// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConditionRequestModel _$ConditionRequestModelFromJson(
    Map<String, dynamic> json) {
  switch (json['type']) {
    case 'logic':
      return _ConditionLogicRequestModel.fromJson(json);
    case 'state':
      return _ConditionStateRequestModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'ConditionRequestModel',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ConditionRequestModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicRequestModel value) logic,
    required TResult Function(_ConditionStateRequestModel value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicRequestModel value)? logic,
    TResult? Function(_ConditionStateRequestModel value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicRequestModel value)? logic,
    TResult Function(_ConditionStateRequestModel value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ConditionLogicRequestModelImpl extends _ConditionLogicRequestModel {
  const _$ConditionLogicRequestModelImpl(
      {required this.logic,
      required final List<ConditionRequestModel> conditions,
      final String? $type})
      : _conditions = conditions,
        $type = $type ?? 'logic',
        super._();

  factory _$ConditionLogicRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionLogicRequestModelImplFromJson(json);

  @override
  final String logic;
  final List<ConditionRequestModel> _conditions;
  @override
  List<ConditionRequestModel> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionRequestModel.logic(logic: $logic, conditions: $conditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionLogicRequestModelImpl &&
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
    required TResult Function(_ConditionLogicRequestModel value) logic,
    required TResult Function(_ConditionStateRequestModel value) state,
  }) {
    return logic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicRequestModel value)? logic,
    TResult? Function(_ConditionStateRequestModel value)? state,
  }) {
    return logic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicRequestModel value)? logic,
    TResult Function(_ConditionStateRequestModel value)? state,
    required TResult orElse(),
  }) {
    if (logic != null) {
      return logic(this);
    }
    return orElse();
  }
}

abstract class _ConditionLogicRequestModel extends ConditionRequestModel {
  const factory _ConditionLogicRequestModel(
          {required final String logic,
          required final List<ConditionRequestModel> conditions}) =
      _$ConditionLogicRequestModelImpl;
  const _ConditionLogicRequestModel._() : super._();

  factory _ConditionLogicRequestModel.fromJson(Map<String, dynamic> json) =
      _$ConditionLogicRequestModelImpl.fromJson;

  String get logic;
  List<ConditionRequestModel> get conditions;
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$ConditionStateRequestModelImpl extends _ConditionStateRequestModel {
  const _$ConditionStateRequestModelImpl(
      {required this.deviceId, required this.state, final String? $type})
      : $type = $type ?? 'state',
        super._();

  factory _$ConditionStateRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConditionStateRequestModelImplFromJson(json);

  @override
  final String deviceId;
  @override
  final bool? state;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionRequestModel.state(deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionStateRequestModelImpl &&
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
    required TResult Function(_ConditionLogicRequestModel value) logic,
    required TResult Function(_ConditionStateRequestModel value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicRequestModel value)? logic,
    TResult? Function(_ConditionStateRequestModel value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicRequestModel value)? logic,
    TResult Function(_ConditionStateRequestModel value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _ConditionStateRequestModel extends ConditionRequestModel {
  const factory _ConditionStateRequestModel(
      {required final String deviceId,
      required final bool? state}) = _$ConditionStateRequestModelImpl;
  const _ConditionStateRequestModel._() : super._();

  factory _ConditionStateRequestModel.fromJson(Map<String, dynamic> json) =
      _$ConditionStateRequestModelImpl.fromJson;

  String get deviceId;
  bool? get state;
}
