import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:flutter/material.dart';

Widget homeWidget(
  BuildContext context, {
  required bool isSchool,
  required String noOfAlumini,
  required String name,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.45,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: isSchool ? Color(0xFFE3F0FF) : Color(0xFFE6FFE3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            left: -25,
            top: -25,
            child: circleContainer(text: noOfAlumini, isSchool: isSchool),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              isSchool
                  ? "assets/images/school_img.png"
                  : "assets/images/college_img.png",
            ),
          ),
          Positioned(
            left: 10,
            bottom: 20,
            child: Text(
              "Proud Alumni \nfrom \n$name",
              style: AppTheme.smallBold.copyWith(
                color: Colors.black,
                height: 1.3,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget circleContainer({
  double size = 120,
  Color borderColor = Colors.transparent,
  double borderWidth = 0,
  required String text,
  required bool isSchool,
}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: isSchool ? Color(0xFF2481B1) : Color(0xFF008936),
      shape: BoxShape.circle,
      border: Border.all(color: borderColor, width: borderWidth),
    ),
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 40,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Jost',
      ),
    ),
  );
}

Widget newsWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.4,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey),
      ),
      child: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return newsListWidget();
        },
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
      ),
    ),
  );
}

Widget newsListWidget() {
  return InkWell(
    onTap: () {
      showlog("news widget tapped");
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("08/06/25", style: AppTheme.smallBold),
          SizedBox(height: 10),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras auctor iaculis tempus. ",
            style: AppTheme.smallRegular,
          ),
          SizedBox(height: 10),
          // Divider(),
        ],
      ),
    ),
  );
}

Widget achievementsWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 2,
        itemBuilder: (context, index) {
          return achievementsListWidget();
        },
      ),
    ),
  );
}

Widget achievementsListWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Image.asset("assets/images/archivement.png"),
          Positioned(bottom: 10, child: Text("Achivement title")),
        ],
      ),
    ),
  );
}
