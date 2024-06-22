import '../../domain/repositories/yugioh_card_repository.dart';
import '../models/yugioh_card.dart';
import '../services/yugioh_card_service.dart';

class YugiohCardRepositoryImpl implements YugiohCardRepository {
  final YugiohCardService service;

  YugiohCardRepositoryImpl(this.service);

  @override
  Future<List<YugiohCard>> getYugiohCards() async {
    return await service.fetchCards();
  }
}
