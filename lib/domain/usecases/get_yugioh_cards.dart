import '../../data/models/yugioh_card.dart';
import '../repositories/yugioh_card_repository.dart';

class GetYugiohCards {
  final YugiohCardRepository repository;

  GetYugiohCards(this.repository);

  Future<List<YugiohCard>> call() async {
    return await repository.getYugiohCards();
  }
}
