import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress('Running "dart format ."');
  try {
    final result = await Process.run('dart', ['format', '.']);
    if (result.exitCode == 0) {
      progress.complete('Formatted successfully!');
    } else {
      progress.fail('Failed to format generated code.');
    }
  } catch (e) {
    progress.fail('Error running formatter: $e');
  }
}
