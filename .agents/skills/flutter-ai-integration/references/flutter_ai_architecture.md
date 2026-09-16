# Flutter AI Architecture & Local vs Cloud Integration

## Architecture Topologies

### 1. Enterprise / Production Topology (Backend Protected)
```
Flutter App
    │
    ▼ (Authenticated HTTPS / SSE)
Dart Frog Backend (Genkit Dart SDK)
    │
    ▼
Gemini 2.5 / Vector DB (RAG)
```

### 2. Local & Privacy-First Topology (LM Studio)
```
Flutter App (Desktop / Emulator)
    │
    ▼ (OpenAI-compatible HTTP)
LM Studio Server (http://localhost:1234/v1)
    │
    ▼
Local Model (Llama 3 / Gemma 2 / Mistral)
```

---

## Network Endpoints by Environment

- **Desktop (Windows/macOS/Linux)**: `http://localhost:1234/v1`
- **iOS Simulator**: `http://localhost:1234/v1`
- **Android Emulator**: `http://10.0.2.2:1234/v1` (10.0.2.2 maps to host machine loopback)
- **Physical Device**: Host machine LAN IP (e.g., `http://192.168.1.X:1234/v1`)
