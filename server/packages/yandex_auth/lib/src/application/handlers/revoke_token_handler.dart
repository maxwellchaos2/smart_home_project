import 'package:common/common.dart';
import 'package:devices/devices.dart';
import 'package:projects/projects.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';
import 'package:yandex_auth/yandex_auth.dart';

Future<Response> revokeTokenHandler(Request request) async {
  final locator = request.context['locator'] as GetIt;
  final user = request.context['currentUser'] as UserEntity;

  final repository = locator.get<IYandexAuthRepository>();
  final devicesRepository = locator.get<IDevicesRepository>();
  final projectsRepository = locator.get<IProjectsRepository>();

  await projectsRepository.updateYandexAuth(
      id: user.projectsId.first, hasYandexAuth: false);
  await repository.revokeToken(projectId: user.projectsId.first);
  await devicesRepository.deleteAllByProviderType(
    providerType: DeviceProviderType.yandex,
  );

  return Response.ok('Success');
}
