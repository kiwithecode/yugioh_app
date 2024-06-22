import 'package:flutter/material.dart';
import '../../data/models/yugioh_card.dart';
import '../atoms/card_image.dart';

import '../views/card_detail_view.dart';

class DetailCardPageView extends StatelessWidget {
  final PageController pageController;
  final List<YugiohCard> cards;

  DetailCardPageView({required this.pageController, required this.cards});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
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
                    child: card.imageUrl.isNotEmpty
                        ? Stack(
                            children: [
                              CardImage(
                                imageUrl: card.imageUrl,
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                right: 0,
                                child: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    // Eliminar la carta
                                  },
                                ),
                              ),
                            ],
                          )
                        : Container(color: Colors.grey),
                  ),
                  SizedBox(height: 8.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
