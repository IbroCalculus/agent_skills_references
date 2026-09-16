import 'package:rad/rad.dart';

void main() {
  runApp(
    app: const AppRoot(),
    targetId: 'app_root',
  );
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Division(
      className: 'container',
      children: [
        Heading1(innerText: 'Rad Web Application'),
        Paragraph(innerText: 'Current count: $_counter'),
        Button(
          innerText: 'Increment',
          onClick: () => setState(() => _counter++),
        ),
      ],
    );
  }
}
