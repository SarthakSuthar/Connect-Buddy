import 'package:connect_buddy/forgot_pass/BLoC/otp_bloc/otp_bloc.dart';
import 'package:connect_buddy/theme/app_theme.dart';
import 'package:connect_buddy/utils.dart';
import 'package:connect_buddy/widgets/app_btn.dart';
import 'package:connect_buddy/widgets/app_scaffold.dart';
import 'package:connect_buddy/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EnterOtp extends StatefulWidget {
  const EnterOtp({super.key});

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

//TODO: Working here -- implementing BLoC

class _EnterOtpState extends State<EnterOtp> {
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Enter OTP",
      showBackButton: true,
      isPrimaryColor: true,
      isDrawer: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Please enter the OTP to reset your password",
            style: AppTheme.mediumLite,
          ),

          const SizedBox(height: 20),

          Text("OTP sent to +91 98******10", style: AppTheme.mediumRegular),

          SizedBox(height: 10),

          // OTP BOX
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: otpBoxContainer(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  autoFocus: index == 0,
                  index: index,
                ),
              );
            }),
          ),

          SizedBox(height: 10),

          Text("Resend OTP in 00.30 mins"),

          SizedBox(height: 20),

          BlocListener<OtpBloc, OtpState>(
            listener: (context, state) {
              if (state is OtpFailed) {
                appSnackBar(context, message: "Wrong OTP!", isError: true);
              }

              if (state is OtpSuccess) {
                context.push('/resetPassword');
                appSnackBar(context, message: "OTP verified!", isError: false);
              }
            },
            child: BlocBuilder<OtpBloc, OtpState>(
              builder: (context, state) {
                if (state is OtpLoading) {
                  return const CircularProgressIndicator();
                }
                return Row(
                  children: [
                    const SizedBox(width: 30),
                    Expanded(
                      child: AppButton(
                        text: "Continue",
                        onTap: () {
                          // context.go('/resetPassword');
                          context.read<OtpBloc>().add(OtpEntered(otp: ""));
                          showlog("Continue button pressed");
                        },
                      ),
                    ),
                    const SizedBox(width: 30),
                  ],
                );
              },
            ),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Resend OTP"),
              GestureDetector(
                onTap: () => context.pop(),
                child: Text("Change Number"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget otpBoxContainer({
    required TextEditingController controller,
    required FocusNode focusNode,
    bool autoFocus = false,
    required int index,
  }) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: focusNode.hasFocus
              ? AppColors.primaryColor
              : AppColors.primaryColor.withValues(alpha: 0.4),
          width: 1.5,
        ),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '', // hides character counter
        ),
        maxLength: 1,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).requestFocus(focusNodes[index + 1]);
          }
        },
      ),
    );
  }
}
