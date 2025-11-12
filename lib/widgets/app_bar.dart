import 'package:connect_buddy/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.showBackButton,
    required this.isPrimaryColor,
    required this.isDrawer,
    // required this.isAlumniDetail,
  });

  final String title;
  final bool showBackButton;
  final bool isPrimaryColor;
  final bool isDrawer;
  // final bool isAlumniDetail;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: isPrimaryColor ? Colors.white : Colors.black,
          fontFamily: 'Jost',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      leading: showBackButton
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Container(
                  color: isPrimaryColor ? Colors.white : AppColors.primaryColor,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: isPrimaryColor
                          ? AppColors.primaryColor
                          : Colors.white,
                    ),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
              ),
            )
          : const SizedBox(),
      backgroundColor: isPrimaryColor
          ? Theme.of(context).colorScheme.primary
          : Colors.white,
      actions: [
        isDrawer
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: isPrimaryColor
                      ? Image.asset(
                          "assets/images/menu_icon_white.png",
                          scale: 1.5,
                        )
                      : Image.asset("assets/images/menu_icon.png", scale: 1.5),
                ),
              )
            : const SizedBox(),
      ],
      shadowColor: isPrimaryColor ? null : Colors.grey.withAlpha(150),
      surfaceTintColor: Colors.transparent,
      elevation: 2,
      // shadowColor: Colors.grey.withOpacity(0.5),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
