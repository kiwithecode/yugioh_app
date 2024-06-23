import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugioh_app/presentation/atoms/title_text.dart';
import '../molecules/card_detail_info.dart';
import '../molecules/detail_card_item.dart';
import '../utils/inverted_wave_clipper.dart';
import '../providers/yugioh_card_provider.dart';
import '../../data/models/yugioh_card.dart';

class CardDetailContent extends StatelessWidget {
  final String title;
  final String type;
  final String race;
  final String archetype;
  final String description;
  final String imageUrl;
  final YugiohCard card;

  const CardDetailContent({
    Key? key,
    required this.title,
    required this.type,
    required this.race,
    required this.archetype,
    required this.description,
    required this.imageUrl,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final yugiohCardProvider = Provider.of<YugiohCardProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: InvertedWaveClipper(),
              child: Container(
                height: 500,
                color: const Color.fromRGBO(54, 13, 5, 1.0),
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(233, 222, 199, 1.0),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: TitleText(title: title),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (yugiohCardProvider.selectedCards.length < 5) {
                        yugiohCardProvider.addCardToSelected(
                          yugiohCardProvider.cards.indexOf(card),
                          context,
                        );
                      } else {
                        yugiohCardProvider.showMaxSelectionAlert(context);
                      }
                    },
                    color: const Color.fromRGBO(233, 222, 199, 1.0),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 150,
              left: MediaQuery.of(context).size.width * 0.25,
              child: DetailCardItem(
                imageUrl: imageUrl,
                width: 200,
                height: 300,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            color: const Color.fromRGBO(233, 222, 199, 1.0),
            padding: const EdgeInsets.all(16.0),
            child: CardDetailInfo(
              title: title,
              type: type,
              race: race,
              archetype: archetype,
              description: description,
            ),
          ),
        ),
      ],
    );
  }
}
