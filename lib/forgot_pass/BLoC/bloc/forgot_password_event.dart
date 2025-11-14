part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

final class OtpEntered extends ForgotPasswordEvent {
  final String? otp;

  OtpEntered({required this.otp});
}

final class MobileNoEntered extends ForgotPasswordEvent {
  final String? mobileNo;

  MobileNoEntered({required this.mobileNo});
}

final class NewPasswordEntered extends ForgotPasswordEvent {
  final String? newPassword;
  final String? reEnterPassword;

  NewPasswordEntered({
    required this.reEnterPassword,
    required this.newPassword,
  });
}
