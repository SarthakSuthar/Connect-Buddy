import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:connect_buddy/widgets/app_date_picker.dart';
import 'package:connect_buddy/widgets/app_dropdown.dart';
import 'package:connect_buddy/widgets/app_image_picker.dart';
import 'package:connect_buddy/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterAlumni extends StatefulWidget {
  const RegisterAlumni({super.key});

  @override
  State<RegisterAlumni> createState() => _RegisterAlumniState();
}

class _RegisterAlumniState extends State<RegisterAlumni> {
  bool? isWhatsappNo = false;

  DateTime selectedDate = DateTime.now();
  DateTime selectedEndYear = DateTime.now();

  String? selectedGender;
  String? selectedBloodGroup;
  String? selectedCity;
  String? selectedCountry;
  String? selectedDegree;
  String? selectedUniversity;
  String? selectedCollege;
  String? selectedSkill;
  String? selectedDesignation;

  List<String> genderList = ['Male', 'Female', 'Other'];
  List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  List<String> citiesList = [
    'Delhi',
    'Mumbai',
    'Kolkata',
    'Chennai',
    'Bangalore',
  ];
  List<String> countriesList = [
    'India',
    'USA',
    'Canada',
    'Australia',
    'Germany',
  ];
  List<String> degreeList = ['B.Tech', 'M.Tech', 'B.Sc'];
  List<String> universityList = [
    'Delhi University',
    'Mumbai University',
    'Kolkata University',
  ];
  List<String> collegeList = [
    'Delhi College',
    'Mumbai College',
    'Kolkata College',
  ];
  List<String> skillsList = ['Flutter', 'Java', 'Python'];
  List<String> designationList = ['Developer', 'Designer', 'Tester'];

  final fields = [
    'firstName',
    'middleName',
    'lastName',
    'email',
    'mobile',
    'gender',
    'dob',
    'bloodGroup',
    'profilePhoto',
    'city',
    'country',
    'facebookLink',
    'profileLink1',
    'profileLink2',
    'profileLink3',
    'degree',
    'endYear',
    'university',
    'college',
    'summary',
    'totalExperience',
    'keySkills',
    'designation',
  ];

  final Map<String, TextEditingController> controller = {};
  final Map<String, FocusNode> focusNode = {};

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Image.asset('assets/images/logo.png'),

                const SizedBox(height: 10),

                const Text(
                  "Registration For Alumni",
                  style: AppTheme.largeBold,
                ),

                const SizedBox(height: 20),

                AppInput(
                  title: "Middle Name",
                  hint: "Enter Middle Name",
                  controller: controller['middleName']!,
                  focusNode: focusNode['middleName']!,
                ),

                AppInput(
                  title: "Last Name",
                  hint: "Enter Last Name",
                  controller: controller['middleName']!,
                  focusNode: focusNode['middleName']!,
                ),

                AppInput(
                  title: "Email",
                  hint: "Enter Email Address",
                  controller: controller['middleName']!,
                  focusNode: focusNode['middleName']!,
                ),

                AppInput(
                  title: "Mobile",
                  hint: "Enter Mobile Number",
                  controller: controller['middleName']!,
                  focusNode: focusNode['middleName']!,
                ),

                Row(
                  children: [
                    Checkbox(
                      value: isWhatsappNo,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isWhatsappNo = newValue;
                        });
                      },
                    ),
                    const Text("Is It Whatsapp No.?"),
                  ],
                ),

                AppDropdown(
                  title: "Gender",
                  hint: "Select Gender",
                  itemList: genderList,
                ),

                AppDatePicker(
                  title: "Date of Birth",
                  hint: "Select Date of Birth",
                  yearOnly: false,
                  onDateSelected: (date) {
                    selectedDate = date;
                    showlog("Selected Date: $selectedDate");
                  },
                ),

                AppDropdown(
                  title: "Blood Group",
                  hint: "Select Blood Group",
                  itemList: bloodGroups,
                ),

                //TODO: image oicker
                AppImagePicker(
                  title: "Profile Image",
                  hint: "Tap to upload image",
                  onImageSelected: (file) {
                    if (file != null) {
                      showlog("Selected image path: ${file.path}");
                    }
                  },
                ),

                AppInput(
                  title: "Profile Photo",
                  hint: "Select Profile Photo",
                  controller: controller['profilePhoto']!,
                  focusNode: focusNode['profilePhoto']!,
                ),

                AppDropdown(
                  title: "City",
                  hint: "Select City",
                  itemList: citiesList,
                ),

                AppDropdown(
                  title: "Country",
                  hint: "Select Country",
                  itemList: countriesList,
                ),

                AppInput(
                  title: "Facebook Link (Optional)",
                  hint: "Enter Facebook Link",
                  controller: controller['facebookLink']!,
                  focusNode: focusNode['facebookLink']!,
                ),

                AppInput(
                  title: "Profile Links",
                  hint: "Enter Facebook Link",
                  controller: controller['profileLink1']!,
                  focusNode: focusNode['profileLink1']!,
                ),

                AppInput(
                  title: "",
                  hint: "Enter Linkedin Link",
                  controller: controller['profileLink2']!,
                  focusNode: focusNode['profileLink2']!,
                ),

                AppInput(
                  title: "",
                  hint: "Enter Twitter Link",
                  controller: controller['profileLink3']!,
                  focusNode: focusNode['profileLink3']!,
                ),

                const SizedBox(height: 30),

                Row(
                  children: [
                    const Text(
                      "Educational Details",
                      style: AppTheme.mediumBold,
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: const CircleBorder(),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                educationDetail(),

                const SizedBox(height: 30),

                Row(
                  children: [
                    const Text(
                      "Professional Details",
                      style: AppTheme.mediumBold,
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: const CircleBorder(),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                professionalDetail(),

                const SizedBox(height: 30),

                AppButton(
                  text: "Submit",
                  onTap: () {
                    context.go('/registrationSuccess');
                    showlog("Submit button pressed");
                  },
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a Member?", style: AppTheme.smallRegular),
                    TextButton(
                      onPressed: () => context.go('/login'),
                      child: Text("Login Now", style: AppTheme.smallBold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget educationDetail() {
    return Column(
      children: [
        AppDropdown(
          title: "Degree",
          hint: "Select Degree",
          itemList: degreeList,
        ),

        AppDatePicker(
          title: "End Year",
          hint: "Select End Year",
          yearOnly: true,
          onDateSelected: (date) {
            selectedEndYear = date;
            showlog("Selected End Year: $selectedEndYear");
          },
        ),

        AppDropdown(
          title: "University/Board",
          hint: "Select University/Board",
          itemList: universityList,
        ),

        AppDropdown(
          title: "College/School",
          hint: "Select College/School",
          itemList: collegeList,
        ),
      ],
    );
  }

  Widget professionalDetail() {
    return Column(
      children: [
        AppInput(
          title: "Summary",
          hint: "Enter Summary",
          controller: controller['summary']!,
          focusNode: focusNode['summary']!,
          minLine: 5,
        ),

        AppInput(
          title: "Total Experience",
          hint: "Enter Total Experience",
          controller: controller['totalExperience']!,
          focusNode: focusNode['totalExperience']!,
        ),

        AppDropdown(
          hint: "Select Skill",
          title: "Key Skills",
          itemList: skillsList,
        ),

        AppDropdown(
          hint: "Select Designation",
          title: "Designation",
          itemList: designationList,
        ),
      ],
    );
  }
}
