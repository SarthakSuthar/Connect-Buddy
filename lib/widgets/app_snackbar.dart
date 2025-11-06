import 'package:flutter/material.dart';

void appSnackBar(
  BuildContext context, {
  required String message,
  required bool isError,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Jost',
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: isError ? Colors.redAccent : Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    ),
  );
}

// void showAppSnackBar(
//   BuildContext context, {
//   required String message,
//   required SnackBarType type,
// }) {
//   final colors = {
//     SnackBarType.success: Colors.green,
//     SnackBarType.error: Colors.redAccent,
//     SnackBarType.info: Colors.blue,
//     SnackBarType.warning: Colors.orangeAccent,
//   };

//   final icons = {
//     SnackBarType.success: Icons.check_circle,
//     SnackBarType.error: Icons.error,
//     SnackBarType.info: Icons.info,
//     SnackBarType.warning: Icons.warning,
//   };

//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       behavior: SnackBarBehavior.floating,
//       backgroundColor: colors[type],
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       content: Row(
//         children: [
//           Icon(icons[type], color: Colors.white),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               message,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'Jost',
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// enum SnackBarType { success, error, info, warning }
