import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

abstract class UserRemoteDataSource {
  Future<Map<String, dynamic>> fetchUser(String id);
}

class MockUserRemoteDataSource extends Mock implements UserRemoteDataSource {}

class UserRepository {
  final UserRemoteDataSource remoteDataSource;
  UserRepository(this.remoteDataSource);

  Future<String> getUserName(String id) async {
    final data = await remoteDataSource.fetchUser(id);
    return data['name'] as String? ?? 'Anonymous';
  }
}

void main() {
  late MockUserRemoteDataSource mockDataSource;
  late UserRepository repository;

  setUp(() {
    mockDataSource = MockUserRemoteDataSource();
    repository = UserRepository(mockDataSource);
  });

  test('returns user name when datasource resolves successfully', () async {
    when(() => mockDataSource.fetchUser('123'))
        .thenAnswer((_) async => {'id': '123', 'name': 'Ibrahim'});

    final result = await repository.getUserName('123');

    expect(result, 'Ibrahim');
    verify(() => mockDataSource.fetchUser('123')).called(1);
  });
}
