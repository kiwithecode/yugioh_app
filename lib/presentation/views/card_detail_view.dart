import 'package:flutter/material.dart';
import '../../data/models/yugioh_card.dart';
import '../molecules/detail_card_item.dart';

class CardDetailView extends StatelessWidget {
  final YugiohCard card;

  CardDetailView({required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      color: Colors.blueAccent,
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
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              card.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(width: 48),
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
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Type: ${card.type}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Center(
                      child: Text(
                        'Race: ${card.race}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    if (card.archetype != null)
                      Center(
                        child: Text(
                          'Archetype: ${card.archetype}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    SizedBox(height: 16.0),
                    Text(
                      card.desc,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16.0),
                  ],
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

    var firstControlPoint =
        Offset(size.width / 4, size.height - 150); // Cambia este valor
    var firstEndPoint =
        Offset(size.width / 2, size.height - 170); // Cambia este valor
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width * 3 / 4, size.height - 190); // Cambia este valor
    var secondEndPoint =
        Offset(size.width, size.height - 160); // Cambia este valor
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
