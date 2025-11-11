import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<OtpEntered>(onOtpEntered);
  }

  Future<void> onOtpEntered(OtpEntered event, Emitter<OtpState> emit) async {
    emit(OtpLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(OtpSuccess());

    // emit(OtpFailed(error: "Error occured"));
  }
}
