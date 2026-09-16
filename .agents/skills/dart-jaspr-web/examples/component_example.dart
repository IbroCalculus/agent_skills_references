import 'package:jaspr/jaspr.dart';

class CounterCard extends StatefulComponent {
  const CounterCard({super.key});

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  int count = 0;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'card',
      styles: Styles.box(
        padding: EdgeInsets.all(16.px),
        border: Border.all(BorderSide.solid(color: Colors.gray, width: 1.px)),
        radius: BorderRadius.circular(8.px),
      ),
      [
        h2([text('Interactive Counter')]),
        p([text('Current count: $count')]),
        button(
          onClick: () => setState(() => count++),
          [text('Increment (+1)')],
        ),
      ],
    );
  }
}
