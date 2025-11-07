import 'package:connect_buddy/notice/bloc/notice_bloc.dart';
import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:connect_buddy/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoticeDetail extends StatelessWidget {
  const NoticeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Notices",
      isPrimaryColor: false,
      showBackButton: true,
      body: BlocConsumer<NoticeBloc, NoticeState>(
        listener: (context, state) {
          if (state is NoticeDetailError) {
            appSnackBar(
              context,
              message: "Error loading notice",
              isError: true,
            );
            showlog("Error loading notice:${state.message}");
          }
        },
        builder: (context, state) {
          if (state is NoticeDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          } else if (state is NoticeDetailLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text("03/09/25", style: AppTheme.mediumLite),
                    SizedBox(height: 10),
                    Text("Lorem ipsum dolor", style: AppTheme.mediumBold),
                    SizedBox(height: 20),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan varius arcu eu ullamcorper. Donec dapibus turpis in tristique blandit.\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan varius arcu eu ullamcorper. Donec dapibus turpis in tristique blandit. Etiam dui ante, convallis eget aliquet vel, aliquet id sem. Integer magna lacus, tincidunt a odio vitae, vehicula sodales urna. Aliquam sed diam in purus commodo aliquam. Nam non risus leo. Duis sed nulla viverra, conse\nctetur ante id, euismod leo. In id vulputate urna. Suspendisse lobortis augue et finibus dictum.Sed tempor risus in ligula pharetra, sed viverra turpis congue. Donec tincidunt auctor turpis, sed pulvinar dolor condimentum vitae. Aliquam egestas interdum urna, ac blandit lectus ultrices non. Nulla egestas metus id lacus faucibus volutpat. Aliquam orci lectus, mollis a erat et, vehicula euismod leo. Fusce auctor erat nibh, ac egestas tortor blandit vitae. Cras bibendum nisi vel elit ultrices, eget eleifend elit cursus. Maecenas vel neque ac lectus ullamcorper dignissim. Donec auctor, mauris in ultricies eleifend, nibh massa dapibus purus, at ultrices lacus leo et lorem",
                      style: AppTheme.smallLite,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink(); // Return an empty widget for other states
          }
        },
      ),
    );
  }
}
