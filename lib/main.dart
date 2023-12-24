import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_app/commonWidgets/common_error_page.dart';
import 'package:x_clone_app/commonWidgets/common_loader.dart';
import 'package:x_clone_app/features/Home/views/home_view.dart';
import 'package:x_clone_app/features/auth/controllers/auth_controller.dart';
import 'package:x_clone_app/features/auth/views/Sign_up_view.dart';
import 'package:x_clone_app/theme/appTheme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'X_Clone',
        theme: AppTheme.theme,
        home: ref.watch(currentUserAccountProvider).when(
              data: (user) {
                if (user != null) {
                  return const HomeView();
                }
                if (user == null) {
                  return const SignUpView();
                }
                return const SignUpView();
              },
              error: (e, t) {
                return ErrorTextPage(error: e.toString());
              },
              loading: () => const LoaderPage(),
            ));
  }
}
