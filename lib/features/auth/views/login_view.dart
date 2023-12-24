import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone_app/commonWidgets/common_loader.dart';
import 'package:x_clone_app/commonWidgets/common_rounded_sm_btn.dart';
import 'package:x_clone_app/features/auth/controllers/auth_controller.dart';
import 'package:x_clone_app/features/auth/views/Sign_up_view.dart';
import 'package:x_clone_app/features/auth/widgets/auth_field.dart';
import 'package:x_clone_app/theme/palette.dart';
import 'package:x_clone_app/core/utils/Ui_utils.dart';

class LoginView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final appBar = UIUtils.appBar();
  var emailTxtController = TextEditingController();
  var passwordTxtController = TextEditingController();

  @override
  void dispose() {
    emailTxtController.dispose();
    passwordTxtController.dispose();
    super.dispose();
  }

  void onSignIn() {
    ref.read(authControllerProvider.notifier).signIn(
          email: emailTxtController.text,
          password: passwordTxtController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: appBar,
      body: Visibility(
        visible: !isLoading,
        replacement: const Loader(),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  AuthFormField(
                    controller: emailTxtController,
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AuthFormField(
                    controller: passwordTxtController,
                    hintText: "Password",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CommonRoundedSmBtn(
                      onTap: () {},
                      label: "Done",
                      color: Palette.whiteColor,
                      txtColor: Palette.backgroundColor,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Palette.whiteColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign up",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                SignUpView.route(),
                              );
                            },
                          style: const TextStyle(
                            fontSize: 16,
                            color: Palette.blueColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
