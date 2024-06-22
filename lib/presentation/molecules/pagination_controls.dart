import 'package:flutter/material.dart';
import '../atoms/pagination_text.dart';
import '../atoms/navigation_button.dart';

class PaginationControls extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const PaginationControls({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.onPrevious,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NavigationButton(icon: Icons.arrow_back_ios, onPressed: onPrevious),
        PaginationText(text: '$currentPage / $totalPages'),
        NavigationButton(icon: Icons.arrow_forward_ios, onPressed: onNext),
      ],
    );
  }
}
