import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model
class Article {
  final String id;
  final String title;
  const Article({required this.id, required this.title});
}

// Repository Interface
abstract class ArticleRepository {
  Future<List<Article>> fetchArticles();
  Future<void> addArticle(String title);
}

// Repository Provider
final articleRepositoryProvider = Provider<ArticleRepository>((ref) {
  throw UnimplementedError(); // Override in ProviderScope
});

// AsyncNotifier Implementation
class ArticleListNotifier extends AsyncNotifier<List<Article>> {
  @override
  FutureOr<List<Article>> build() async {
    // Initial fetch triggered automatically
    final repo = ref.read(articleRepositoryProvider);
    return await repo.fetchArticles();
  }

  Future<void> refreshArticles() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(articleRepositoryProvider);
      return await repo.fetchArticles();
    });
  }

  Future<void> addNewArticle(String title) async {
    final repo = ref.read(articleRepositoryProvider);
    // Optimistic or guarded update
    state = await AsyncValue.guard(() async {
      await repo.addArticle(title);
      return await repo.fetchArticles();
    });
  }
}

// Provider Declaration
final articleListProvider =
    AsyncNotifierProvider<ArticleListNotifier, List<Article>>(
  ArticleListNotifier.new,
);
