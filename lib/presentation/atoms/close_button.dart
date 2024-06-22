import 'package:flutter/material.dart';

class CloseButtonAtom extends StatelessWidget {
  final VoidCallback onPressed;

  CloseButtonAtom({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -10,
      top: -10,
      child: IconButton(
        icon: Icon(Icons.close, color: Colors.red),
        onPressed: onPressed,
      ),
    );
  }
}
