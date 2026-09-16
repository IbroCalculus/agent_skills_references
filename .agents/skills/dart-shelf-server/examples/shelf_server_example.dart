import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

void main() async {
  final router = Router();

  // Root endpoint
  router.get('/', (Request request) {
    return Response.ok('Shelf API service is up and running.\n');
  });

  // Echo JSON endpoint
  router.get('/api/info', (Request request) {
    final payload = jsonEncode({
      'version': '1.0.0',
      'environment': 'development',
      'timestamp': DateTime.now().toIso8601String(),
    });
    return Response.ok(payload, headers: {'content-type': 'application/json'});
  });

  // Parameterized endpoint
  router.get('/api/greet/<name>', (Request request, String name) {
    return Response.ok('Welcome, $name!');
  });

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router.call);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await io.serve(handler, InternetAddress.anyIPv4, port);
  print('Server serving at http://${server.address.host}:${server.port}');
}
