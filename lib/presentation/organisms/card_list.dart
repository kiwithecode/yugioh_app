import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/yugioh_card_provider.dart';
import '../molecules/selected_card_item.dart';

class CardList extends StatelessWidget {
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
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
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
