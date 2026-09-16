import 'package:rad/rad.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final String description;

  const CustomCardWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Division(
      className: 'card-wrapper',
      children: [
        Heading2(innerText: title),
        Paragraph(innerText: description),
      ],
    );
  }
}
