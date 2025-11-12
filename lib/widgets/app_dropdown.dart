import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:flutter/material.dart';

class AppDropdown extends StatefulWidget {
  final String hint;
  final List<String> itemList;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? title;

  const AppDropdown({
    super.key,
    required this.hint,
    required this.itemList,
    this.initialValue,
    this.onChanged,
    this.title,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null && widget.title!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(widget.title ?? "", style: AppTheme.smallBold),
            )
          else
            const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.all(12),
            child: DropdownButton<String>(
              isDense: true,
              isExpanded: true,
              value: selectedValue,
              hint: Text(
                widget.hint,
                style: AppTheme.smallBold.copyWith(color: Colors.grey),
              ),
              underline: const SizedBox(),
              items: widget.itemList.map<DropdownMenuItem<String>>((
                String value,
              ) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
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
          ),
        ],
      ),
    );
  }
}
