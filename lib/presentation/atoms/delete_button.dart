import 'package:flutter/material.dart';

class DeleteButtonAtom extends StatelessWidget {
  final VoidCallback onPressed;

  const DeleteButtonAtom({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 3,
      child: Tooltip(
        message: 'This will delete the item from the list',
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        padding: EdgeInsets.all(10), // Increase the padding
        child: IconButton(
          icon: const Icon(Icons.delete_forever, color: Colors.red),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
