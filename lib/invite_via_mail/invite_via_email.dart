import 'package:connect_buddy/invite_via_mail/bloc/invite_via_email_bloc.dart';
import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:connect_buddy/widgets/app_input.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:connect_buddy/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

              BlocConsumer<InviteViaEmailBloc, InviteViaEmailState>(
                listener: (context, state) {
                  if (state is InviteViaEmailError) {
                    appSnackBar(
                      context,
                      message: "Error Sending mail",
                      isError: true,
                    );
                    showlog("Error Sending mail:${state.message}");
                  } else if (state is InviteViaEmailLoaded) {
                    appSnackBar(
                      context,
                      message: "Mail sent successfully",
                      isError: false,
                    );
                    context.pop();
                    showlog("Mail sent successfully");
                  }
                },
                builder: (context, state) {
                  if (state is InviteViaEmailLoading) {
                    return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  } else {
                    return AppButton(
                      text: "Invite Now",
                      onTap: () {
                        context.read<InviteViaEmailBloc>().add(
                          SendInviteEmail(),
                        );
                        showlog("Invite Now tapped");
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
