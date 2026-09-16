import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Count: $_count'),
        ),
        floatingActionButton: FloatingActionButton(
          key: const Key('counter_fab'),
          onPressed: () => setState(() => _count++),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

void main() {
  testWidgets('increments counter on floating button tap', (tester) async {
    await tester.pumpWidget(const CounterScreen());

    expect(find.text('Count: 0'), findsOneWidget);
    expect(find.text('Count: 1'), findsNothing);

    await tester.tap(find.byKey(const Key('counter_fab')));
    await tester.pump();

    expect(find.text('Count: 1'), findsOneWidget);
  });
}
