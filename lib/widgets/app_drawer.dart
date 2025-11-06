import 'dart:ui';

import 'package:connect_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.8),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 30.0,
              sigmaY: 30.0,
              tileMode: TileMode.clamp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(child: Image.asset("assets/images/profile.png")),
                const SizedBox(height: 10),
                Text("Ms.Monali Patel", style: AppTheme.mediumBold),
                const Divider(),
                const SizedBox(height: 20),
                const Text("Notice", style: AppTheme.mediumRegular),
                const SizedBox(height: 10),
                const Text("Achievements", style: AppTheme.mediumRegular),
                const SizedBox(height: 10),
                const Text("New opportunities", style: AppTheme.mediumRegular),
                const SizedBox(height: 10),
                const Text("Payments", style: AppTheme.mediumRegular),
                const SizedBox(height: 10),
                const Text("Invite via Email", style: AppTheme.mediumRegular),
                const Spacer(),
                const Text("Logout", style: AppTheme.mediumBold),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
