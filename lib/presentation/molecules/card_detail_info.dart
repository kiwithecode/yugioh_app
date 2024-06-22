import 'package:flutter/material.dart';
import '../atoms/title_text.dart';
import '../atoms/description_text.dart';

class CardDetailInfo extends StatelessWidget {
  final String title;
  final String type;
  final String race;
  final String archetype;
  final String description;

  const CardDetailInfo({
    Key? key,
    required this.title,
    required this.type,
    required this.race,
    required this.archetype,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: TitleText(title: title),
        ),
        const SizedBox(height: 4.0),
        Center(
          child: RichText(
            text: TextSpan(
              text: 'Type: ',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: type,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Center(
          child: RichText(
            text: TextSpan(
              text: 'Race: ',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: race,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (archetype.isNotEmpty)
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Archetype: ',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: archetype,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 16.0),
        DescriptionText(description: description),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
