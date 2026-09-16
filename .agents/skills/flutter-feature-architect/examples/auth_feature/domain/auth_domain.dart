// Domain Entity (Pure Dart)
class UserEntity {
  final String id;
  final String email;
  final String name;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
  });
}

// Domain Repository Interface
abstract class AuthRepository {
  Future<UserEntity> login({required String email, required String password});
  Future<void> logout();
}
