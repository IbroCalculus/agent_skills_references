import 'dart:io';
import 'package:dotenv/dotenv.dart';
import 'package:genkit/genkit.dart';
import 'package:genkit_google_genai/genkit_google_genai.dart';

void main() async {
  final env = DotEnv()..load();
  final apiKey = env['GEMINI_API_KEY'];

  if (apiKey == null || apiKey.isEmpty) {
    stderr.writeln('Error: GEMINI_API_KEY is not set in .env');
    exit(1);
  }

  final ai = Genkit(plugins: [googleAI(apiKey: apiKey)]);

  // 1. Define autonomous tool
  final weatherTool = ai.defineTool(
    name: 'fetchLiveWeather',
    description: 'Fetches the current real-time weather temperature and condition for a city',
    inputSchema: Schema.object({'city': Schema.string()}),
    outputSchema: Schema.object({
      'temperatureCelsius': Schema.number(),
      'condition': Schema.string(),
    }),
    fn: (input) async {
      final city = input['city'] as String;
      // In production, execute your real weather HTTP request here
      return {
        'temperatureCelsius': 28.0,
        'condition': 'Partly cloudy in $city',
      };
    },
  );

  // 2. Define flow utilizing tool calling
  final weatherAssistantFlow = ai.defineFlow(
    name: 'weatherAssistantFlow',
    fn: (String userQuery) async {
      final response = await ai.generate(
        model: googleAI.gemini('gemini-2.5-flash'),
        prompt: userQuery,
        tools: [weatherTool],
      );
      return response.text;
    },
  );

  print('Running Weather Agent Flow...');
  final result = await weatherAssistantFlow('What is the weather currently like in Lagos?');
  print('Agent Result:\n$result');
}
