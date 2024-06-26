import 'package:flutter/material.dart';
import '../atoms/card_image.dart';
import '../atoms/delete_button.dart';

class CardDisplay extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onDelete;

  const CardDisplay({
    super.key,
    required this.imageUrl,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CardImage(imageUrl: imageUrl),
        DeleteButtonAtom(onPressed: onDelete),
      ],
    );
  }
}
