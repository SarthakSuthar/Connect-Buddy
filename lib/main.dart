import 'package:connect_buddy/router/app_router.dart';
import 'package:connect_buddy/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:connect_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => SplashScreenBloc()..add(AppStarted()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: route,
      title: 'Connect Buddy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      themeMode: ThemeMode.light,
    );
  }
}
