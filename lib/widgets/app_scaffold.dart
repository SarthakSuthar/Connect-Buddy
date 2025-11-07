import 'package:connect_buddy/widgets/app_bar.dart';
import 'package:connect_buddy/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final bool isPrimaryColor;
  final bool isDrawer;
  final Widget body;

  const AppScaffold({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.isPrimaryColor = true,
    this.isDrawer = true,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        showBackButton: showBackButton,
        isPrimaryColor: isPrimaryColor,
        isDrawer: isDrawer,
      ),
      endDrawer: const AppDrawer(),
      drawerScrimColor: Colors.transparent.withOpacity(0.1),
      // backgroundColor: Colors.white30,
      // endDrawerScrimColor: Colors.transparent,
      body: body,
    );
  }
}
