import 'package:flutter/material.dart';

void ShowSnackBar({required BuildContext context, required String msg}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
