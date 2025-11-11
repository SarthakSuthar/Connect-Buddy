import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:flutter/material.dart';

class AppDropdown extends StatefulWidget {
  final String hint;
  final List<String> itemList;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const AppDropdown({
    super.key,
    required this.hint,
    required this.itemList,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.dividerColor),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.all(8),
      child: DropdownButton<String>(
        isDense: true,
        isExpanded: true,
        value: selectedValue,
        hint: Text(widget.hint),
        underline: const SizedBox(),
        items: widget.itemList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
          if (newValue != null && widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
          showlog("selected value : $newValue");
        },
      ),
    );
  }
}
