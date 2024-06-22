import 'package:flutter/material.dart';
import '../../data/models/yugioh_card.dart';
import '../../domain/usecases/get_yugioh_cards.dart';

class YugiohCardProvider with ChangeNotifier {
  final GetYugiohCards getYugiohCards;
  List<YugiohCard> _cards = [];
  List<YugiohCard> _selectedCards = [];
  bool _isLoading = false;
  int _currentPage = 0;

  YugiohCardProvider(this.getYugiohCards);

  List<YugiohCard> get cards => _cards;
  List<YugiohCard> get selectedCards => _selectedCards;
  bool get isLoading => _isLoading;
  int get currentPage => _currentPage;

  Future<void> fetchCards() async {
    _isLoading = true;
    notifyListeners();

    try {
      _cards = await getYugiohCards();
    } catch (e) {
      print('Failed to load cards: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void addCardToSelected(int index) {
    if (_selectedCards.length < 5) {
      _selectedCards.add(_cards[index]);
      notifyListeners();
    }
  }

  void removeSelectedCard(int index) {
    _selectedCards.removeAt(index);
    notifyListeners();
  }

  void removeCard(int index) {
    _cards.removeAt(index);
    notifyListeners();
  }

  void addRandomCard() {
    if (_cards.isNotEmpty) {
      _selectedCards.add(_cards[_randomIndex()]);
      notifyListeners();
    }
  }

  void shuffleCards() {
    _cards.shuffle();
    notifyListeners();
  }

  void setCurrentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  int _randomIndex() {
    return (0 +
            (_cards.length - 1) *
                (new DateTime.now().millisecondsSinceEpoch % 1000) /
                1000)
        .round();
  }
}
