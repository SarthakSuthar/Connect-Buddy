import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:connect_buddy/widgets/app_input.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddJob extends StatefulWidget {
  const AddJob({super.key});

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {
  Map<String, TextEditingController> controller = {};
  Map<String, FocusNode> focusNode = {};

  final fields = [
    'title',
    'compName',
    'noOfExpReq',
    'approxCTC',
    'jobLocation',
    'jobDesc',
    'url',
    'email',
    'mobileNo',
    'subTopic',
  ];

  @override
  void initState() {
    super.initState();
    for (var field in fields) {
      controller[field] = TextEditingController();
      focusNode[field] = FocusNode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Jobs",
      showBackButton: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Post a Job", style: AppTheme.mediumBold),

              const SizedBox(height: 10),
              AppInput(
                title: "Title",
                hint: "Enter Title",
                controller: controller['title']!,
                focusNode: focusNode['title']!,
              ),
              const SizedBox(height: 10),
              AppInput(
                title: "Company Name",
                hint: "Enter Company Name",
                controller: controller['compName']!,
                focusNode: focusNode['compName']!,
              ),
              const SizedBox(height: 10),
              AppInput(
                title: "No. of Exp required",
                hint: "Enter Experience",
                controller: controller['noOfExpReq']!,
                focusNode: focusNode['noOfExpReq']!,
              ),
              const SizedBox(height: 10),
              AppInput(
                title: "Approximate CTC",
                hint: "Enter Approx CTC",
                controller: controller['approxCTC']!,
                focusNode: focusNode['approxCTC']!,
              ),
              const SizedBox(height: 10),
              AppInput(
                title: "Job Location",
                hint: "Enter Job Location",
                controller: controller['jobLocation']!,
                focusNode: focusNode['jobLocation']!,
              ),
              const SizedBox(height: 10),
              AppInput(
                title: "Job Description",
                hint: "Enter Job Description",
                controller: controller['jobDesc']!,
                focusNode: focusNode['jobDesc']!,
              ),
              const SizedBox(height: 10),
              AppInput(
                title: "URL",
                hint: "Enter URL",
                controller: controller['url']!,
                focusNode: focusNode['url']!,
              ),
              const SizedBox(height: 10),
              AppInput(
                title: "Email",
                hint: "Enter Email",
                controller: controller['email']!,
                focusNode: focusNode['email']!,
              ),
              const SizedBox(height: 10),
              AppInput(
                title: "Mobile Number",
                hint: "Enter Mobile Number",
                controller: controller['mobileNo']!,
                focusNode: focusNode['mobileNo']!,
              ),
              const SizedBox(height: 10),
              AppInput(
                title: "Subtopic",
                hint: "Enter Subtopic",
                controller: controller['subTopic']!,
                focusNode: focusNode['subTopic']!,
              ),

              const SizedBox(height: 20),

              AppButton(
                text: "Post",
                onTap: () {
                  // context.pushReplacement(
                  //   '/findJobList',
                  //   extra: FindJobListParams(
                  //     isPostJobList: true,
                  //     isFindJobList: false,
                  //     isAppliedList: false,
                  //     isAppliedByMeList: false,
                  //     isPostedByMeList: false,
                  //   ),
                  // );
                  context.pop();
                  showlog("Post button pressed!");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
