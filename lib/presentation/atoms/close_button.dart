import 'package:flutter/material.dart';

class CloseButtonAtom extends StatelessWidget {
  final VoidCallback onPressed;

  const CloseButtonAtom({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -5,
      top: -5,
      child: IconButton(
        icon: const Icon(Icons.cancel, color: Colors.red),
        onPressed: onPressed,
      ),
    );
  }
}
