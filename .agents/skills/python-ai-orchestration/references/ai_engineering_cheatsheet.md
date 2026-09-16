# AI Engineering & RAG Cheatsheet

## The 4 Essential AI Patterns
1. **Chat & Multi-Turn Conversations**: Maintain message history (`system`, `user`, `assistant`).
2. **Structured Outputs**: Pass Pydantic model directly to ensure deterministic JSON extraction.
3. **Streaming**: Stream chunks asynchronously to UI to minimize Time To First Token (TTFT).
4. **Tool Calling**: Allow LLM to choose external tools, run them safely in your backend, and supply the result back.

## RAG Flow in 5 Steps
1. **Load**: Read source documents (PDF, Markdown, TXT, HTML).
2. **Chunk**: Split text into semantic overlapping windows (e.g. 500-1000 characters).
3. **Embed**: Convert chunks into high-dimensional vectors via embedding model.
4. **Retrieve**: Compute cosine similarity between query embedding and chunk vectors; take top $K$.
5. **Generate**: Supply retrieved context in system/user prompt to produce a grounded response.
