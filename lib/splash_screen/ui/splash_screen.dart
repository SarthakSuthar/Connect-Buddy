import 'package:connect_buddy/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashScreenBloc, SplashScreenState>(
      listener: (context, state) {
        if (state is NavigateToHome) {
          context.go('/home');
        } else if (state is NavigateToLogin) {
          context.go('/login');
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset("assets/images/logo.png"),
                  const SizedBox(height: 20),
                  Text(
                    "A Smarter Way to Stay in Touch",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  Image.asset("assets/images/splash_screen.png"),
                  const Spacer(),
                  if (state is SplashScreenLoading)
                    const CircularProgressIndicator()
                  else
                    AppButton(
                      text: "Get Started",
                      onTap: () {
                        context.read<SplashScreenBloc>().add(AppStarted());
                      },
                    ),
                  const Spacer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
