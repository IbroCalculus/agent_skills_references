import 'dart:convert';
import 'package:http/http.dart' as http;

class LmStudioClient {
  final String baseUrl;

  LmStudioClient({this.baseUrl = 'http://localhost:1234/v1'});

  Future<String> prompt(String text) async {
    final uri = Uri.parse('$baseUrl/chat/completions');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'messages': [
          {'role': 'user', 'content': text}
        ],
        'temperature': 0.7,
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['choices'][0]['message']['content'] as String;
    } else {
      throw Exception('LM Studio returned ${response.statusCode}: ${response.body}');
    }
  }
}
