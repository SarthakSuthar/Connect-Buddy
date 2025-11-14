import 'package:connect_buddy/new_opportunity/bloc/new_opportunity_bloc.dart';
import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:connect_buddy/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: BlocConsumer<NewOpportunityBloc, NewOpportunityState>(
          listener: (context, state) {
            if (state is NewOpportunityError) {
              appSnackBar(
                context,
                message: "Error loading new opportunities",
                isError: true,
              );
              showlog("Error loading new opportunities : ${state.message}");
            }
          },
          builder: (context, state) {
            if (state is NewOpportunityLoading) {
              return Scaffold(
                body: const Center(child: CircularProgressIndicator()),
              );
            } else if (state is NewOpportunityLoaded) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => opportunityCard(
                  context,
                  position: "Senior Softawre Developer",
                  address: "Vadodara, Gujarat",
                  onTap: () {
                    showlog("$index th opportunity card tapped");
                  },
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
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
            child: Image.asset("assets/images/company_logo.png", scale: 2.5),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  position,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.mediumBold,
                ),
                Text(
                  address,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.smallLite,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
