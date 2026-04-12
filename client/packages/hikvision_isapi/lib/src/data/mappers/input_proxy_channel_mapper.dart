import '/src/data/data.dart';
import '/src/domain/domain.dart';

abstract final class InputProxyChannelMapper {
  static InputProxyChannelEntity toEntity(
      {required InputProxyChannelModel from}) {
    return InputProxyChannelEntity(
      id: from.id,
      name: from.name,
    );
  }
}
