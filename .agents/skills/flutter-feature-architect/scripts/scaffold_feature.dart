import 'dart:io';

/// Automated Feature Scaffolder for Flutter Projects
///
/// Usage:
///   dart run .agents/skills/flutter-feature-architect/scripts/scaffold_feature.dart <feature_name> [--type=clean|feature|layer]
void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart scaffold_feature.dart <feature_name> [--type=clean|feature|layer] [--root=lib]');
    exit(1);
  }

  final featureName = args[0].toLowerCase().trim().replaceAll(' ', '_');
  var archType = 'clean'; // default
  var rootDir = 'lib';

  for (final arg in args.skip(1)) {
    if (arg.startsWith('--type=')) {
      archType = arg.substring('--type='.length).toLowerCase();
    } else if (arg.startsWith('--root=')) {
      rootDir = arg.substring('--root='.length);
    }
  }

  print('Scaffolding feature "$featureName" with architecture "$archType" in "$rootDir"...');

  switch (archType) {
    case 'clean':
      _scaffoldCleanArchitecture(rootDir, featureName);
      break;
    case 'feature':
      _scaffoldFeatureFirst(rootDir, featureName);
      break;
    case 'layer':
      _scaffoldLayerBased(rootDir, featureName);
      break;
    default:
      print('Unknown architecture type: $archType. Choose from: clean, feature, layer.');
      exit(1);
  }

  print('Feature "$featureName" successfully scaffolded!');
}

String _toPascalCase(String text) {
  return text
      .split('_')
      .map((part) => part.isEmpty ? '' : '${part[0].toUpperCase()}${part.substring(1)}')
      .join();
}

void _createFile(String path, String content) {
  final file = File(path);
  if (!file.existsSync()) {
    file.createSync(recursive: true);
    file.writeAsStringSync(content);
    print('  + Created: $path');
  } else {
    print('  . Exists:  $path');
  }
}

void _scaffoldCleanArchitecture(String root, String feature) {
  final pascal = _toPascalCase(feature);
  final basePath = '$root/features/$feature';

  // 1. Core directories if not existing
  _createFile('$root/core/errors/failures.dart', '''
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'A server error occurred.']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'A cache/storage error occurred.']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Please check your internet connection.']);
}
''');

  // 2. Domain Layer
  _createFile('$basePath/domain/models/${feature}_entity.dart', '''
class ${pascal}Entity {
  final String id;
  final String name;

  const ${pascal}Entity({
    required this.id,
    required this.name,
  });
}
''');

  _createFile('$basePath/domain/repositories/${feature}_repository.dart', '''
import '../models/${feature}_entity.dart';

abstract class ${pascal}Repository {
  Future<${pascal}Entity> get${pascal}ById(String id);
}
''');

  // 3. Data Layer
  _createFile('$basePath/data/models/${feature}_model.dart', '''
import '../../domain/models/${feature}_entity.dart';

class ${pascal}Model extends ${pascal}Entity {
  const ${pascal}Model({
    required super.id,
    required super.name,
  });

  factory ${pascal}Model.fromJson(Map<String, dynamic> json) {
    return ${pascal}Model(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
''');

  _createFile('$basePath/data/datasources/${feature}_remote_datasource.dart', '''
import '../models/${feature}_model.dart';

abstract class ${pascal}RemoteDataSource {
  Future<${pascal}Model> fetch${pascal}(String id);
}

class ${pascal}RemoteDataSourceImpl implements ${pascal}RemoteDataSource {
  @override
  Future<${pascal}Model> fetch${pascal}(String id) async {
    // API network request implementation goes here
    throw UnimplementedError();
  }
}
''');

  _createFile('$basePath/data/repositories/${feature}_repository_impl.dart', '''
import '../../domain/models/${feature}_entity.dart';
import '../../domain/repositories/${feature}_repository.dart';
import '../datasources/${feature}_remote_datasource.dart';

class ${pascal}RepositoryImpl implements ${pascal}Repository {
  final ${pascal}RemoteDataSource remoteDataSource;

  const ${pascal}RepositoryImpl({required this.remoteDataSource});

  @override
  Future<${pascal}Entity> get${pascal}ById(String id) async {
    return await remoteDataSource.fetch${pascal}(id);
  }
}
''');

  // 4. Presentation Layer
  _createFile('$basePath/presentation/controllers/${feature}_controller.dart', '''
// State management controller (Riverpod Notifier, BLoC, or Cubit)
class ${pascal}State {
  final bool isLoading;
  final String? errorMessage;

  const ${pascal}State({this.isLoading = false, this.errorMessage});

  ${pascal}State copyWith({bool? isLoading, String? errorMessage}) {
    return ${pascal}State(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
''');

  _createFile('$basePath/presentation/screens/${feature}_screen.dart', '''
import 'package:flutter/material.dart';

class ${pascal}Screen extends StatelessWidget {
  const ${pascal}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$pascal'),
      ),
      body: const Center(
        child: Text('$pascal Screen'),
      ),
    );
  }
}
''');

  _createFile('$basePath/presentation/widgets/${feature}_item_widget.dart', '''
import 'package:flutter/material.dart';

class ${pascal}ItemWidget extends StatelessWidget {
  const ${pascal}ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
''');
}

void _scaffoldFeatureFirst(String root, String feature) {
  final pascal = _toPascalCase(feature);
  final basePath = '$root/features/$feature';

  _createFile('$basePath/${feature}_screen.dart', '''
import 'package:flutter/material.dart';

class ${pascal}Screen extends StatelessWidget {
  const ${pascal}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$pascal')),
      body: const Center(child: Text('$pascal')),
    );
  }
}
''');

  _createFile('$basePath/${feature}_model.dart', '''
class ${pascal}Model {
  final String id;
  const ${pascal}Model({required this.id});
}
''');

  _createFile('$basePath/${feature}_service.dart', '''
class ${pascal}Service {
  // Remote/local interactions
}
''');

  _createFile('$basePath/widgets/.gitkeep', '');
}

void _scaffoldLayerBased(String root, String feature) {
  final pascal = _toPascalCase(feature);

  _createFile('$root/screens/${feature}_screen.dart', '''
import 'package:flutter/material.dart';

class ${pascal}Screen extends StatelessWidget {
  const ${pascal}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$pascal Screen')),
      body: const Center(child: Text('$pascal')),
    );
  }
}
''');

  _createFile('$root/models/${feature}_model.dart', '''
class ${pascal}Model {
  final String id;
  const ${pascal}Model({required this.id});
}
''');

  _createFile('$root/services/${feature}_service.dart', '''
class ${pascal}Service {}
''');

  _createFile('$root/widgets/${feature}_card.dart', '''
import 'package:flutter/material.dart';

class ${pascal}Card extends StatelessWidget {
  const ${pascal}Card({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card();
  }
}
''');
}
