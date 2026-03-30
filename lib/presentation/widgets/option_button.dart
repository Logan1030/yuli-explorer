import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool isCorrect;

  const OptionButton({
    super.key,
    required this.text,
    required this.color,
    this.onTap,
    this.isSelected = false,
    this.isCorrect = false,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.white;
    Color borderColor = Colors.grey.shade300;
    Color textColor = color;

    if (isCorrect) {
      bgColor = Colors.green;
      borderColor = Colors.green;
      textColor = Colors.white;
    } else if (isSelected) {
      bgColor = Colors.red;
      borderColor = Colors.red;
      textColor = Colors.white;
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
