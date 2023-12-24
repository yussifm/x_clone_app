import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_app/apis/auth_api.dart';
import 'package:x_clone_app/core/utils/showsnapBar.dart';
import 'package:x_clone_app/features/Home/views/home_view.dart';
import 'package:x_clone_app/features/auth/views/login_view.dart';
import 'package:appwrite/models.dart' as model;

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(authAPIProvider));
});

final currentUserAccountProvider = FutureProvider<model.User?>((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  AuthController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  Future<model.User?> currentUser() async {
    return await _authAPI.currentUserAccount();
  }

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.signUp(
      email: email,
      password: password,
    );

    res.fold((l) {
      ShowSnackBar(
        context: context,
        msg: l.message,
      );
    }, (r) {
      ShowSnackBar(
        context: context,
        msg: "Account created, Continue to login",
      );
      Navigator.push(
        context,
        LoginView.route(),
      );
    });
    state = false;
  }

  void signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.signIn(
      email: email,
      password: password,
    );

    res.fold((l) {
      ShowSnackBar(
        context: context,
        msg: l.message,
      );
    }, (r) {
      Navigator.push(context, HomeView.route());
    });
    state = false;
  }
}
