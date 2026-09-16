# LangChain.dart RAG Pipeline Guide

## Pipeline Architecture

```
Raw Documents (Markdown / PDF / Text)
               │
               ▼
RecursiveCharacterTextSplitter (Chunks with Overlap)
               │
               ▼
Embeddings Model (Vectors)
               │
               ▼
Vector Store (Indexed in Memory / Supabase / ObjectBox)
               │
   Query ──────┴────► Similarity Search (Top-K Matches)
                           │
                           ▼
                    Context + Query Prompt
                           │
                           ▼
                       LLM Response
```

---

## Required Dependencies

```yaml
dependencies:
  langchain: ^0.7.0
  langchain_google: ^0.7.0
  langchain_openai: ^0.7.0
```
