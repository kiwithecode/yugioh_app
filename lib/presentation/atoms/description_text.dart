import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String description;

  const DescriptionText({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description.replaceAll('•', '\n•'),
      style: const TextStyle(fontSize: 16),
      textAlign: TextAlign.justify, // Justificar el contenido
    );
  }
}
