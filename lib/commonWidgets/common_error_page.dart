import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String error;
  const ErrorText({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}

class ErrorTextPage extends StatelessWidget {
  final String error;
  const ErrorTextPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorText(
        error: error,
      ),
    );
  }
}
