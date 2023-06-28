part of 'content_home_tab_bloc.dart';

abstract class ContentHomeTabEvent extends Equatable {
  const ContentHomeTabEvent();
}

class ContentHomeTabTargetReservation extends ContentHomeTabEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}
