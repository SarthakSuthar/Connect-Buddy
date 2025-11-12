import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AchievementsList extends StatelessWidget {
  const AchievementsList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Achievements",
      showBackButton: true,
      body: SingleChildScrollView(
        child: Column(
          children: [const SizedBox(height: 16), achievementsWidget(context)],
        ),
      ),
    );
  }

  Widget achievementsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true, // ✅ Important
        physics: const NeverScrollableScrollPhysics(), // ✅ Prevent inner scroll
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return achievementsListWidget(context, index);
        },
      ),
    );
  }

  Widget achievementsListWidget(BuildContext context, int index) {
    return InkWell(
      onTap: () => context.push('/achiDetails'),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/archivement.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color: Colors.black.withValues(alpha: 0.4),
              ),
              child: const Text(
                "Achievement Title",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
