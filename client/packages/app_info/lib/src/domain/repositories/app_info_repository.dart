import 'package:app_info/src/domain/domain.dart';

abstract interface class IAppInfoRepository {
  Future<AppInfoEntity> fetch();
}
