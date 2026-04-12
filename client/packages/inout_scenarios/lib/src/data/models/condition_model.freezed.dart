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
      return _Logic.fromJson(json);
    case 'state':
      return _Input.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'ConditionModel',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ConditionModel {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Logic value) logic,
    required TResult Function(_Input value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Logic value)? logic,
    TResult? Function(_Input value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Logic value)? logic,
    TResult Function(_Input value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ConditionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$LogicImpl extends _Logic {
  const _$LogicImpl(
      {required this.logic,
      required final List<ConditionModel> conditions,
      final String? $type})
      : _conditions = conditions,
        $type = $type ?? 'logic',
        super._();

  factory _$LogicImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogicImplFromJson(json);

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
            other is _$LogicImpl &&
            (identical(other.logic, logic) || other.logic == logic) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, logic, const DeepCollectionEquality().hash(_conditions));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Logic value) logic,
    required TResult Function(_Input value) state,
  }) {
    return logic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Logic value)? logic,
    TResult? Function(_Input value)? state,
  }) {
    return logic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Logic value)? logic,
    TResult Function(_Input value)? state,
    required TResult orElse(),
  }) {
    if (logic != null) {
      return logic(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LogicImplToJson(
      this,
    );
  }
}

abstract class _Logic extends ConditionModel {
  const factory _Logic(
      {required final String logic,
      required final List<ConditionModel> conditions}) = _$LogicImpl;
  const _Logic._() : super._();

  factory _Logic.fromJson(Map<String, dynamic> json) = _$LogicImpl.fromJson;

  String get logic;
  List<ConditionModel> get conditions;
}

/// @nodoc
@JsonSerializable()
class _$InputImpl extends _Input {
  const _$InputImpl(
      {required this.deviceId, required this.state, final String? $type})
      : $type = $type ?? 'state',
        super._();

  factory _$InputImpl.fromJson(Map<String, dynamic> json) =>
      _$$InputImplFromJson(json);

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
            other is _$InputImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, state);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Logic value) logic,
    required TResult Function(_Input value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Logic value)? logic,
    TResult? Function(_Input value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Logic value)? logic,
    TResult Function(_Input value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InputImplToJson(
      this,
    );
  }
}

abstract class _Input extends ConditionModel {
  const factory _Input(
      {required final String deviceId,
      required final bool? state}) = _$InputImpl;
  const _Input._() : super._();

  factory _Input.fromJson(Map<String, dynamic> json) = _$InputImpl.fromJson;

  String get deviceId;
  bool? get state;
}
