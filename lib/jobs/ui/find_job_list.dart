import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';

class FindJobListParams {
  final bool? isAppliedList;
  final bool? isFindJobList;
  final bool? isPostJobList;
  final bool? isPostedByMeList;
  final bool? isAppliedByMeList;

  FindJobListParams({
    this.isAppliedList,
    this.isFindJobList,
    this.isPostJobList,
    this.isPostedByMeList,
    this.isAppliedByMeList,
  });
}

class FindJobList extends StatefulWidget {
  final bool? isAppliedList;
  final bool? isFindJobList;
  final bool? isPostJobList;
  final bool? isPostedByMeList;
  final bool? isAppliedByMeList;
  const FindJobList({
    super.key,
    this.isAppliedList,
    this.isFindJobList,
    this.isPostJobList,
    this.isPostedByMeList,
    this.isAppliedByMeList,
  });

  @override
  State<FindJobList> createState() => _FindJobListState();
}

class _FindJobListState extends State<FindJobList> {
  // bool isPostJob = true;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.isAppliedByMeList!
          ? 'Jobs Applied'
          : widget.isPostedByMeList!
          ? 'Jobs Posted'
          : 'Jobs',
      showBackButton: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //search box
            if (widget.isAppliedByMeList != true &&
                widget.isPostedByMeList != true)
              if (widget.isPostJobList == true)
                Row(
                  children: [
                    Expanded(child: searchBox()),
                    const SizedBox(width: 10),
                    AppButton(
                      text: "ADD",
                      onTap: () => context.push('/addJob'),
                    ),
                  ],
                )
              else
                searchBox(),

            const SizedBox(height: 10),

            //search result text
            if (widget.isAppliedByMeList != true &&
                widget.isPostedByMeList != true)
              const Text("4 Results found"),

            const SizedBox(height: 20),

            // job list
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemBuilder: (context, index) =>
                    //  isPostJob
                    //     ?
                    Slidable(
                      enabled: widget.isPostJobList ?? false,
                      endActionPane: ActionPane(
                        extentRatio: 0.1,
                        motion: const ScrollMotion(),
                        children: [
                          Builder(
                            builder: (context) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => showlog("Edit button taped"),
                                    child: Icon(Icons.edit),
                                  ),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () => showlog("delete button taped"),
                                    child: Icon(Icons.delete),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),

                      child: jobListItem(
                        isApplied: widget.isAppliedList ?? false,
                        isFindJob: widget.isFindJobList ?? false,
                        isPostJob: widget.isPostJobList ?? false,
                        isAppliedByMeList: widget.isAppliedByMeList ?? false,
                        isPostedByMeList: widget.isPostedByMeList ?? false,
                      ),
                    ),
                // : jobListItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBox({bool isPostJob = false}) {
    return InkWell(
      onTap: () {
        showlog("job search box taped");
        searchBottomsheet(context, isPostedJob: widget.isPostJobList ?? false);
      },
      child: Container(
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.dividerColor),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(Icons.search, color: AppColors.dividerColor),
            Text("Search Job", style: AppTheme.smallLite),
            const Spacer(),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.dividerColor,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> searchBottomsheet(
    BuildContext context, {
    bool isPostedJob = false,
  }) {
    return showModalBottomSheet(
      context: context,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AppBar(
                  automaticallyImplyLeading: true,
                  title: Text("Job Search"),
                  centerTitle: true,
                ),
                const Divider(height: 2, color: AppColors.dividerColor),

                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.dividerColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Search by Name"),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.dividerColor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Search by Name"),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                if (isPostedJob)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.dividerColor),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Exp From"),
                              Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.dividerColor),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Exp To"),
                              Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.dividerColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Search by Name"),
                        Icon(Icons.keyboard_arrow_down_rounded),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),

                AppButton(
                  text: "Search",
                  onTap: () {
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget jobListItem({
    bool isFindJob = false,
    bool isPostJob = false,
    bool isApplied = false,
    bool isAppliedByMeList = false,
    bool isPostedByMeList = false,
  }) {
    return InkWell(
      onTap: () {
        context.push('/jobDetail');
        showlog("job list item pressed");
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.dividerColor),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/company_logo.png'),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Senior Service Designer", style: AppTheme.mediumBold),
                  const SizedBox(height: 10),
                  Text(
                    "Exp: 1 to 3 years",
                    style: AppTheme.smallLite.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Vadodara,Gujarat",
                    style: AppTheme.smallLite.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isAppliedByMeList)
                        Text(
                          "Applied 5m ago",
                          style: AppTheme.smallBold.copyWith(
                            color: Colors.grey,
                          ),
                        )
                      else
                        postTimeChip(),
                      jobStatus(
                        isFindJob: isFindJob,
                        isApplied: isApplied,
                        isPostJob: isPostJob,
                        isPostedByMeList: isPostedByMeList,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget postTimeChip() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFFFFD1AD),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        "1 Day Ago",
        style: AppTheme.smallBold.copyWith(color: Color(0xFFF4A465)),
      ),
    );
  }

  Widget jobStatus({
    bool isFindJob = false,
    bool isPostJob = false,
    bool isApplied = false,
    bool isPostedByMeList = false,
  }) {
    if (isFindJob) {
      return Row(
        children: [
          Checkbox(
            // activeColor: Colors.green,
            // side: BorderSide(color: Colors.green, width: 10),
            fillColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.green;
              }
              return Colors.green;
            }),
            side: BorderSide(width: 0, color: Colors.transparent),
            value: true,
            onChanged: (value) => setState(() {
              false;
            }),
          ),
          Text("Interested"),
        ],
      );
    } else if (isApplied) {
      return Text("Applied 2m ago");
    } else if (isPostJob || isPostedByMeList) {
      return GestureDetector(
        onTap: () {
          context.push('/interestedCandidatesList');
          showlog("view candidate pressed");
        },
        child: Text("View Candidetes"),
      );
    } else {
      return SizedBox();
    }
  }
}
