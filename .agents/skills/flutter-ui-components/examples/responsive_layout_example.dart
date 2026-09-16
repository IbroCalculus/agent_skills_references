import 'package:flutter/material.dart';

class ResponsiveHomeScreen extends StatelessWidget {
  const ResponsiveHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Feed')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
            // Desktop: 3 columns
            return _buildGrid(columns: 3);
          } else if (constraints.maxWidth > 600) {
            // Tablet: 2 columns
            return _buildGrid(columns: 2);
          } else {
            // Mobile: 1 column list
            return _buildList();
          }
        },
      ),
    );
  }

  Widget _buildGrid({required int columns}) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: 12,
      itemBuilder: (context, index) => Card(
        child: Center(child: Text('Card #$index')),
      ),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 12,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) => ListTile(
        tileColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text('Item #$index'),
        subtitle: const Text('Mobile layout view'),
      ),
    );
  }
}
