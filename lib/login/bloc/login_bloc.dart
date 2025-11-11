import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

//TODO: have to implement real logic
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginBtnPressed>(onLoginBtnPressed);
    on<GoogleBtnPressed>(onGoogleBtnPressed);
  }

  Future<void> onLoginBtnPressed(
    LoginBtnPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    await Future.delayed(const Duration(seconds: 3));

    emit(LoginSuccess());
  }

  Future<void> onGoogleBtnPressed(
    GoogleBtnPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(GoogleLoginLoading());

    //TODO: have to handle google sign in

    await Future.delayed(const Duration(seconds: 3));

    emit(GoogleLoginFailure(message: "Google Login Failed"));
  }
}
