import 'package:flutter/material.dart';

class DetailCloseButton extends StatelessWidget {
  final VoidCallback onPressed;

  DetailCloseButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: onPressed,
    );
  }
}
