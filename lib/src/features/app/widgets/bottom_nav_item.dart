import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavItem extends StatelessWidget {
  final String label;
  final bool checked;
  final String icon;

  const BottomNavItem(
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
        children: [
          SvgPicture.asset(icon, color: Colors.white),
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
