part of 'new_opportunity_bloc.dart';

@immutable
sealed class NewOpportunityState {}

final class NewOpportunityInitial extends NewOpportunityState {}

final class NewOpportunityLoading extends NewOpportunityState {}

final class NewOpportunityLoaded extends NewOpportunityState {}

final class NewOpportunityError extends NewOpportunityState {
  final String message;

  NewOpportunityError(this.message);
}
