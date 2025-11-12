import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:connect_buddy/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final FocusNode passwordFocusNode = FocusNode();
    final FocusNode confirmPasswordFocusNode = FocusNode();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            Text("Enter Password", style: AppTheme.largeBold),
            SizedBox(height: 40),

            AppInput(
              title: "Enter Password",
              hint: "Enter New Password",
              controller: passwordController,
              focusNode: passwordFocusNode,
              enabled: true,
            ),
            AppInput(
              title: "Re-enter Password",
              hint: "Re-enter New Password",
              controller: confirmPasswordController,
              focusNode: confirmPasswordFocusNode,
              enabled: true,
            ),

            const SizedBox(height: 20),

            AppButton(
              text: "Continue",
              onTap: () {
                context.go('/passChangeSuccess');
                showlog("Continue button pressed");
              },
            ),
          ],
        ),
      ),
    );
  }
}
