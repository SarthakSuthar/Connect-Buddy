part of 'otp_bloc.dart';

@immutable
sealed class OtpEvent {}

final class OtpEntered extends OtpEvent {
  final String? otp;

  OtpEntered({required this.otp});
}
