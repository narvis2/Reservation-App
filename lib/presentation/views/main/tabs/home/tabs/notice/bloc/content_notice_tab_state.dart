part of 'content_notice_tab_bloc.dart';

abstract class ContentNoticeTabState extends Equatable {
  const ContentNoticeTabState();
}

class ContentNoticeTabInitial extends ContentNoticeTabState {
  @override
  List<Object?> get props => [];
}

class ContentNoticeTabStateLoading extends ContentNoticeTabState {
  const ContentNoticeTabStateLoading();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class ContentNoticeTabStateNoticeList extends ContentNoticeTabState {
  final List<NoticeModel> noticeList;
  const ContentNoticeTabStateNoticeList({
    required this.noticeList,
  });

  @override
  List<Object?> get props => [noticeList];

  @override
  bool? get stringify => false;
}

class ContentNoticeTabStateNoticeListFailed extends ContentNoticeTabState {
  final String message;
  const ContentNoticeTabStateNoticeListFailed({required this.message});

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => false;
}
