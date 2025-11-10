import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class AlumniDetail extends StatelessWidget {
  const AlumniDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: '',
      showBackButton: true,
      isPrimaryColor: true,
      isAlumniDetail: true,
      body: Column(
        children: [
          profilePicContainer(context),

          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Rahul Patel", style: AppTheme.largeRegular),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent[400],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 4.0,
                        ),
                        child: Text("Open To Work", style: AppTheme.smallBold),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  "L&T Limited",
                  style: AppTheme.smallLite.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam gravida elit et velit sollicitudin iaculis. Fusce tincidunt urna quis tortor dapibus, ut fringilla libero pellentesque. ",
                ),

                const SizedBox(height: 20),

                Text(
                  "School Name",
                  style: AppTheme.smallLite.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "Shreyas High School",
                  style: AppTheme.smallBold.copyWith(fontSize: 15),
                ),

                const SizedBox(height: 20),

                Text(
                  "Graduation College",
                  style: AppTheme.smallLite.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "Parul University",
                  style: AppTheme.smallBold.copyWith(fontSize: 15),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      text: "Connect",
                      onTap: () {
                        showlog("Connect button pressed");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget profilePicContainer(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.primaryColor,
              height: MediaQuery.of(context).size.height / 10,
            ),
            Container(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(100),
              child: Image.asset(
                'assets/images/alumni_profile.png',
                scale: 1.5,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
