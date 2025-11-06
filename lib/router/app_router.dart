import 'package:connect_buddy/forgot_pass/ui/enter_otp.dart';
import 'package:connect_buddy/forgot_pass/ui/forgot_password.dart';
import 'package:connect_buddy/forgot_pass/ui/reset_password.dart';
import 'package:connect_buddy/home/ui/home_screen.dart';
import 'package:connect_buddy/login/bloc/login_bloc.dart';
import 'package:connect_buddy/login/ui/login_screen.dart';
import 'package:connect_buddy/registration/ui/registration_list.dart';
import 'package:connect_buddy/splash_screen/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter route = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => LoginBloc(),
          child: const LoginScreen(),
        );
      },
    ),
    GoRoute(path: '/signup', builder: (context, state) => Container()),
    GoRoute(
      path: '/forgotPassword',
      builder: (context, state) => const ForgotPassword(),
    ),
    GoRoute(path: '/enterOtp', builder: (context, state) => EnterOtp()),
    GoRoute(
      path: '/resetPassword',
      builder: (context, state) => ResetPassword(),
    ),
    GoRoute(
      path: '/registrationList',
      builder: (context, state) => RegistrationList(),
    ),
  ],

  // redirect: (context, state) {
  //   final splashState = context.read<SplashScreenBloc>().state;

  //   if (splashState is NavigateToLogin) return '/login';
  //   if (splashState is NavigateToHome) return '/home';
  //   return null; // stay on splash
  // },
);
