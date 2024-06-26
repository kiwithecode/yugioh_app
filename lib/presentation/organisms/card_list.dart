import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/yugioh_card_provider.dart';
import '../molecules/selected_card_item.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    final yugiohCardProvider = Provider.of<YugiohCardProvider>(context);

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: yugiohCardProvider.selectedCards.length,
        itemBuilder: (context, index) {
          final card = yugiohCardProvider.selectedCards[index];
          return Container(
            width: 140,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 12, 11, 11),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  spreadRadius: 5,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: SelectedCardItem(
              imageUrl: card.imageUrl,
              onRemove: () => yugiohCardProvider.removeSelectedCard(index),
            ),
          );
        },
      ),
    );
  }
}
