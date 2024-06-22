import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/yugioh_card_provider.dart';
import '../organisms/card_list.dart';
import '../organisms/card_page_view.dart';

class CardListView extends StatelessWidget {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  CardListView({super.key});

  @override
  Widget build(BuildContext context) {
    final yugiohCardProvider = Provider.of<YugiohCardProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yu-Gi-Oh Cards'),
      ),
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
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: const Color.fromRGBO(54, 13, 5, 1.0),
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
                              color: Color.fromRGBO(54, 13, 5, 1.0)),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          color: const Color.fromRGBO(54, 13, 5, 1.0),
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
                        ElevatedButton(
                          onPressed: () {
                            yugiohCardProvider.addRandomCard();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF360D05),
                            foregroundColor: const Color(0xFFEBE3D0),
                          ),
                          child: const Text('Add Random Card'),
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            yugiohCardProvider.shuffleCards();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF360D05),
                            foregroundColor: const Color(0xFFEBE3D0),
                          ),
                          child: const Text('Shuffle Cards'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
    );
  }
}
