import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_input_entity.freezed.dart';

@Freezed(copyWith: true, equal: true)
sealed class SearchInputEntity<Filters, Sorting>
    with _$SearchInputEntity<Filters, Sorting> {
  const factory SearchInputEntity({
    required int limit,
    required int offset,
    Filters? filters,
    Sorting? orderBy,
  }) = _SearchInputEntity;
}
