import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connect_buddy/utils.dart';
import 'package:meta/meta.dart';

part 'notice_event.dart';
part 'notice_state.dart';

class NoticeBloc extends Bloc<NoticeEvent, NoticeState> {
  NoticeBloc() : super(NoticeInitial()) {
    // on<NoticeEvent>((event, emit) {});
    on<GetNoticeListEvent>(onGetNoticeList);
    on<GetNoticeDetailEvent>(onGetNoticeDetail);
  }

  Future<void> onGetNoticeList(
    GetNoticeListEvent event,
    Emitter<NoticeState> emit,
  ) async {
    emit(NoticeListLoading());

    await Future.delayed(const Duration(seconds: 3));

    emit(NoticeListLoaded());
  }

  Future<void> onGetNoticeDetail(
    GetNoticeDetailEvent event,
    Emitter<NoticeState> emit,
  ) async {
    showlog("Loading detail for notice ID: ${event.id}");
    emit(NoticeDetailLoading());

    await Future.delayed(const Duration(seconds: 3));

    emit(NoticeDetailLoaded());
  }
}
