# Genkit Dart SDK Cheat Sheet

## Mental Model
Genkit is Google's open-source framework for building full-stack, AI-powered applications and agent workflows.
In Dart, it unifies model communication, tool execution, structured output schemas, and multi-step agent flows.

```
Flutter / Client App
       │
       ▼
Dart Frog / Shelf / Cloud Run (Dart Backend)
       │
       ▼
Genkit Dart SDK
       ├── Google AI Plugin (Gemini 2.5/1.5)
       ├── Local LLM Provider (LM Studio at http://localhost:1234/v1)
       ├── Schemantic Type Validation
       └── Autonomous Tool Calling
```

---

## CLI & Dependency Quick Reference

```bash
# 1. Install Genkit CLI
curl -sL cli.genkit.dev | bash

# 2. Add dependencies to Dart project
dart pub add genkit genkit_google_genai dotenv schemantic dev:build_runner
```

---

## Supported Models

| Provider | Model Identifier | Best For |
| :--- | :--- | :--- |
| **Google AI (Cloud)** | `googleAI.gemini('gemini-2.5-flash')` | High-speed, multimodal, general tasks, tool calling. |
| **Google AI (Cloud)** | `googleAI.gemini('gemini-1.5-pro')` | Complex reasoning, large context windows, coding. |
| **Local Offline** | LM Studio (`http://localhost:1234/v1`) | Offline privacy, local testing with Gemma / Llama. |

---

## Key Benefits
1. **Model Portability**: Swap providers without rewriting your core workflow code.
2. **Structured Outputs**: Strongly typed Dart objects using `schemantic` schemas instead of fragile string parsing.
3. **Tool Calling**: Give the LLM access to execute native Dart functions.
4. **Agent Flows**: Observable, trace-ready execution pipelines.
