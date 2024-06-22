import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/yugioh_card_provider.dart';
import '../molecules/card_item.dart';
import '../views/card_detail_view.dart';

class CardPageView extends StatelessWidget {
  final PageController pageController;

  CardPageView({required this.pageController});

  @override
  Widget build(BuildContext context) {
    final yugiohCardProvider = Provider.of<YugiohCardProvider>(context);

    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: yugiohCardProvider.cards.length,
        itemBuilder: (context, index) {
          final card = yugiohCardProvider.cards[index];
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double value = 1.0;
              if (pageController.position.haveDimensions) {
                value = pageController.page! - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
              }
              return Center(
                child: SizedBox(
                  height: Curves.easeInOut.transform(value) * 400,
                  width: Curves.easeInOut.transform(value) * 280,
                  child: child,
                ),
              );
            },
            child: GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity! < 0) {
                  yugiohCardProvider.addCardToSelected(index);
                }
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardDetailView(card: card),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(8.0),
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
                child: Column(
                  children: [
                    Expanded(
                      child: CardItem(
                        imageUrl: card.imageUrl,
                        onDelete: () => yugiohCardProvider.removeCard(index),
                      ),
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
          );
        },
        onPageChanged: (index) {
          yugiohCardProvider.setCurrentPage(index);
        },
      ),
    );
  }
}