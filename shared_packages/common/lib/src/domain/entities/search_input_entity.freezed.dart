// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_input_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchInputEntity<Filters, Sorting> {
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  Filters? get filters => throw _privateConstructorUsedError;
  Sorting? get orderBy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchInputEntityCopyWith<Filters, Sorting,
          SearchInputEntity<Filters, Sorting>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchInputEntityCopyWith<Filters, Sorting, $Res> {
  factory $SearchInputEntityCopyWith(SearchInputEntity<Filters, Sorting> value,
          $Res Function(SearchInputEntity<Filters, Sorting>) then) =
      _$SearchInputEntityCopyWithImpl<Filters, Sorting, $Res,
          SearchInputEntity<Filters, Sorting>>;
  @useResult
  $Res call({int limit, int offset, Filters? filters, Sorting? orderBy});
}

/// @nodoc
class _$SearchInputEntityCopyWithImpl<Filters, Sorting, $Res,
        $Val extends SearchInputEntity<Filters, Sorting>>
    implements $SearchInputEntityCopyWith<Filters, Sorting, $Res> {
  _$SearchInputEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
    Object? filters = freezed,
    Object? orderBy = freezed,
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
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Filters?,
      orderBy: freezed == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as Sorting?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchInputEntityImplCopyWith<Filters, Sorting, $Res>
    implements $SearchInputEntityCopyWith<Filters, Sorting, $Res> {
  factory _$$SearchInputEntityImplCopyWith(
          _$SearchInputEntityImpl<Filters, Sorting> value,
          $Res Function(_$SearchInputEntityImpl<Filters, Sorting>) then) =
      __$$SearchInputEntityImplCopyWithImpl<Filters, Sorting, $Res>;
  @override
  @useResult
  $Res call({int limit, int offset, Filters? filters, Sorting? orderBy});
}

/// @nodoc
class __$$SearchInputEntityImplCopyWithImpl<Filters, Sorting, $Res>
    extends _$SearchInputEntityCopyWithImpl<Filters, Sorting, $Res,
        _$SearchInputEntityImpl<Filters, Sorting>>
    implements _$$SearchInputEntityImplCopyWith<Filters, Sorting, $Res> {
  __$$SearchInputEntityImplCopyWithImpl(
      _$SearchInputEntityImpl<Filters, Sorting> _value,
      $Res Function(_$SearchInputEntityImpl<Filters, Sorting>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
    Object? filters = freezed,
    Object? orderBy = freezed,
  }) {
    return _then(_$SearchInputEntityImpl<Filters, Sorting>(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Filters?,
      orderBy: freezed == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as Sorting?,
    ));
  }
}

/// @nodoc

class _$SearchInputEntityImpl<Filters, Sorting>
    implements _SearchInputEntity<Filters, Sorting> {
  const _$SearchInputEntityImpl(
      {required this.limit, required this.offset, this.filters, this.orderBy});

  @override
  final int limit;
  @override
  final int offset;
  @override
  final Filters? filters;
  @override
  final Sorting? orderBy;

  @override
  String toString() {
    return 'SearchInputEntity<$Filters, $Sorting>(limit: $limit, offset: $offset, filters: $filters, orderBy: $orderBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchInputEntityImpl<Filters, Sorting> &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            const DeepCollectionEquality().equals(other.filters, filters) &&
            const DeepCollectionEquality().equals(other.orderBy, orderBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      limit,
      offset,
      const DeepCollectionEquality().hash(filters),
      const DeepCollectionEquality().hash(orderBy));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchInputEntityImplCopyWith<Filters, Sorting,
          _$SearchInputEntityImpl<Filters, Sorting>>
      get copyWith => __$$SearchInputEntityImplCopyWithImpl<Filters, Sorting,
          _$SearchInputEntityImpl<Filters, Sorting>>(this, _$identity);
}

abstract class _SearchInputEntity<Filters, Sorting>
    implements SearchInputEntity<Filters, Sorting> {
  const factory _SearchInputEntity(
      {required final int limit,
      required final int offset,
      final Filters? filters,
      final Sorting? orderBy}) = _$SearchInputEntityImpl<Filters, Sorting>;

  @override
  int get limit;
  @override
  int get offset;
  @override
  Filters? get filters;
  @override
  Sorting? get orderBy;
  @override
  @JsonKey(ignore: true)
  _$$SearchInputEntityImplCopyWith<Filters, Sorting,
          _$SearchInputEntityImpl<Filters, Sorting>>
      get copyWith => throw _privateConstructorUsedError;
}
