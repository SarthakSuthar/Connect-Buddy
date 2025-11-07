part of 'invite_via_email_bloc.dart';

@immutable
sealed class InviteViaEmailState {}

final class InviteViaEmailInitial extends InviteViaEmailState {}

final class InviteViaEmailLoading extends InviteViaEmailState {}

final class InviteViaEmailLoaded extends InviteViaEmailState {}

final class InviteViaEmailError extends InviteViaEmailState {
  final String message;

  InviteViaEmailError(this.message);
}
