import 'package:flutter/material.dart';
import '../../data/models/yugioh_card.dart';

class CardDetailView extends StatelessWidget {
  final YugiohCard card;

  CardDetailView({required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(card.imageUrl),
            SizedBox(height: 16.0),
            Text(
              card.desc,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text('Type: ${card.type}'),
            Text('Race: ${card.race}'),
            if (card.archetype != null) Text('Archetype: ${card.archetype}'),
          ],
        ),
      ),
    );
  }
}
