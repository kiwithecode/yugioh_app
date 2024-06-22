import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../shared/constants/api_constants.dart';
import '../models/yugioh_card.dart';

class YugiohCardService {
  Future<List<YugiohCard>> fetchCards() async {
    final response = await http.get(Uri.parse(APIConstants.cardsUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((card) => YugiohCard.fromJson(card)).toList();
    } else {
      throw Exception('Failed to load cards');
    }
  }
}
