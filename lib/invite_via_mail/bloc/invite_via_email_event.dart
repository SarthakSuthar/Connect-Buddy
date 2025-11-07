part of 'invite_via_email_bloc.dart';

@immutable
sealed class InviteViaEmailEvent {}

final class SendInviteEmail extends InviteViaEmailEvent {}
