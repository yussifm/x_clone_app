import 'package:flutter/material.dart';
import 'package:x_clone_app/features/auth/views/Sign_up_view.dart';
import 'package:x_clone_app/features/auth/views/login_view.dart';
import 'package:x_clone_app/theme/appTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X_Clone',
      theme: AppTheme.theme,
      home: const SignUpView(),
    );
  }
}
