import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/constants/constants.dart';
import '../providers/yugioh_card_provider.dart';
import '../organisms/card_list.dart';
import '../organisms/card_page_view.dart';
import '../atoms/elevated_action_button.dart';
import '../atoms/icon_button.dart';
import '../atoms/app_bar.dart';

class CardListView extends StatelessWidget {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  CardListView({super.key});

  @override
  Widget build(BuildContext context) {
    final yugiohCardProvider = Provider.of<YugiohCardProvider>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Yu-Gi-Oh Cards'),
      body: yugiohCardProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : yugiohCardProvider.cards.isEmpty
              ? const Center(child: Text('No data'))
              : Column(
                  children: [
                    const SizedBox(height: 8.0),
                    const CardList(),
                    const SizedBox(height: 16.0),
                    CardPageView(pageController: _pageController),
                    const SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButton(
                          icon: Icons.arrow_back_ios,
                          onPressed: () {
                            if (yugiohCardProvider.currentPage > 0) {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                        Text(
                          '${yugiohCardProvider.currentPage + 1} / ${yugiohCardProvider.cards.length}',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: secondaryColor),
                        ),
                        CustomIconButton(
                          icon: Icons.arrow_forward_ios,
                          onPressed: () {
                            if (yugiohCardProvider.currentPage <
                                yugiohCardProvider.cards.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedActionButton(
                          text: 'Add Random Card',
                          onPressed: () {
                            yugiohCardProvider.addRandomCard(context);
                          },
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedActionButton(
                          text: 'Shuffle Cards',
                          onPressed: () {
                            yugiohCardProvider.shuffleCards();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
    );
  }
}
