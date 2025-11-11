import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:connect_buddy/widgets/persom_list_card.dart';
import 'package:flutter/material.dart';

class InterestedCandidatesList extends StatelessWidget {
  const InterestedCandidatesList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Jobs",
      showBackButton: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              Text("Interested Candidates", style: AppTheme.largeBold),

              const SizedBox(height: 20),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    PersomListCard(isOpenToWork: false),
                separatorBuilder: (context, index) =>
                    Divider(color: AppColors.dividerColor),
                itemCount: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
