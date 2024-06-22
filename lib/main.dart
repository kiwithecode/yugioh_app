import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/services/yugioh_card_service.dart';
import 'data/repositories/yugioh_card_repository.dart';
import 'domain/usecases/get_yugioh_cards.dart';
import 'presentation/providers/yugioh_card_provider.dart';
import 'presentation/views/card_list_view.dart';

void main() {
  final yugiohCardService = YugiohCardService();
  final yugiohCardRepository = YugiohCardRepositoryImpl(yugiohCardService);
  final getYugiohCards = GetYugiohCards(yugiohCardRepository);

  runApp(MyApp(getYugiohCards: getYugiohCards));
}

class MyApp extends StatelessWidget {
  final GetYugiohCards getYugiohCards;

  MyApp({required this.getYugiohCards});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => YugiohCardProvider(getYugiohCards)..fetchCards(),
        ),
      ],
      child: MaterialApp(
        title: 'Yu-Gi-Oh Cards',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CardListView(),
        debugShowCheckedModeBanner: false, // Añadir esta línea
      ),
    );
  }
}
