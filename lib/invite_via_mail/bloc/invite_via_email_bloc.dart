import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'invite_via_email_event.dart';
part 'invite_via_email_state.dart';

class InviteViaEmailBloc
    extends Bloc<InviteViaEmailEvent, InviteViaEmailState> {
  InviteViaEmailBloc() : super(InviteViaEmailInitial()) {
    on<SendInviteEmail>((event, emit) async {
      emit(InviteViaEmailLoading());

      await Future.delayed(const Duration(seconds: 3));

      emit(InviteViaEmailLoaded());
    });
  }
}
