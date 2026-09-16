---
name: flutter-ai-integration
description: Integrate conversational AI, LLMs, and RAG into Flutter applications using flutter_ai_toolkit, Gemini API, or local LM Studio endpoints with streaming responses and markdown support.
---

# Flutter AI Integration

## Purpose

Guide the development of AI-powered conversational experiences, assistants, and RAG (Retrieval-Augmented Generation) client interfaces in Flutter. Uses `flutter_ai_toolkit` for ready-to-use chat components, handles token streaming, and connects to either cloud models (Gemini) or private local LLMs (LM Studio).

---

## Supporting Resources in this Skill

- **AI Architecture Overview**: [`references/flutter_ai_architecture.md`](./references/flutter_ai_architecture.md)
- **Chat Screen Implementation**: [`examples/ai_chat_screen.dart`](./examples/ai_chat_screen.dart)
- **Local LM Studio Client**: [`examples/lm_studio_client.dart`](./examples/lm_studio_client.dart)

---

## Core Rules & Best Practices

1. **Use `flutter_ai_toolkit` for Chat UI**:
   - Rather than reinventing chat bubbles, message inputs, attachment pickers, and autoscroll logic from scratch, utilize the official `flutter_ai_toolkit` (`LlmChatView`).
2. **Streaming Over Blocking Responses**:
   - Always stream tokens back to the UI (`Stream<String>`) for real-time responsiveness rather than blocking the UI waiting for complete paragraphs.
3. **Backend-First vs Direct Client Calling**:
   - **Direct Client Calling**: Suitable for personal tools, client-provided API keys, or local LM Studio connections.
   - **Backend Proxy (Dart Frog / Genkit)**: Required for production commercial apps to hide master API keys and enforce rate limits.
4. **Resilient Local LLM Connectivity**:
   - When connecting to LM Studio on desktop/emulator, use `http://10.0.2.2:1234/v1` for Android emulators and `http://localhost:1234/v1` for iOS simulators/macOS/Windows desktop.
