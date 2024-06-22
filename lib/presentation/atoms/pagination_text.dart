import 'package:flutter/material.dart';

class PaginationText extends StatelessWidget {
  final String text;

  const PaginationText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(54, 13, 5, 1.0),
      ),
    );
  }
}
