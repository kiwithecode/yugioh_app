import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/yugioh_card_provider.dart';
import 'card_detail_view.dart';

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
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: yugiohCardProvider.selectedCards.length,
                        itemBuilder: (context, index) {
                          final card = yugiohCardProvider.selectedCards[index];
                          return Stack(
                            children: [
                              Container(
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
                                child: card.imageUrl.isNotEmpty
                                    ? Image.network(
                                        card.imageUrl,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(color: Colors.grey),
                              ),
                              Positioned(
                                right: -10,
                                top: -10,
                                child: IconButton(
                                  icon: Icon(Icons.close, color: Colors.red),
                                  onPressed: () {
                                    yugiohCardProvider
                                        .removeSelectedCard(index);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: yugiohCardProvider.cards.length,
                        itemBuilder: (context, index) {
                          final card = yugiohCardProvider.cards[index];
                          return AnimatedBuilder(
                            animation: _pageController,
                            builder: (context, child) {
                              double value = 1.0;
                              if (_pageController.position.haveDimensions) {
                                value = _pageController.page! - index;
                                value =
                                    (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                              }
                              return Center(
                                child: SizedBox(
                                  height:
                                      Curves.easeInOut.transform(value) * 400,
                                  width:
                                      Curves.easeInOut.transform(value) * 280,
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
                                    builder: (context) =>
                                        CardDetailView(card: card),
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
                                                Image.network(
                                                  card.imageUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  child: IconButton(
                                                    icon: Icon(Icons.delete,
                                                        color: Colors.red),
                                                    onPressed: () {
                                                      yugiohCardProvider
                                                          .removeCard(index);
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
                        onPageChanged: (index) {
                          yugiohCardProvider.setCurrentPage(index);
                        },
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
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
                          icon: Icon(Icons.arrow_forward),
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
