import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_opportunity_event.dart';
part 'new_opportunity_state.dart';

class NewOpportunityBloc
    extends Bloc<NewOpportunityEvent, NewOpportunityState> {
  NewOpportunityBloc() : super(NewOpportunityInitial()) {
    on<GtNewOpportunityEvent>((event, emit) async {
      emit(NewOpportunityLoading());

      await Future.delayed(const Duration(seconds: 3));

      emit(NewOpportunityLoaded());
    });
  }
}
