import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class JobDetailParams {
  final bool isFindJob;

  JobDetailParams({this.isFindJob = false});
}

class JobDetail extends StatelessWidget {
  final bool isFindJob;
  const JobDetail({super.key, this.isFindJob = false});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "",
      showBackButton: true,
      isPrimaryColor: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            companyLogoContainer(context),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Senior Service Designer", style: AppTheme.largeBold),

                  const SizedBox(height: 10),

                  Text(
                    "L&T Limited",
                    style: AppTheme.mediumBold.copyWith(color: Colors.grey),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Text("Vadodara, Gujarat", style: AppTheme.smallRegular),

                      const SizedBox(width: 10),

                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Text("Full Time", style: AppTheme.smallRegular),
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        "Posted 1 Day Ago",
                        style: AppTheme.smallRegular.copyWith(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Text(
                        "25 Applicants",
                        style: AppTheme.smallRegular.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Text("Job Description", style: AppTheme.mediumBold),

                  const SizedBox(height: 10),

                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam gravida elit et velit sollicitudin iaculis. Fusce tincidunt urna quis tortor dapibus, ut fringilla libero pellentesque. ",
                    style: AppTheme.mediumRegular,
                  ),

                  const SizedBox(height: 20),

                  Text("Years of Experience", style: AppTheme.mediumBold),

                  const SizedBox(height: 10),

                  Text("1 - 3 yrs", style: AppTheme.mediumRegular),

                  const SizedBox(height: 20),

                  Text("Approx CTC", style: AppTheme.mediumBold),

                  const SizedBox(height: 10),

                  Text("2-3 lac P.A", style: AppTheme.mediumRegular),

                  const SizedBox(height: 20),

                  Text("URL", style: AppTheme.mediumBold),

                  const SizedBox(height: 10),

                  Text("www.google.com", style: AppTheme.mediumRegular),

                  const SizedBox(height: 20),

                  Text("Email", style: AppTheme.mediumBold),

                  const SizedBox(height: 10),

                  Text("dummyemail@mail.com", style: AppTheme.mediumRegular),

                  const SizedBox(height: 20),

                  Text("Phone Number", style: AppTheme.mediumBold),

                  const SizedBox(height: 10),

                  Text("+91 23568 23658", style: AppTheme.mediumRegular),

                  const SizedBox(height: 20),

                  Text("Subtopic", style: AppTheme.mediumBold),

                  const SizedBox(height: 10),

                  Text(
                    "Nam vel blandit ex. Nulla pharetra felis ut sapien facilisis, sollicitudin eleifend quam viverra. Nam rhoncus, dui eu porttitor semper.",
                    style: AppTheme.mediumRegular,
                  ),

                  const SizedBox(height: 40),
                  if (isFindJob)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                          text: "Apply Now",
                          onTap: () {
                            showlog("apply now pressed");
                          },
                        ),
                      ],
                    ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget companyLogoContainer(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(100),
              child: Image.asset(
                'assets/images/company_logo.png',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
