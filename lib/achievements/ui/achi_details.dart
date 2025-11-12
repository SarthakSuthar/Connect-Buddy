import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class AchievementDetails extends StatelessWidget {
  const AchievementDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Achievement",
      showBackButton: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/archivement.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur',
                style: AppTheme.mediumBold,
              ),
              const SizedBox(height: 16),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan varius arcu eu ullamcorper. Donec dapibus turpis in tristique blandit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan varius arcu eu ullamcorper. Donec dapibus turpis in tristique blandit. Etiam dui ante, convallis eget aliquet vel, aliquet id sem. Integer magna lacus, tincidunt a odio vitae, vehicula sodales urna. Aliquam sed diam in purus commodo aliquam. Nam non risus leo. Duis sed nulla viverra, consectetur ante id, euismod leo. In id vulputate urna. Suspendisse lobortis augue et finibus dictum.Sed tempor risus in ligula pharetra, sed viverra turpis congue. Donec tincidunt auctor turpis, sed pulvinar dolor condimentum vitae. Aliquam egestas interdum urna, ac blandit lectus ultrices non. Nulla egestas metus id lacus faucibus volutpat. Aliquam orci lectus, mollis a erat et, vehicula euismod leo. Fusce auctor erat nibh, ac egestas tortor blandit vitae. Cras bibendum nisi vel elit ultrices, eget eleifend elit cursus. Maecenas vel neque ac lectus ullamcorper dignissim. Donec auctor, mauris in ultricies eleifend, nibh massa dapibus purus, at ultrices lacus leo et lorem',
                style: AppTheme.smallRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
