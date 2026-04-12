// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'condition_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConditionResponseModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ConditionLogicResponseModel value) logic,
    required TResult Function(_ConditionStateResponseModel value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicResponseModel value)? logic,
    TResult? Function(_ConditionStateResponseModel value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicResponseModel value)? logic,
    TResult Function(_ConditionStateResponseModel value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ConditionLogicResponseModelImpl extends _ConditionLogicResponseModel {
  const _$ConditionLogicResponseModelImpl(
      {required this.logic,
      required final List<ConditionResponseModel> conditions,
      final String? $type})
      : _conditions = conditions,
        $type = $type ?? 'logic',
        super._();

  @override
  final String logic;
  final List<ConditionResponseModel> _conditions;
  @override
  List<ConditionResponseModel> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionResponseModel.logic(logic: $logic, conditions: $conditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionLogicResponseModelImpl &&
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
    required TResult Function(_ConditionLogicResponseModel value) logic,
    required TResult Function(_ConditionStateResponseModel value) state,
  }) {
    return logic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicResponseModel value)? logic,
    TResult? Function(_ConditionStateResponseModel value)? state,
  }) {
    return logic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicResponseModel value)? logic,
    TResult Function(_ConditionStateResponseModel value)? state,
    required TResult orElse(),
  }) {
    if (logic != null) {
      return logic(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionLogicResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionLogicResponseModel extends ConditionResponseModel {
  const factory _ConditionLogicResponseModel(
          {required final String logic,
          required final List<ConditionResponseModel> conditions}) =
      _$ConditionLogicResponseModelImpl;
  const _ConditionLogicResponseModel._() : super._();

  String get logic;
  List<ConditionResponseModel> get conditions;
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ConditionStateResponseModelImpl extends _ConditionStateResponseModel {
  const _$ConditionStateResponseModelImpl(
      {required this.deviceId, required this.state, final String? $type})
      : $type = $type ?? 'state',
        super._();

  @override
  final String deviceId;
  @override
  final bool? state;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ConditionResponseModel.state(deviceId: $deviceId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionStateResponseModelImpl &&
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
    required TResult Function(_ConditionLogicResponseModel value) logic,
    required TResult Function(_ConditionStateResponseModel value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ConditionLogicResponseModel value)? logic,
    TResult? Function(_ConditionStateResponseModel value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ConditionLogicResponseModel value)? logic,
    TResult Function(_ConditionStateResponseModel value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionStateResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ConditionStateResponseModel extends ConditionResponseModel {
  const factory _ConditionStateResponseModel(
      {required final String deviceId,
      required final bool? state}) = _$ConditionStateResponseModelImpl;
  const _ConditionStateResponseModel._() : super._();

  String get deviceId;
  bool? get state;
}
