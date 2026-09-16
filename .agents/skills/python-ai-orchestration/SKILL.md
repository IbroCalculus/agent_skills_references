---
name: python-ai-orchestration
description: Architect enterprise AI workflows in Python using LLMs, Pydantic structured outputs, token streaming, autonomous tool calling, and RAG (Retrieval-Augmented Generation) pipelines.
---

# Python AI & LLM Orchestration

Use this skill when integrating LLM providers (OpenAI, Gemini, Anthropic, or local Ollama/LM Studio endpoints) to build chatbots, structured extractors, streaming interfaces, tool-using agents, and RAG architectures.

## Core Capabilities & Patterns

1. **Pydantic Structured Outputs**:
   - Never rely on raw prompt strings requesting "return JSON".
   - Use native provider structured outputs (e.g. `client.beta.chat.completions.parse(..., response_format=PydanticModel)` or Gemini structured outputs with schema) to guarantee schema compliance.

2. **Real-Time Token Streaming**:
   - For interactive applications and web UIs, stream tokens via generator functions (`for chunk in stream: yield chunk.delta.content`).

3. **Autonomous Tool / Function Calling**:
   - Define tools with clear docstrings and JSON/Pydantic schemas.
   - Implement the autonomous agent loop:
     1. Send prompt + available tools to LLM.
     2. Detect `tool_calls`.
     3. Execute python function locally.
     4. Append `tool` role message with output.
     5. Query LLM again for final synthesized answer.

4. **Retrieval-Augmented Generation (RAG)**:
   - Chunk source texts with reasonable overlap (e.g., 500 chars with 50 char overlap).
   - Generate embeddings for chunks and user query.
   - Perform vector cosine similarity search to retrieve the top $K$ relevant chunks.
   - Inject chunks into the prompt context with strict instructions to answer only from context.
