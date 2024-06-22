import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const NavigationButton(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: const Color.fromRGBO(54, 13, 5, 1.0),
      onPressed: onPressed,
    );
  }
}
