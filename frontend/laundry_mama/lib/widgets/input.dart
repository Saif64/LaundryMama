import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? labelText;
  final Icon prefixIcon;
  const Input({
    super.key,
    required this.controller,
    this.keyboardType,
    this.labelText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.055),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          filled: true,
        ),
      ),
    );
  }
}
