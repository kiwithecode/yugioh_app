import 'package:flutter/material.dart';
import '../../data/models/yugioh_card.dart';
import '../organisms/card_detail.dart';
import '../molecules/detail_card_item.dart';

class CardDetailView extends StatelessWidget {
  final YugiohCard card;

  const CardDetailView({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: InvertedWaveClipper(),
                    child: Container(
                      height: 500,
                      color: const Color.fromRGBO(54, 13, 5, 1.0),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color.fromRGBO(233, 222, 199, 1.0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              card.name,
                              style: const TextStyle(
                                color: Color.fromRGBO(233, 222, 199, 1.0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: MediaQuery.of(context).size.width * 0.25,
                    child: DetailCardItem(
                      imageUrl: card.imageUrl,
                      width: 200,
                      height: 300,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  color: const Color.fromRGBO(233, 222, 199, 1.0),
                  padding: const EdgeInsets.all(16.0),
                  child: CardDetail(card: card),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InvertedWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    var firstControlPoint = Offset(size.width / 4, size.height - 150);
    var firstEndPoint = Offset(size.width / 2, size.height - 170);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 190);
    var secondEndPoint = Offset(size.width, size.height - 160);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
