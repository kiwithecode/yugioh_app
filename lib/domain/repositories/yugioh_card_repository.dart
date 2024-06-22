import '../../data/models/yugioh_card.dart';

abstract class YugiohCardRepository {
  Future<List<YugiohCard>> getYugiohCards();
}
