import 'package:connect_buddy/home/widgets/home_screen_widget.dart';
import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const SizedBox(),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset("assets/images/profile.png", height: 50),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Welcome"), Text("Ms. Monali Patel")],
            ),
          ],
        ),
        actions: [
          Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: const Icon(Icons.menu),
              ),
            ),
          ),
        ],
      ),
      endDrawer: const AppDrawer(),
      drawerScrimColor: Colors.transparent.withOpacity(0.1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                homeWidget(
                  context,
                  isSchool: true,
                  noOfAlumini: "25",
                  name: "Shreyas High School",
                ),
                homeWidget(
                  context,
                  isSchool: false,
                  noOfAlumini: "30",
                  name: "Parul University",
                ),
              ],
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Latest News", style: AppTheme.largeBold),
            ),

            const SizedBox(height: 10),

            newsWidget(context),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Achievements", style: AppTheme.largeBold),
            ),

            const SizedBox(height: 10),

            achievementsWidget(context),

            const SizedBox(height: 10),

            GestureDetector(
              onTap: () {
                showlog("see all tapped");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("See All ", style: AppTheme.mediumBold),
                  Icon(Icons.arrow_forward_outlined),
                ],
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
