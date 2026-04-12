import 'package:shelf/shelf.dart';

Future<Response> checkHandler(Request request) async {
  return Response.ok(
    'OK',
    headers: {'content-type': 'application/json'},
  );
}
