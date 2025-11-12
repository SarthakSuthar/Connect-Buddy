import 'package:connect_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDatePicker extends StatefulWidget {
  final String title;
  final String hint;
  final DateTime? initialDate;
  final bool yearOnly;
  final Function(DateTime) onDateSelected;
  final bool enabled;

  const AppDatePicker({
    super.key,
    required this.hint,
    required this.onDateSelected,
    this.initialDate,
    this.title = "",
    this.yearOnly = false,
    this.enabled = true,
  });

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    // Step 1: Pick a full date normally (Flutter doesn't have native year-only picker)
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendar,
    );

    // Step 2: If a date is picked, store it
    if (picked != null) {
      final DateTime finalDate = widget.yearOnly
          ? DateTime(picked.year) // 👈 Keep only the year
          : picked;

      setState(() {
        selectedDate = finalDate;
      });

      widget.onDateSelected(finalDate);
    }
  }

  Future<void> _selectYear(BuildContext context) async {
    // 👇 This manually shows a dialog to pick only a year
    final currentYear = DateTime.now().year;
    final selected = await showDialog<int>(
      context: context,
      builder: (context) {
        int tempSelected = selectedDate?.year ?? currentYear;
        return AlertDialog(
          title: const Text("Select Year"),
          content: SizedBox(
            width: double.maxFinite,
            height: 250,
            child: YearPicker(
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              selectedDate: DateTime(tempSelected),
              onChanged: (DateTime dateTime) {
                Navigator.pop(context, dateTime.year);
              },
            ),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedDate = DateTime(selected);
      });
      widget.onDateSelected(DateTime(selected));
    }
  }

  @override
  Widget build(BuildContext context) {
    final String displayText = selectedDate != null
        ? (widget.yearOnly
              ? DateFormat('yyyy').format(selectedDate!) // 👈 Only year
              : DateFormat('dd MMM yyyy').format(selectedDate!))
        : widget.hint;

    return InkWell(
      onTap: widget.enabled
          ? () => widget.yearOnly
                ? _selectYear(context) // 👈 open custom year picker
                : _selectDate(context)
          : null,
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(widget.title, style: AppTheme.smallBold),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      displayText,
                      style: AppTheme.smallBold.copyWith(
                        color: selectedDate != null
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ),
                  const Icon(Icons.calendar_today, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
