import 'package:dcli/dcli.dart';

void main(List<String> args) {
  final input = ask('Enter project target name:');
  if (input.isEmpty) {
    print(red('Error: Target cannot be empty'));
    return;
  }

  print(green('Configuring project: $input'));
  // Run commands using string extensions
  // 'flutter clean'.run;
}
