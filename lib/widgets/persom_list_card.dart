import 'package:connect_buddy/theme/app_theme.dart';
import 'package:curved_text/curved_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PersomListCard extends StatelessWidget {
  const PersomListCard({super.key, this.isOpenToWork});
  final bool? isOpenToWork;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          context.push('/alumniDetail');
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Stack(
                children: [
                  Image.asset("assets/images/alumni_profile.png", scale: 3),

                  if (isOpenToWork == true)
                    Positioned(
                      right: -4,
                      bottom: -15,
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(1),
                            ],
                          ),
                          // borderRadius: BorderRadius.circular(60),
                        ),
                        child: CurvedText(
                          curvature: -0.028,
                          text: "Open To Work",
                          textStyle: AppTheme.smallBold.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rahul Patel", style: AppTheme.mediumBold),
                  Text("L&T Limited", style: AppTheme.mediumRegular),
                  Text(
                    "Vivamus in tortor nibh. Cras vel tellus lorem.",
                    style: AppTheme.smallLite,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
