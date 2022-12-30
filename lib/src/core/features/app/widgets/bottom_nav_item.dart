import 'package:flutter/material.dart';

class BottomNavitem extends StatelessWidget {
  final String label;
  final bool checked;
  final Icon icon;

  const BottomNavitem(
      {super.key,
      required this.label,
      this.checked = false,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: (checked) ? 1 : 0.7,
      child: Column(
        children: [Text(label)],
      ),
    );
  }
}
