import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:x_clone_app/features/auth/views/login_view.dart';
import 'package:x_clone_app/features/auth/widgets/auth_field.dart';
import 'package:x_clone_app/theme/theme.dart';
import 'package:x_clone_app/utils/Ui_utils.dart';

import '../../../commonWidgets/common_rounded_sm_btn.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    final appBar = UIUtils.appBar();
    var emailTxtController = TextEditingController();
    var passwordTxtController = TextEditingController();

    @override
    void dispose() {
      emailTxtController.dispose();
      passwordTxtController.dispose();
      super.dispose();
    }

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
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Palette.whiteColor,
                    ),
                    children: [
                      TextSpan(
                        text: "Log in",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
                              ),
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
    );
  }
}
