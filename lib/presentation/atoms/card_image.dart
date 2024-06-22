import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String imageUrl;

  CardImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty
        ? Image.network(imageUrl, fit: BoxFit.cover)
        : Container(color: Colors.grey);
  }
}
