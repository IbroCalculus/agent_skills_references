---
name: dart-genkit-flow
description: Build AI-powered flows, structured outputs, agent workflows, and LLM integrations in pure Dart using the Genkit Dart SDK, Google Gemini, and local LLMs (LM Studio).
---

# Dart Genkit Flow

## Purpose

Guide the design, setup, and implementation of AI workflows and agents in pure Dart using Google Genkit. Supports both cloud models (Gemini) and local offline LLMs (LM Studio/Ollama), structured data generation, tool calling, and backend orchestration for Flutter client applications.

---

## Supporting Resources in this Skill

- **Quick Reference & Mental Model**: [`references/genkit_cheatsheet.md`](./references/genkit_cheatsheet.md)
- **Haiku Generator Example**: [`examples/haiku_genkit_app.dart`](./examples/haiku_genkit_app.dart)
- **Autonomous Tool-Calling Flow**: [`examples/weather_agent_flow.dart`](./examples/weather_agent_flow.dart)
- **Environment Template**: [`templates/dot_env.example`](./templates/dot_env.example)

---

## When to Use

- Creating standalone Dart AI services, CLIs, or backend endpoints (Dart Frog / Shelf).
- Defining Genkit flows, tool-calling functions, and structured output generation.
- Connecting Dart to Gemini models (`gemini-2.5-flash`, `gemini-1.5-pro`) or local models via LM Studio.
- Building the AI backend layer that feeds a Flutter frontend.

---

## Project Setup & Dependencies

### 1. Initialize Console or Backend Project

```bash
dart create -t console-simple my_genkit_app
cd my_genkit_app
```

### 2. Add Required Dependencies

```bash
dart pub add genkit genkit_google_genai dotenv schemantic dev:build_runner
```

### 3. Environment Configuration (`.env`)

Never hardcode API keys. Always maintain a `.env` file at the root:

```env
GEMINI_API_KEY=AIzaSy...
LM_STUDIO_URL=http://localhost:1234/v1
```

Ensure `.env` is added to `.gitignore`.

---

## Core Genkit Patterns

### 1. Initializing Genkit with Google AI

```dart
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

  // Initialize Genkit instance with Google AI plugin
  final ai = Genkit(
    plugins: [googleAI(apiKey: apiKey)],
  );

  final response = await ai.generate(
    model: googleAI.gemini('gemini-2.5-flash'),
    prompt: 'Provide a concise overview of clean architecture in mobile applications.',
  );

  print(response.text);
}
```

### 2. Local Model Integration (LM Studio / Ollama)

When developing offline or running private models locally, connect Genkit to the local OpenAI-compatible endpoint provided by LM Studio (`http://localhost:1234/v1`):

- **Start LM Studio local server**: Ensure the local server is running on port 1234 with CORS enabled.
- **Model routing**: Configure an OpenAI-compatible plugin or custom HTTP transport pointing to `http://localhost:1234/v1`.

---

## Advanced Capabilities

### 1. Structured Output Generation

Avoid fragile regex or manual JSON parsing. Define schemas using `schemantic`:

```dart
// Define schema contract
final bookRecommendationSchema = Schema.object({
  'title': Schema.string(),
  'author': Schema.string(),
  'genre': Schema.string(),
  'year': Schema.integer(),
  'summary': Schema.string(),
});

final response = await ai.generate(
  model: googleAI.gemini('gemini-2.5-flash'),
  prompt: 'Recommend 1 foundational book on software architecture.',
  output: OutputConfig(
    schema: bookRecommendationSchema,
  ),
);
```

### 2. Tool / Function Calling

Allow the AI model to autonomously invoke Dart functions:

```dart
// Define tool
final fetchWeatherTool = ai.defineTool(
  name: 'getWeather',
  description: 'Fetches the current weather for a given city',
  inputSchema: Schema.object({'city': Schema.string()}),
  outputSchema: Schema.object({'temperature': Schema.number(), 'condition': Schema.string()}),
  fn: (input) async {
    final city = input['city'] as String;
    // Execute real API / service lookup here
    return {'temperature': 24.5, 'condition': 'Sunny in $city'};
  },
);

// Model generates response using tool
final response = await ai.generate(
  model: googleAI.gemini('gemini-2.5-flash'),
  prompt: 'What is the weather in Abuja right now?',
  tools: [fetchWeatherTool],
);
```

### 3. Encapsulating Logic in Genkit Flows

Flows provide observability, retry capability, and streaming:

```dart
final summarizeArticleFlow = ai.defineFlow(
  name: 'summarizeArticle',
  fn: (String rawText) async {
    final response = await ai.generate(
      model: googleAI.gemini('gemini-2.5-flash'),
      prompt: 'Summarize the following text in 3 bullet points:\n\n$rawText',
    );
    return response.text;
  },
);

// Executing flow
final summary = await summarizeArticleFlow('Flutter is an open-source framework...');
```

---

## Architecture: Integrating with Flutter

When connecting Flutter apps to Genkit AI workflows:

```
Flutter Client (App)
       │
       ▼ (HTTP / WebSocket)
Dart Frog / Shelf Backend (Or Cloud Run)
       │
       ▼ (Internal SDK)
Genkit Orchestrator
   ├── Google AI (Gemini 2.5)
   ├── Local LLM (LM Studio)
   ├── Tools & Databases
   └── Vector Stores (RAG)
```

1. **Protect API Keys**: Do not embed private master Gemini API keys in the Flutter client binary.
2. **Handle Streaming**: Use Server-Sent Events (SSE) or WebSockets between Dart Frog/Shelf and Flutter when streaming long generation outputs.
3. **Graceful Degradation**: Catch quota errors (`ResourceExhaustedException`) or network timeouts and return standardized error envelopes (`{ "error": "AI service temporarily unavailable" }`).
