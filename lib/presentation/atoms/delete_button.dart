import 'package:flutter/material.dart';

class DeleteButtonAtom extends StatelessWidget {
  final VoidCallback onPressed;

  DeleteButtonAtom({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: onPressed,
      ),
    );
  }
}
