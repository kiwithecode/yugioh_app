import 'package:flutter/material.dart';
import '../../data/models/yugioh_card.dart';
import '../organisms/card_detail_content.dart';

class CardDetailView extends StatelessWidget {
  final YugiohCard card;

  const CardDetailView({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: CardDetailContent(
            title: card.name,
            type: card.type,
            race: card.race,
            archetype: card.archetype ?? '',
            description: card.desc,
            imageUrl: card.imageUrl,
          ),
        ),
      ),
    );
  }
}
