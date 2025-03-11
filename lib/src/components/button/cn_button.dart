import 'package:flutter/material.dart';

class CnButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CnButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
