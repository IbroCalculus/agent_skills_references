import 'package:jaspr/jaspr.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'main-container',
      [
        header([
          nav([
            a(href: '/', [text('Home')]),
            a(href: '/about', [text('About')]),
          ]),
        ]),
        main_([
          h1([text('Welcome to Jaspr Web')]),
          p([text('A fast, SEO-friendly Dart web application.')]),
        ]),
        footer([
          p([text('Powered by Dart & Jaspr')]),
        ]),
      ],
    );
  }
}
