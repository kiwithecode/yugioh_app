import 'package:flutter/material.dart';
import '../molecules/card_info.dart';
import '../molecules/card_description.dart';
import '../../data/models/yugioh_card.dart';

class CardDetail extends StatelessWidget {
  final YugiohCard card;

  const CardDetail({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CardInfo(label: 'Type', value: card.type),
        ),
        const SizedBox(height: 4.0),
        Center(
          child: CardInfo(label: 'Race', value: card.race),
        ),
        if (card.archetype != null)
          Center(
            child: CardInfo(label: 'Archetype', value: card.archetype!),
          ),
        const SizedBox(height: 16.0),
        CardDescription(description: card.desc),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
