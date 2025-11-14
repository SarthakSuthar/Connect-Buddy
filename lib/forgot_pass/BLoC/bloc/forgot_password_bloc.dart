import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<OtpEntered>(onOtpEntered);
    on<MobileNoEntered>(onMobileNoEntered);
    on<NewPasswordEntered>(onNewPasswordEntered);
  }

  Future<void> onOtpEntered(
    ForgotPasswordEvent event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(OtpLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(OtpSuccess());

    // emit(OtpFailed(error: "Error occured"));
  }

  Future<void> onMobileNoEntered(
    MobileNoEntered event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(ForgotPasswordLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(ForgotPasswordSuccess());

    // emit(ForgotPasswordFailed(error: "Error occured"));
  }

  Future<void> onNewPasswordEntered(
    NewPasswordEntered event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(NewPasswordLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(NewPasswordSuccess());

    // emit(NewPasswordError(error: "Error occured"));
  }
}
