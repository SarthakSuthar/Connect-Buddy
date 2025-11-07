part of 'notice_bloc.dart';

@immutable
sealed class NoticeEvent {}

final class NoticeEventInitial extends NoticeEvent {}

final class GetNoticeListEvent extends NoticeEvent {}

final class GetNoticeDetailEvent extends NoticeEvent {
  final String id;

  GetNoticeDetailEvent(this.id);
}
