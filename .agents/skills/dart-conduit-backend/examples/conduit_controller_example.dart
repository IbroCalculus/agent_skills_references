import 'package:conduit_core/conduit_core.dart';

class UsersController extends ResourceController {
  @Operation.get()
  Future<Response> getAllUsers() async {
    return Response.ok([
      {'id': 1, 'name': 'Ibrahim'},
      {'id': 2, 'name': 'Calculus'},
    ]);
  }

  @Operation.get('id')
  Future<Response> getUserById(@Bind.path('id') int id) async {
    return Response.ok({'id': id, 'name': 'User #$id'});
  }

  @Operation.post()
  Future<Response> createUser(@Bind.body() Map<String, dynamic> body) async {
    return Response.ok({'created': true, 'data': body});
  }
}
