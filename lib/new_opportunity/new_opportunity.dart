import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class NewOpportunity extends StatelessWidget {
  const NewOpportunity({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "New Opportunity",
      showBackButton: true,
      isPrimaryColor: false,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => opportunityCard(
            context,
            position: "Senior Softawre Developer",
            address: "Vadodara, Gujarat",
            onTap: () {
              showlog("$index th opportunity card tapped");
            },
          ),
        ),
      ),
    );
  }

  Widget opportunityCard(
    BuildContext context, {
    required String position,
    required String address,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.dividerColor),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset("assets/images/company_logo.png"),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(position, style: AppTheme.mediumBold),
                Text(address, style: AppTheme.smallLite),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
