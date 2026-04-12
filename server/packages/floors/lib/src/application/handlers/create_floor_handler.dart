import 'dart:convert';

import 'package:common/common.dart';
import 'package:floors/src/application/application.dart';
import 'package:floors/src/domain/domain.dart';
import 'package:media/media.dart';
import 'package:shelf/shelf.dart';

Future<Response> createFloorHandler(Request request, String projectId) async {
  final locator = request.context['locator'] as GetIt;
  final repository = locator.get<IFloorsRepository>();

  final (data: Map<String, dynamic> data, files: [String planFilePath]) =
      await MultipartUtils.filesAndDataFromMultipart(
    request,
    extension: 'svg',
    folder: 'floor-plans',
    fileFieldNames: ['planFile'],
  );

  final model = CreateFloorRequestModel.fromJson(data);
  final floor = await repository.create(
    input: CreateFloorRequestMapper.toEntity(
      from: model,
      projectId: int.parse(projectId),
      planMediaPath: planFilePath,
    ),
  );
  final jsonResult = FloorResponseMapper.toModel(from: floor).toJson();
  return Response.ok(
    jsonEncode(jsonResult),
    headers: {'content-type': 'application/json'},
  );
}
