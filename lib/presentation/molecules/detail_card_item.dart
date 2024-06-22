import 'package:flutter/material.dart';

class DetailCardItem extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  DetailCardItem({
    required this.imageUrl,
    this.width = 200,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 20,
                spreadRadius: 5,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8.0),
      ],
    );
  }
}
