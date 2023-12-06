import 'package:flutter/material.dart';

class AuthInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType inputType;
  final String labelText;
  final String? Function(String?)? validator;
  final void Function()? onTapPrefixIcon;
  final Widget? prefixText;

  const AuthInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.inputType,
    required this.labelText,
    this.validator,
    this.onTapPrefixIcon,
    this.prefixText,
  });

  @override
  State<AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.055),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          prefixIcon: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.016),
            child: InkWell(
              onTap: widget.onTapPrefixIcon,
              child: widget.prefixText,
            ),
          ),
          labelText: widget.labelText,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          // fillColor: Colors.grey.shade200,
          filled: true,
        ),
      ),
    );
  }
}
