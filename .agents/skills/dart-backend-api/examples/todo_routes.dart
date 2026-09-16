import 'dart:io';
import 'package:dart_frog/dart_frog.dart';

// In-memory store for demonstration
final _todos = <String, Map<String, dynamic>>{
  '1': {'id': '1', 'title': 'Learn Genkit', 'completed': true},
  '2': {'id': '2', 'title': 'Build Flutter Backend', 'completed': false},
};

Future<Response> onRequest(RequestContext context, String id) async {
  return switch (context.request.method) {
    HttpMethod.get => _getTodo(id),
    HttpMethod.delete => _deleteTodo(id),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed)),
  };
}

Future<Response> _getTodo(String id) async {
  final todo = _todos[id];
  if (todo == null) {
    return Response.json(
      statusCode: HttpStatus.notFound,
      body: {'error': 'Todo item not found'},
    );
  }
  return Response.json(body: todo);
}

Future<Response> _deleteTodo(String id) async {
  if (!_todos.containsKey(id)) {
    return Response.json(
      statusCode: HttpStatus.notFound,
      body: {'error': 'Cannot delete non-existent item'},
    );
  }
  _todos.remove(id);
  return Response(statusCode: HttpStatus.noContent);
}
