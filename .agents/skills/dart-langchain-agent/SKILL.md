---
name: dart-langchain-agent
description: Orchestrate LLM chains, Retrieval-Augmented Generation (RAG), vector embeddings, memory, and autonomous agents in pure Dart using LangChain.dart.
---

# LangChain.dart AI Orchestration & RAG

## Purpose

Guide the development of complex LLM pipelines, autonomous agents, and RAG systems in pure Dart using `langchain`. Covers document loaders, text chunk splitters, vector store indexing, conversational memory, and ReAct agent loops.

---

## Supporting Resources in this Skill

- **RAG Architecture Guide**: [`references/langchain_rag_guide.md`](./references/langchain_rag_guide.md)
- **Complete RAG Pipeline Implementation**: [`examples/rag_pipeline_example.dart`](./examples/rag_pipeline_example.dart)
- **Agent Chain Template**: [`templates/agent_tool_chain.dart.tpl`](./templates/agent_tool_chain.dart.tpl)

---

## Core LangChain.dart Modules

1. **LLMs & Chat Models**:
   - `ChatOpenAI`, `ChatGoogleGenerativeAI`, `ChatOllama` (Local).
2. **Prompts & Output Parsers**:
   - `PromptTemplate`, `ChatPromptTemplate`, `StringOutputParser`.
3. **Retrieval & Vector Stores**:
   - Split documents with `RecursiveCharacterTextSplitter`.
   - Embed with `OpenAIEmbeddings` or `GoogleGenerativeAIEmbeddings`.
   - Store & query with `MemoryVectorStore`, `SupabaseVectorStore`, or `ObjectBoxVectorStore`.
4. **Autonomous Agents**:
   - Use `AgentExecutor` with tools to let models decide what steps to execute.
