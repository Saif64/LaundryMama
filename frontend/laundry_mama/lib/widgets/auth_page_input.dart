import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AuthInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType inputType;
  final String labelText;
  final String? Function(String?)? validator;

  const AuthInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.inputType,
    required this.labelText,
    this.validator,
  });

  @override
  State<AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
  Country _selectedCountry = Country(
      phoneCode: "880",
      countryCode: "BD",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Bangladesh",
      example: "Bangladesh",
      displayName: "Bangladesh",
      displayNameNoCountryCode: "BD",
      e164Key: "");

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
              onTap: () {
                showCountryPicker(
                  context: context,
                  countryListTheme: CountryListThemeData(
                      bottomSheetHeight:
                          MediaQuery.of(context).size.height * 0.55),
                  onSelect: (value) {
                    setState(() {
                      _selectedCountry = value;
                    });
                  },
                );
              },
              child: AutoSizeText(
                '${_selectedCountry.flagEmoji} +${_selectedCountry.phoneCode}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
