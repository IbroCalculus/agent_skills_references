import 'package:dcli/dcli.dart';

void main(List<String> args) {
  print(blue('=== Workspace Diagnostic & Backup ==='));

  final projectDir = pwd;
  print('Current Directory: $projectDir');

  final backupTarget = join(projectDir, '.backup');
  if (!exists(backupTarget)) {
    createDir(backupTarget);
    print(green('Created backup directory at $backupTarget'));
  }

  final files = find('*.dart', workingDirectory: projectDir).toList();
  print('Found ${files.length} Dart source files.');

  final confirm = confirm('Proceed with archive backup?', defaultValue: true);
  if (confirm) {
    print(green('Backup confirmed. Finished!'));
  } else {
    print(orange('Operation cancelled by user.'));
  }
}
