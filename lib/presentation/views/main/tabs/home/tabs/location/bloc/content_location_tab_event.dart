part of 'content_location_tab_bloc.dart';

abstract class ContentLocationTabEvent extends Equatable {
  const ContentLocationTabEvent();
}

class ShowWebViewEvent extends ContentLocationTabEvent {
  final Uri url;
  const ShowWebViewEvent({required this.url});

  @override
  List<Object?> get props => [url];

  @override
  bool? get stringify => false;
}

class ShowTelPhoneEvent extends ContentLocationTabEvent {
  final String phoneNumber;
  const ShowTelPhoneEvent({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];

  @override
  bool? get stringify => false;
}