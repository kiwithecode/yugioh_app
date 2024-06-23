import 'package:flutter/material.dart';
import '../../data/models/yugioh_card.dart';
import '../../domain/usecases/get_yugioh_cards.dart';

class YugiohCardProvider with ChangeNotifier {
  final GetYugiohCards getYugiohCards;
  List<YugiohCard> _cards = [];
  final List<YugiohCard> _selectedCards = [];
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

  void addCardToSelected(int index, BuildContext context) {
    if (_selectedCards.length < 5) {
      _selectedCards.add(_cards[index]);
      notifyListeners();
    } else {
      showMaxSelectionAlert(context);
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

  void addRandomCard(BuildContext context) {
    if (_selectedCards.length < 5) {
      if (_cards.isNotEmpty) {
        _selectedCards.add(_cards[_randomIndex()]);
        notifyListeners();
      }
    } else {
      showMaxSelectionAlert(context);
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
                (DateTime.now().millisecondsSinceEpoch % 1000) /
                1000)
        .round();
  }

  void showMaxSelectionAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Maximum Selection Reached'),
        content: const Text('You can only select up to 5 cards.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
