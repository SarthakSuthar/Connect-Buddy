import 'package:connect_buddy/login/bloc/login_bloc.dart';
import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:connect_buddy/widgets/app_input.dart';
import 'package:connect_buddy/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final emailController = TextEditingController();
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
              controller: emailController,
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

            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  context.push("/home");
                  appSnackBar(
                    context,
                    message: "Login successful",
                    isError: false,
                  );
                } else if (state is LoginFailure) {
                  appSnackBar(message: "Login failed", isError: true, context);
                  showlog("Login failed");
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const CircularProgressIndicator();
                  }
                  return AppButton(
                    text: "Login",
                    onTap: () {
                      showlog("Login button pressed");

                      //TODO: have to check for validation by wraping below into if condition

                      context.read<LoginBloc>().add(
                        LoginBtnPressed(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                  );
                },
              ),
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
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      context.push("/home");
                      appSnackBar(
                        context,
                        message: "Login successful",
                        isError: false,
                      );
                    } else if (state is LoginFailure) {
                      appSnackBar(
                        message: "Google Sign in failed",
                        isError: true,
                        context,
                      );
                      showlog("Google Login failed");
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        CircularProgressIndicator();
                      }

                      return GestureDetector(
                        onTap: () {
                          showlog("Google button pressed");
                          context.read<LoginBloc>().add(GoogleBtnPressed());
                        },
                        child: Image.asset("assets/images/gmail_icon.png"),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member yet? "),
                InkWell(
                  onTap: () {
                    context.push("/registrationList");
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
