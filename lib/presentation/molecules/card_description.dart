import 'package:flutter/material.dart';
import '../atoms/text_styles.dart';

class CardDescription extends StatelessWidget {
  final String description;

  const CardDescription({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description.replaceAll('•', '\n•'),
      style: TextStyles.body,
      textAlign: TextAlign.justify,
    );
  }
}
