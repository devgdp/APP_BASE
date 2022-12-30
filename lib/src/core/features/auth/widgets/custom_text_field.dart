import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String)? validator;
  final bool obscureText;
  final TextInputType textInputType;

  const CustomTextField({
    super.key,
    this.hint,
    this.controller,
    this.validator,
    required this.obscureText,
    required this.textInputType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
      child: TextFormField(
        controller: widget.controller,
        validator: (value) => widget.validator!(value ?? ''),
        obscureText: widget.obscureText,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16)),
          hintText: widget.hint,
        ),
      ),
    );
  }
}
