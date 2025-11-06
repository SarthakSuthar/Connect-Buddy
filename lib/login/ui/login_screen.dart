import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:connect_buddy/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    final loginFocus = FocusNode();
    final passwordFocus = FocusNode();
    final obscureText = true;
    final enabled = true;
    final loginController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 20),
            Text("Login", style: AppTheme.largeBold),
            const SizedBox(height: 20),

            AppInput(
              title: "User Id",
              hint: "Enter User Id",
              controller: loginController,
              focusNode: loginFocus,
              enabled: enabled,
            ),

            AppInput(
              title: "Password",
              hint: "Enter Password",
              controller: passwordController,
              focusNode: passwordFocus,
              obscureText: obscureText,
              enabled: enabled,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isRememberMe,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isRememberMe = newValue;
                        });
                      },
                    ),
                    const Text("Remember Me"),
                  ],
                ),

                InkWell(
                  onTap: () {
                    context.push("/forgotPassword");
                  },
                  child: Text("Forgot Password?"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            AppButton(
              text: "Login",
              onTap: () {
                showlog("Login button pressed");
              },
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("OR"),
                ),
                const Expanded(child: Divider()),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/facebook_icon.png"),
                const SizedBox(width: 10),
                Image.asset("assets/images/linkedin_icon.png"),
                const SizedBox(width: 10),
                Image.asset("assets/images/gmail_icon.png"),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member yet? "),
                InkWell(
                  onTap: () {
                    showlog("Sign up button pressed");
                  },
                  child: Text(
                    "Register",

                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
