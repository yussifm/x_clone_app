import 'package:flutter/material.dart';

class CommonRoundedSmBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  Color? color;
  Color? txtColor;

  CommonRoundedSmBtn({
    super.key,
    required this.onTap,
    required this.label,
    this.color,
    this.txtColor,
  });
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: txtColor,
          fontSize: 16,
        ),
      ),
      backgroundColor: color,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 2,
      ),
    );
  }
}
