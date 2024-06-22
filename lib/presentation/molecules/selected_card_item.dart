import 'package:flutter/material.dart';
import '../atoms/card_image.dart';
import '../atoms/close_button.dart';

class SelectedCardItem extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onRemove;

  const SelectedCardItem({
    super.key,
    required this.imageUrl,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CardImage(imageUrl: imageUrl),
        CloseButtonAtom(onPressed: onRemove),
      ],
    );
  }
}
