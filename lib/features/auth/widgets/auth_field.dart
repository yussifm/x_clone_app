import 'package:flutter/material.dart';
import 'package:x_clone_app/theme/palette.dart';

class AuthFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const AuthFormField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Palette.whiteColor,
            width: 3,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 18),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Palette.blueColor,
            width: 3,
          ),
        ),
      ),
    );
  }
}
