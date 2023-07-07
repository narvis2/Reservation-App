part of 'content_notice_tab_bloc.dart';

abstract class ContentNoticeTabEvent extends Equatable {
  const ContentNoticeTabEvent();
}

class ContentNoticeTabNoticeListEvent extends ContentNoticeTabEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

