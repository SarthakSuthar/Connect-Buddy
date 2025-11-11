import 'package:connect_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool obscureText;
  final bool enabled;
  const AppInput({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    required this.focusNode,
    this.obscureText = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 20),
              Text(title, style: AppTheme.smallBold),
            ],
          ),
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            obscureText: obscureText,
            enabled: enabled,
            style: const TextStyle(
              color: Colors.black,
            ), // ensure text color is black
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white, // white background
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ), // grey border when enabled
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor, // colored border when focused
                  width: 1.5,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ), // grey when disabled
              ),
            ),
          ),
        ],
      ),
    );
  }
}
