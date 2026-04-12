import 'package:devices/devices.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';

Middleware checkProjectMiddleware() {
  return (Handler handler) {
    return (Request request) async {
      if (!request.url.path.contains('/projects/')) {
        return await handler(request);
      }

      final parsedProjectId = int.tryParse(
          RegExp(r'projects/(\d+)').firstMatch(request.url.path)?.group(1) ??
              '');
      if (parsedProjectId == null) {
        return await handler(request);
      }
      final currentUser = request.context['currentUser'] as UserEntity?;
      final currentDevice = request.context['currentDevice'] as DeviceEntity?;

      if (!(currentUser?.isAdmin == true ||
          currentUser?.projectsId.contains(parsedProjectId) == true ||
          currentDevice?.projectId == parsedProjectId)) {
        return Response.forbidden(
          'You are not allowed to access this project',
          headers: {'content-type': 'application/json'},
        );
      }
      return await handler(request);
    };
  };
}
