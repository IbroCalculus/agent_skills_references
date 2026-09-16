import 'dart:io';
import 'package:dotenv/dotenv.dart';
import 'package:genkit/genkit.dart';
import 'package:genkit_google_genai/genkit_google_genai.dart';

void main() async {
  final env = DotEnv()..load();
  final apiKey = env['GEMINI_API_KEY'];

  if (apiKey == null || apiKey.isEmpty) {
    stderr.writeln('Error: GEMINI_API_KEY is not set in the .env file.');
    exit(1);
  }

  // Initialize Genkit with Google AI plugin
  final ai = Genkit(plugins: [googleAI(apiKey: apiKey)]);

  print('Generating response with Genkit...');

  try {
    final response = await ai.generate(
      model: googleAI.gemini('gemini-2.5-flash'),
      prompt: 'Write a haiku about writing clean code.',
    );

    print('\n--- Generated Haiku ---');
    print(response.text);
    print('-----------------------\n');
  } catch (e) {
    stderr.writeln('Error during generation: $e');
  }
}
