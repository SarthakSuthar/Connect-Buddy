import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class JobDashboard extends StatelessWidget {
  const JobDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Jobs",
      isPrimaryColor: false,
      showBackButton: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            jobButton(
              onTap: () => showlog("Post JOb tapped"),
              text: "Post a Job",
              icon: Icons.work,
              context: context,
            ),
            const SizedBox(height: 20),
            jobButton(
              onTap: () => showlog("Find JOb tapped"),
              text: "Find a Job",
              icon: Icons.search,
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget jobButton({
    required VoidCallback onTap,
    required String text,
    required IconData icon,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF288998), AppColors.primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 50),
            Text(text, style: AppTheme.largeBold.copyWith(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
