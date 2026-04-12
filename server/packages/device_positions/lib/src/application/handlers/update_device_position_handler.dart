import 'dart:convert';

import 'package:common/common.dart';
import 'package:device_positions/src/application/mappers/mappers.dart';
import 'package:device_positions/src/application/models/device_position_input_request_model.dart';
import 'package:device_positions/src/domain/domain.dart';
import 'package:media/media.dart';
import 'package:shelf/shelf.dart';
import 'package:users/users.dart';

Future<Response> updateDevicePositionHandler(Request request, String id) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IDevicePositionsRepository>();

  // Проверяем, является ли текущий пользователь администратором
  if (checkRequestIsAdmin(request) == false) {
    return Response.forbidden('Only admins can update rooms');
  }

  late final Map<String, dynamic> data;
  late final String? iconMediaPath;
  late final String? disabledIconMediaPath;
  try {
    final (data: Map<String, dynamic> _data, files: List<String> files) =
        await MultipartUtils.filesAndDataFromMultipart(
      request,
      extension: 'svg',
      folder: 'icon-plans',
      fileFieldNames: ['iconFile', 'disabledIconFile'],
    );
    data = _data;
    iconMediaPath = files.first;

    disabledIconMediaPath = files.length > 1 ? files[1] : null;
  } catch (e) {
    data = jsonDecode(await request.readAsString());
  }
  final model = DevicePositionInputRequestModel.fromJson(data);

  final device = await repository.update(
    id: int.parse(id),
    input: DevicePositionInputRequestMapper.toEntity(
      from: model,
      iconMediaPath: iconMediaPath,
      disabledIconMediaPath: disabledIconMediaPath,
    ),
  );
  final jsonResult =
      DevicePositionResponseMapper.toModel(from: device).toJson();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}
