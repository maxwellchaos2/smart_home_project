import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_chunk_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class ListChunkEntity<T> with _$ListChunkEntity<T> {
  const factory ListChunkEntity({
    required bool hasMore,
    required List<T> items,
    required int totalSize,
  }) = _ListChunkEntity;
}
