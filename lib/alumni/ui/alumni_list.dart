import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:connect_buddy/widgets/persom_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AlumniList extends StatefulWidget {
  const AlumniList({super.key, this.noOfEmployee});

  final int? noOfEmployee;

  @override
  State<AlumniList> createState() => _AlumniListState();
}

class _AlumniListState extends State<AlumniList> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Alumni List",
      isPrimaryColor: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "25",
                    style: AppTheme.largeBold.copyWith(
                      color: Color(0xFF2481B1),
                    ),
                  ),
                  TextSpan(
                    text: " Alumni from Shreyas High School",
                    style: AppTheme.mediumRegular,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            searchBox(),

            Text("4 search result found"),

            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    PersomListCard(isOpenToWork: true),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(child: Text("Search Box"));
  }
}
