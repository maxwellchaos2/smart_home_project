import 'package:freezed_annotation/freezed_annotation.dart';

part 'changed_event.freezed.dart';

@freezed
sealed class ChangedEvent<T> with _$ChangedEvent<T> {
  const ChangedEvent._();

  const factory ChangedEvent.created(
    T item,
  ) = _Created<T>;

  const factory ChangedEvent.updated(
    T item,
  ) = _Updated<T>;

  const factory ChangedEvent.deleted({
    required int itemId,
    T? item,
  }) = _Deleted<T>;
}
