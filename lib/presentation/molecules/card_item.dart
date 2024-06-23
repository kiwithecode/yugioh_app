import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onDelete;

  const CardItem({
    required this.imageUrl,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(imageUrl),
        Positioned(
          right: -16,
          top: -15,
          child: Tooltip(
            message: 'Remove from list',
            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ),
        ),
      ],
    );
  }
}
