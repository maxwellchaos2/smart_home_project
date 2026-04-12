// import 'dart:convert';

// import 'package:common/common.dart';
// import 'package:events/src/application/application.dart';
// import 'package:events/src/domain/domain.dart';
// import 'package:shelf/shelf.dart';
// import 'package:shelf_router/shelf_router.dart';
// import 'package:users/users.dart';

// Future<Response> fetchEventsHandler(Request request) async {
//   final locator = request.context['locator'] as GetIt;
//   final repository = locator.get<IEventsRepository>();

//   final currentUser = request.context['currentUser'] as UserEntity;
//   final events = await repository.fetchChunk(
//     input: EventsRequestMapper.toEntity(
//       from: EventsRequestModel.fromJson(request.params),
//       projectId: currentUser.projectId,
//     ),
//   );
//   final jsonResult = events
//       .map((event) => EventResponseMapper.toModel(from: event).toJson())
//       .toList();
//   return Response.ok(
//     jsonEncode(jsonResult),
//     headers: {'content-type': 'application/json'},
//   );
// }
