import 'package:connect_buddy/jobs/ui/find_job_list.dart';
import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileDashboard extends StatelessWidget {
  const ProfileDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Profile",
      isPrimaryColor: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset("assets/images/profile.png"),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ms. Monali Patel", style: AppTheme.largeBold),
                    Text("monalipatel@gmail.com"),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                profileCard(
                  title: "My Profile",
                  icon: Icons.person,
                  onTap: () {
                    context.push('/myProfile');
                    showlog("My Profile taped");
                  },
                ),

                Divider(color: AppColors.dividerColor),

                profileCard(
                  title: "Job Posted by Me",
                  icon: Icons.note_add,
                  onTap: () {
                    context.push(
                      '/findJobList',
                      extra: FindJobListParams(
                        isPostJobList: false,
                        isFindJobList: false,
                        isAppliedList: false,
                        isAppliedByMeList: false,
                        isPostedByMeList: true,
                      ),
                    );
                    showlog("Job Posted by Me tapped");
                  },
                ),

                Divider(color: AppColors.dividerColor),

                profileCard(
                  title: "Job Applied by Me",
                  icon: Icons.person,
                  onTap: () {
                    context.push(
                      '/findJobList',
                      extra: FindJobListParams(
                        isPostJobList: false,
                        isFindJobList: false,
                        isAppliedList: false,
                        isAppliedByMeList: true,
                        isPostedByMeList: false,
                      ),
                    );
                    showlog("Job Applied by Me taped");
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget profileCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Icon(icon, color: AppColors.primaryColor, size: 25),
                SizedBox(width: 20),
                Text(
                  title,
                  style: AppTheme.mediumBold.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
