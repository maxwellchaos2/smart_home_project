// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_search_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventsSearchInputEntity {
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int? get projectId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventsSearchInputEntityCopyWith<EventsSearchInputEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsSearchInputEntityCopyWith<$Res> {
  factory $EventsSearchInputEntityCopyWith(EventsSearchInputEntity value,
          $Res Function(EventsSearchInputEntity) then) =
      _$EventsSearchInputEntityCopyWithImpl<$Res, EventsSearchInputEntity>;
  @useResult
  $Res call({int limit, int offset, int? projectId});
}

/// @nodoc
class _$EventsSearchInputEntityCopyWithImpl<$Res,
        $Val extends EventsSearchInputEntity>
    implements $EventsSearchInputEntityCopyWith<$Res> {
  _$EventsSearchInputEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
    Object? projectId = freezed,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventsSearchInputEntityImplCopyWith<$Res>
    implements $EventsSearchInputEntityCopyWith<$Res> {
  factory _$$EventsSearchInputEntityImplCopyWith(
          _$EventsSearchInputEntityImpl value,
          $Res Function(_$EventsSearchInputEntityImpl) then) =
      __$$EventsSearchInputEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, int offset, int? projectId});
}

/// @nodoc
class __$$EventsSearchInputEntityImplCopyWithImpl<$Res>
    extends _$EventsSearchInputEntityCopyWithImpl<$Res,
        _$EventsSearchInputEntityImpl>
    implements _$$EventsSearchInputEntityImplCopyWith<$Res> {
  __$$EventsSearchInputEntityImplCopyWithImpl(
      _$EventsSearchInputEntityImpl _value,
      $Res Function(_$EventsSearchInputEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
    Object? projectId = freezed,
  }) {
    return _then(_$EventsSearchInputEntityImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$EventsSearchInputEntityImpl implements _EventsSearchInputEntity {
  const _$EventsSearchInputEntityImpl(
      {required this.limit, required this.offset, required this.projectId});

  @override
  final int limit;
  @override
  final int offset;
  @override
  final int? projectId;

  @override
  String toString() {
    return 'EventsSearchInputEntity(limit: $limit, offset: $offset, projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsSearchInputEntityImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, offset, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventsSearchInputEntityImplCopyWith<_$EventsSearchInputEntityImpl>
      get copyWith => __$$EventsSearchInputEntityImplCopyWithImpl<
          _$EventsSearchInputEntityImpl>(this, _$identity);
}

abstract class _EventsSearchInputEntity implements EventsSearchInputEntity {
  const factory _EventsSearchInputEntity(
      {required final int limit,
      required final int offset,
      required final int? projectId}) = _$EventsSearchInputEntityImpl;

  @override
  int get limit;
  @override
  int get offset;
  @override
  int? get projectId;
  @override
  @JsonKey(ignore: true)
  _$$EventsSearchInputEntityImplCopyWith<_$EventsSearchInputEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
