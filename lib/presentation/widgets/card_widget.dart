import 'package:flutter/material.dart';
import '../../data/models/yugioh_card.dart';

class CardWidget extends StatelessWidget {
  final YugiohCard card;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const CardWidget({
    super.key,
    required this.card,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 20,
              spreadRadius: 5,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: card.imageUrl.isNotEmpty
                  ? Stack(
                      children: [
                        Image.network(
                          card.imageUrl,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: onDelete,
                          ),
                        ),
                      ],
                    )
                  : Container(color: Colors.grey),
            ),
            const SizedBox(height: 8.0),
            Text(card.name),
          ],
        ),
      ),
    );
  }
}
