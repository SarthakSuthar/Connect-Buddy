import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:connect_buddy/widgets/app_dropdown.dart';
import 'package:connect_buddy/widgets/app_input.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isEdit = false;

  Map<String, TextEditingController> controllers = {};
  Map<String, FocusNode> focusNodes = {};

  int? selectedYear;
  List<int> yearList = List.generate(
    DateTime.now().year - 1999,
    growable: false,
    (index) => 2000 + index,
  );

  List<String> genderList = ['Male', 'Female', 'Others'];
  List<String> degreeList = ['B.Tech', 'B.Arch', 'B.E'];
  List<String> uniList = ['Parul', 'Sigma', 'KPGU', 'MSU'];
  List<String> collegeList = ['1', '2', '3'];

  String? selectedGender;
  String? selectedDegree;
  String? selectedUni;
  String? selectedCollege;

  @override
  void initState() {
    super.initState();
    final fields = [
      'firstName',
      'middleName',
      'lastName',
      'email',
      'mobile',
      'gender',
      'dob',
      'bloodGroup',
      'city',
      'state',
      'country',
    ];
    for (var field in fields) {
      controllers[field] = TextEditingController();
      focusNodes[field] = FocusNode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "My Profile",
      showBackButton: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isEdit = true;
                    });
                  },
                  icon: Icon(Icons.edit),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                          'assets/images/alumni_profile.png',
                        ),
                      ),
                      if (isEdit)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Icon(Icons.camera_alt, color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Text("Personal Details", style: AppTheme.mediumBold),

              const SizedBox(height: 10),

              AppInput(
                title: "First Name",
                hint: "Mrs. Monali",
                controller: controllers['firstName']!,
                focusNode: focusNodes['firstName']!,
                enabled: isEdit,
              ),

              const SizedBox(height: 10),

              AppInput(
                title: "Middle Name",
                hint: "Patel",
                controller: controllers['middleName']!,
                focusNode: focusNodes['middleName']!,
                enabled: isEdit,
              ),

              const SizedBox(height: 10),

              AppInput(
                title: "Last Name",
                hint: "Patel",
                controller: controllers['lastName']!,
                focusNode: focusNodes['lastName']!,
                enabled: isEdit,
              ),

              const SizedBox(height: 10),

              AppInput(
                title: "Email",
                hint: "some@example.com",
                controller: controllers['email']!,
                focusNode: focusNodes['email']!,
                enabled: isEdit,
              ),

              const SizedBox(height: 10),

              AppInput(
                title: "Mobile",
                hint: "+91-9876543210",
                controller: controllers['mobile']!,
                focusNode: focusNodes['mobile']!,
                enabled: isEdit,
              ),

              const SizedBox(height: 10),

              // AppInput(
              //   title: "Gender",
              //   hint: "Male",
              //   controller: controllers['gender']!,
              //   focusNode: focusNodes['gender']!,
              //   enabled: isEdit,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("Gender", style: AppTheme.smallBold),
                  ),
                  AppDropdown(hint: "Female", itemList: genderList),
                ],
              ),

              const SizedBox(height: 10),

              AppInput(
                title: "Date of Birth",
                hint: "31/02/2000",
                controller: controllers['dob']!,
                focusNode: focusNodes['dob']!,
                enabled: isEdit,
              ),

              const SizedBox(height: 10),

              AppInput(
                title: "Blood Group",
                hint: "B +ve",
                controller: controllers['bloodGroup']!,
                focusNode: focusNodes['bloodGroup']!,
                enabled: isEdit,
              ),

              const SizedBox(height: 10),

              AppInput(
                title: "City",
                hint: "Vadodara",
                controller: controllers['city']!,
                focusNode: focusNodes['city']!,
                enabled: isEdit,
              ),

              const SizedBox(height: 10),

              AppInput(
                title: "State",
                hint: "Gujarat",
                controller: controllers['state']!,
                focusNode: focusNodes['state']!,
                enabled: isEdit,
              ),

              const SizedBox(height: 10),

              AppInput(
                title: "Country",
                hint: "India",
                controller: controllers['country']!,
                focusNode: focusNodes['country']!,
                enabled: isEdit,
              ),

              const SizedBox(height: 10),

              const Divider(),

              Row(
                children: [
                  Text("Education Details", style: AppTheme.mediumBold),

                  const Spacer(),

                  IconButton(
                    onPressed: () {
                      addEducationBottomSheet();
                      showlog("add button pressed");
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => educationDetailCard(
                  collegeName: "Parul University",
                  degreeName: "B.Tech",
                  passYear: 2020,
                ),
                separatorBuilder: (context, index) =>
                    const Divider(color: AppColors.dividerColor),
                itemCount: 2,
              ),

              // educationDetailCard(),
              const SizedBox(height: 10),

              const Divider(),

              Row(
                children: [
                  Text("Professional Details", style: AppTheme.mediumBold),

                  const Spacer(),

                  IconButton(
                    onPressed: () {
                      showlog("edit button pressed");
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => professionalDetailCard(
                  compName: "ABC",
                  designation: "Dev",
                  description:
                      "dvjlksdbvjlscbvmlsdfvbasdflivbsdfamv.bdfghadfvjk;nxdflkbjadf;bjkhdfbjndfs.lkvbsdflvmlsdfvbasdflivbsdfamv.bdfghadfvjk;nxdflkbjadf;bjkhdfbjndfs.lkvbsdflvmlsdfvbasdflivbsdfamv.bdfghadfvjk;nxdflkbjadf;bjkhdfbjndfs.lkvbsdflkmbnvjik;hdf'ljk",
                  skills: ["Flutter", "Dart"],
                ),
                separatorBuilder: (context, index) =>
                    const Divider(color: AppColors.dividerColor),
                itemCount: 3,
              ),

              const SizedBox(height: 30),

              if (isEdit)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      text: "Save",
                      onTap: () {
                        setState(() {
                          isEdit = false;
                        });
                        showlog("Save button pressed");
                      },
                    ),
                  ],
                ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget educationDetailCard({
    required String collegeName,
    required String degreeName,
    required int passYear,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(collegeName, style: AppTheme.mediumBold),
            if (isEdit)
              IconButton(
                //TODO: need to parse these values to bottomsheet
                onPressed: () => showlog("edit button pressed"),
                icon: Icon(Icons.edit),
              ),
          ],
        ),
        Text(degreeName),
        Text(passYear.toString()),
      ],
    );
  }

  Widget professionalDetailCard({
    required String compName,
    required String designation,
    required String description,
    required List<String> skills,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(compName, style: AppTheme.mediumBold),
            if (isEdit)
              IconButton(
                //TODO: need to parse these values to bottomsheet
                onPressed: () => showlog("edit button pressed"),
                icon: Icon(Icons.edit),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(designation), Text("2 yrs 4 mos")],
        ),
        const SizedBox(height: 10),
        Text(description),
        const SizedBox(height: 10),
        Text(skills.join(', ')),
      ],
    );
  }

  Future<void> addEducationBottomSheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (_, controller) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                    AppBar(
                      title: const Text("Add Education"),
                      centerTitle: true,
                      automaticallyImplyLeading: false,
                    ),

                    const Divider(color: AppColors.dividerColor),
                    const SizedBox(height: 20),

                    AppDropdown(
                      hint: "Select Degree",
                      itemList: degreeList,
                      onChanged: (value) => selectedDegree = value,
                    ),

                    const SizedBox(height: 20),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.dividerColor),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: DropdownButton<int>(
                        isDense: true,
                        isExpanded: true,
                        value: selectedYear,
                        underline: const SizedBox(),
                        hint: const Text("Select year"),
                        items: yearList.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(
                              year.toString(),
                              style: AppTheme.smallLite,
                            ),
                          );
                        }).toList(),
                        onChanged: (int? value) {
                          setState(() {
                            selectedYear = value;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    AppDropdown(
                      hint: "Select University/Board",
                      itemList: uniList,
                      onChanged: (value) => selectedUni = value,
                    ),

                    const SizedBox(height: 20),

                    AppDropdown(
                      hint: "Select College/School",
                      itemList: collegeList,
                      onChanged: (value) => selectedCollege = value,
                    ),

                    const SizedBox(height: 30),

                    AppButton(
                      text: "Add",
                      onTap: () => showlog("Add button tapped"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
