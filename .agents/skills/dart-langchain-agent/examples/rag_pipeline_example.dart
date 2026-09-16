import 'package:langchain/langchain.dart';
import 'package:langchain_google/langchain_google.dart';

void main() async {
  const apiKey = 'YOUR_API_KEY';

  // 1. Documents & Splitter
  const docs = [
    Document(pageContent: 'Antigravity IDE is an AI-powered coding tool by Google.'),
    Document(pageContent: 'Dart 3 introduces class modifiers like sealed, base, and final.'),
  ];

  final embeddings = GoogleGenerativeAIEmbeddings(apiKey: apiKey);
  final vectorStore = MemoryVectorStore(embeddings: embeddings);

  // 2. Ingest documents into vector store
  await vectorStore.addDocuments(documents: docs);

  // 3. Perform similarity retrieval
  final results = await vectorStore.similaritySearch(
    query: 'What class modifiers are in Dart 3?',
    config: const VectorStoreSimilaritySearch(k: 1),
  );

  print('Top Document Match:\n${results.first.pageContent}');
}
