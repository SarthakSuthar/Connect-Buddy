import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<AppStarted>((event, emit) async {
      emit(SplashScreenLoading());

      await Future.delayed(const Duration(seconds: 3));

      bool isLoggedIn = false; //TODO: Replace with actual login check

      if (isLoggedIn) {
        emit(NavigateToHome());
      } else {
        emit(NavigateToLogin());
      }
    });
  }
}
