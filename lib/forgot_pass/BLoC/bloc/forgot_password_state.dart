part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

//MARK: Mobileno
final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ForgotPasswordSuccess extends ForgotPasswordState {}

final class ForgotPasswordFailed extends ForgotPasswordState {
  final String error;

  ForgotPasswordFailed({required this.error});
}

//MARK: OTP
final class OtpLoading extends ForgotPasswordState {}

final class OtpSuccess extends ForgotPasswordState {}

final class OtpFailed extends ForgotPasswordState {
  final String error;

  OtpFailed({required this.error});
}

//MARK: New Password
final class NewPasswordLoading extends ForgotPasswordState {}

final class NewPasswordSuccess extends ForgotPasswordState {}

final class NewPasswordError extends ForgotPasswordState {
  final String error;

  NewPasswordError({required this.error});
}
