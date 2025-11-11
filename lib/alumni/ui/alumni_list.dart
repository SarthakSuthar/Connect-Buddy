import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:connect_buddy/widgets/persom_list_card.dart';
import 'package:flutter/material.dart';

class AlumniList extends StatefulWidget {
  const AlumniList({super.key, this.noOfEmployee});

  final int? noOfEmployee;

  @override
  State<AlumniList> createState() => _AlumniListState();
}

class _AlumniListState extends State<AlumniList> {
  int? selectedYear;
  List<int> yearList = List.generate(
    DateTime.now().year - 1999,
    growable: false,
    (index) => 2000 + index,
  );

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Alumni List",
      isPrimaryColor: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

            const SizedBox(height: 10),

            Text("4 search result found"),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    PersomListCard(isOpenToWork: true),
                separatorBuilder: (context, index) =>
                    Divider(color: AppColors.dividerColor),
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.dividerColor),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search),
                hintText: "Search by Name",
                hintStyle: AppTheme.smallLite,
              ),
            ),
          ),

          Text("|", style: AppTheme.largeLite),

          SizedBox(
            child: DropdownButton<int>(
              isDense: true,
              value: selectedYear,
              hint: Text("Select year"),
              underline: const SizedBox(),
              items: yearList.map((int year) {
                return DropdownMenuItem<int>(
                  value: year.toInt(),
                  child: Text(year.toString(), style: AppTheme.smallLite),
                );
              }).toList(),
              onChanged: (int? value) {
                setState(() {
                  selectedYear = value;
                  showlog("Selected year = $selectedYear");
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
