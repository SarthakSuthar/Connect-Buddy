import 'package:connect_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordChangeSuccessScreen extends StatefulWidget {
  const PasswordChangeSuccessScreen({super.key});

  @override
  State<PasswordChangeSuccessScreen> createState() =>
      _PasswordChangeSuccessScreenState();
}

class _PasswordChangeSuccessScreenState
    extends State<PasswordChangeSuccessScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      context.go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Image.asset('assets/images/logo.png'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                'Password Changed Successfully',
                style: AppTheme.largeBold,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Text(
                'Your password has been changed successfuly',
                style: AppTheme.smallLite,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
