import 'package:flutter/material.dart';
import '../atoms/text_styles.dart';

class CardInfo extends StatelessWidget {
  final String label;
  final String value;

  const CardInfo({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$label: ',
        style: TextStyles.subtitle,
        children: [
          TextSpan(
            text: value,
            style: TextStyles.body,
          ),
        ],
      ),
    );
  }
}
