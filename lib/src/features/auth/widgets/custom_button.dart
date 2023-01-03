import 'package:flutter/material.dart';
import 'package:post/src/config/themes/app_colors.dart';

class CustomButton extends StatefulWidget {
  final Function onPressed;
  final String title;
  final double? width;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        height: 50,
        width: width > 600 ? width * .9 : width,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              FocusScopeNode currentFocus = FocusScope.of(context);
              currentFocus.unfocus();
              widget.onPressed();
            });
          },
          child: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}
