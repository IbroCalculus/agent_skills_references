import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Parameterized Family Provider with autoDispose
final itemDetailProvider =
    FutureProvider.autoDispose.family<Map<String, dynamic>, String>((ref, id) async {
  // Simulating network fetch
  await Future.delayed(const Duration(milliseconds: 300));
  return {'id': id, 'name': 'Item #$id', 'price': 99.99};
});

class ItemDetailScreen extends ConsumerWidget {
  final String itemId;
  const ItemDetailScreen({super.key, required this.itemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only re-runs build when this specific itemId resolves
    final detailAsync = ref.watch(itemDetailProvider(itemId));

    return Scaffold(
      appBar: AppBar(title: Text('Item $itemId')),
      body: detailAsync.when(
        data: (data) => Center(child: Text('${data['name']} - \$${data['price']}')),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Failed: $err')),
      ),
    );
  }
}
