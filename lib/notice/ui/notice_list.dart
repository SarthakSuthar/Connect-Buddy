import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoticeList extends StatelessWidget {
  const NoticeList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Notices",
      showBackButton: true,
      isPrimaryColor: false,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) => noticeCard(context),
          separatorBuilder: (context, index) =>
              Divider(color: AppColors.dividerColor),
        ),
      ),
    );
  }

  Widget noticeCard(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/noticeDetail');
        showlog("notice card tapped");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("08/11/2025", style: AppTheme.smallLite),
          Text("Lorem Ipsum dolor", style: AppTheme.mediumBold),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan varius arcu eu ullamcorper. Donec dapibus turpis in tristique blandit.",
            style: AppTheme.smallRegular,
          ),
        ],
      ),
    );
  }
}
