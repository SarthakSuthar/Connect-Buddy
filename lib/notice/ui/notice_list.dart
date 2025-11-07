import 'package:connect_buddy/notice/bloc/notice_bloc.dart';
import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:connect_buddy/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        child: BlocListener<NoticeBloc, NoticeState>(
          listener: (context, state) {
            if (state is NoticeListError) {
              appSnackBar(
                context,
                message: "Error loading notices",
                isError: true,
              );
              showlog("Error loading notices:${state.message}");
            }
          },
          child: BlocBuilder<NoticeBloc, NoticeState>(
            builder: (context, state) {
              if (state is NoticeListLoading) {
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              } else if (state is NoticeListLoaded) {
                return ListView.separated(
                  itemCount: 5,
                  itemBuilder: (context, index) =>
                      noticeCard(context, index: index),
                  separatorBuilder: (context, index) =>
                      Divider(color: AppColors.dividerColor),
                );
              } else {
                return const SizedBox.shrink(); // Return an empty widget for other states
              }
            },
          ),
        ),
      ),
    );
  }

  Widget noticeCard(BuildContext context, {required int index}) {
    return InkWell(
      onTap: () {
        showlog("taped notice id : $index");
        context.push('/noticeDetail/:$index');
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
