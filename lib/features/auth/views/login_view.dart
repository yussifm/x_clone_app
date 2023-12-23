import 'package:flutter/material.dart';
import 'package:x_clone_app/commonWidgets/common_rounded_sm_btn.dart';
import 'package:x_clone_app/features/auth/widgets/auth_field.dart';
import 'package:x_clone_app/theme/palette.dart';
import 'package:x_clone_app/utils/Ui_utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final appBar = UIUtils.appBar();
  var emailTxtController = TextEditingController();
  var passwordTxtController = TextEditingController();

  @override
  void dispose() {
    emailTxtController.dispose();
    passwordTxtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
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
                  text: const TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Palette.whiteColor,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(
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
    );
  }
}
