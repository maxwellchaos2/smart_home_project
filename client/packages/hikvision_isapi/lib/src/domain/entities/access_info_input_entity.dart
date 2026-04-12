import 'package:common/common.dart';

part 'access_info_input_entity.freezed.dart';

@freezed
sealed class AccessInfoInputEntity with _$AccessInfoInputEntity {
  const factory AccessInfoInputEntity({
    required String username,
    required String password,
    required String ipAddress,
    required int port,
  }) = _AccessInfoInputEntity;
}
