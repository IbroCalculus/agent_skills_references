import 'package:langchain/langchain.dart';

Tool defineCustomTool({
  required String name,
  required String description,
  required Future<String> Function(String input) handler,
}) {
  return Tool.fromFunction(
    name: name,
    description: description,
    func: handler,
  );
}
