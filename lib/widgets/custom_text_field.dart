import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool isPasswordField;
  final AutovalidateMode autovalidate;
  final TextEditingController controller;
  final bool isUsernameField;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onSaved,
    this.validator,
    required this.keyboardType,
    this.isPasswordField = false,
    required this.autovalidate,
    required this.controller,
    this.isUsernameField = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        if(isUsernameField)
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]'))
      ],
      cursorHeight: 20,
      obscureText: isPasswordField,
      autovalidateMode: autovalidate,
      validator: validator,
      controller: controller,
      style: TextStyle(fontSize: 20, color: Colors.black),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 16),
        border: OutlineInputBorder(),
        focusedBorder: outLineInputBorder(
          const Color.fromARGB(255, 115, 237, 180),
          2,
        ),
        enabledBorder: outLineInputBorder(
          const Color.fromARGB(255, 103, 185, 226),
          1,
        ),
      ),
    );
  }

  OutlineInputBorder outLineInputBorder(Color color, width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}