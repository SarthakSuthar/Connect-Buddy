import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:connect_buddy/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final focusNode = FocusNode();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Image.asset("assets/images/logo.png"),
            SizedBox(height: 20),
            Text("Forgot Password", style: AppTheme.largeBold),
            SizedBox(height: 40),
            AppInput(
              title: "Mobile Number",
              hint: " +91 9876543210",
              controller: controller,
              focusNode: focusNode,
              enabled: true,
            ),
            SizedBox(height: 20),
            AppButton(
              text: "Send OTP",
              onTap: () {
                context.push('/enterOtp');
                showlog("Send OTP button pressed");
              },
            ),
          ],
        ),
      ),
    );
  }
}
