import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;

  const CardImage({
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
