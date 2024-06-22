import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/yugioh_card_provider.dart';
import '../organisms/card_list.dart';
import '../organisms/card_page_view.dart';

class CardListView extends StatelessWidget {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    final yugiohCardProvider = Provider.of<YugiohCardProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Yu-Gi-Oh Cards'),
      ),
      body: yugiohCardProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : yugiohCardProvider.cards.isEmpty
              ? Center(child: Text('No data'))
              : Column(
                  children: [
                    SizedBox(height: 8.0),
                    CardList(),
                    SizedBox(height: 16.0),
                    CardPageView(pageController: _pageController),
                    SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            if (yugiohCardProvider.currentPage > 0) {
                              _pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                        Text(
                          '${yugiohCardProvider.currentPage + 1} / ${yugiohCardProvider.cards.length}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            if (yugiohCardProvider.currentPage <
                                yugiohCardProvider.cards.length - 1) {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            yugiohCardProvider.addRandomCard();
                          },
                          child: Text('Add Random Card'),
                        ),
                        SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            yugiohCardProvider.shuffleCards();
                          },
                          child: Text('Shuffle Cards'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
    );
  }
}
