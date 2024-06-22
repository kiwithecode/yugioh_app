import 'package:flutter/material.dart';

class DeleteButtonAtom extends StatelessWidget {
  final VoidCallback onPressed;

  const DeleteButtonAtom({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onPressed,
      ),
    );
  }
}
