import 'package:flutter/material.dart';

class CommonRoundedSmBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  Color? color;
  Color? txtColor;
  double bRadius;
  double width;
  double hight;

  CommonRoundedSmBtn({
    super.key,
    required this.onTap,
    required this.label,
    this.color,
    this.txtColor,
      this.bRadius = 32,
      this.width = 100,
      this.hight = 40
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: hight,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(bRadius), color: color),
        child: Text(
          label,
          style: TextStyle(
            color: txtColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
