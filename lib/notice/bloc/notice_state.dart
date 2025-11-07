part of 'notice_bloc.dart';

@immutable
sealed class NoticeState {}

final class NoticeInitial extends NoticeState {}

//Notice list
final class NoticeListLoading extends NoticeState {}

final class NoticeListLoaded extends NoticeState {
  // final List<Notice> notices;

  // NoticeListLoaded(this.notices);
}

final class NoticeListError extends NoticeState {
  final String message;

  NoticeListError(this.message);
}

//Notice detail
final class NoticeDetailLoading extends NoticeState {}

final class NoticeDetailLoaded extends NoticeState {
  // final Notice notice;

  // NoticeDetailLoaded(this.notice);
}

final class NoticeDetailError extends NoticeState {
  final String message;

  NoticeDetailError(this.message);
}
