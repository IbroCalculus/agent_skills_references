import 'package:dart_frog/dart_frog.dart';

// Replace with your actual service or repository
class AuthService {
  bool validateToken(String? token) => token != null && token.isNotEmpty;
}

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<AuthService>((_) => AuthService()))
      .use(_authGuard());
}

Middleware _authGuard() {
  return (handler) {
    return (context) async {
      // Perform token inspection or validation here
      final authHeader = context.request.headers['Authorization'];
      final authService = context.read<AuthService>();

      if (!authService.validateToken(authHeader)) {
        return Response.json(
          statusCode: 401,
          body: {'error': 'Missing or invalid authentication token'},
        );
      }

      return handler(context);
    };
  };
}
