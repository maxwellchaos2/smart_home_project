// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'changed_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChangedEvent<T> {
  T? get item => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Created<T> value) created,
    required TResult Function(_Updated<T> value) updated,
    required TResult Function(_Deleted<T> value) deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Created<T> value)? created,
    TResult? Function(_Updated<T> value)? updated,
    TResult? Function(_Deleted<T> value)? deleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Created<T> value)? created,
    TResult Function(_Updated<T> value)? updated,
    TResult Function(_Deleted<T> value)? deleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$CreatedImpl<T> extends _Created<T> {
  const _$CreatedImpl(this.item) : super._();

  @override
  final T item;

  @override
  String toString() {
    return 'ChangedEvent<$T>.created(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedImpl<T> &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Created<T> value) created,
    required TResult Function(_Updated<T> value) updated,
    required TResult Function(_Deleted<T> value) deleted,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Created<T> value)? created,
    TResult? Function(_Updated<T> value)? updated,
    TResult? Function(_Deleted<T> value)? deleted,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Created<T> value)? created,
    TResult Function(_Updated<T> value)? updated,
    TResult Function(_Deleted<T> value)? deleted,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class _Created<T> extends ChangedEvent<T> {
  const factory _Created(final T item) = _$CreatedImpl<T>;
  const _Created._() : super._();

  @override
  T get item;
}

/// @nodoc

class _$UpdatedImpl<T> extends _Updated<T> {
  const _$UpdatedImpl(this.item) : super._();

  @override
  final T item;

  @override
  String toString() {
    return 'ChangedEvent<$T>.updated(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatedImpl<T> &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Created<T> value) created,
    required TResult Function(_Updated<T> value) updated,
    required TResult Function(_Deleted<T> value) deleted,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Created<T> value)? created,
    TResult? Function(_Updated<T> value)? updated,
    TResult? Function(_Deleted<T> value)? deleted,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Created<T> value)? created,
    TResult Function(_Updated<T> value)? updated,
    TResult Function(_Deleted<T> value)? deleted,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class _Updated<T> extends ChangedEvent<T> {
  const factory _Updated(final T item) = _$UpdatedImpl<T>;
  const _Updated._() : super._();

  @override
  T get item;
}

/// @nodoc

class _$DeletedImpl<T> extends _Deleted<T> {
  const _$DeletedImpl({required this.itemId, this.item}) : super._();

  @override
  final int itemId;
  @override
  final T? item;

  @override
  String toString() {
    return 'ChangedEvent<$T>.deleted(itemId: $itemId, item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletedImpl<T> &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, itemId, const DeepCollectionEquality().hash(item));

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Created<T> value) created,
    required TResult Function(_Updated<T> value) updated,
    required TResult Function(_Deleted<T> value) deleted,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Created<T> value)? created,
    TResult? Function(_Updated<T> value)? updated,
    TResult? Function(_Deleted<T> value)? deleted,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Created<T> value)? created,
    TResult Function(_Updated<T> value)? updated,
    TResult Function(_Deleted<T> value)? deleted,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted<T> extends ChangedEvent<T> {
  const factory _Deleted({required final int itemId, final T? item}) =
      _$DeletedImpl<T>;
  const _Deleted._() : super._();

  int get itemId;
  @override
  T? get item;
}
