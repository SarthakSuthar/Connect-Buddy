import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:connect_buddy/widgets/app_input.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class InviteViaEmail extends StatefulWidget {
  const InviteViaEmail({super.key});

  @override
  State<InviteViaEmail> createState() => _InviteViaEmailState();
}

class _InviteViaEmailState extends State<InviteViaEmail> {
  final focusNode = FocusNode();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Invite",
      isPrimaryColor: false,
      showBackButton: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Invite your batchmates to join the alumni community",
                style: AppTheme.largeBold,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              AppInput(
                title: "",
                hint: "Enter Email Address",
                controller: controller,
                focusNode: focusNode,
                enabled: true,
              ),

              const SizedBox(height: 20),

              AppButton(
                text: "Invite Now",
                onTap: () {
                  showlog("Invite Now tapped");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
