part of 'content_home_tab_bloc.dart';

abstract class ContentHomeTabState extends Equatable {
  const ContentHomeTabState();
}

class ContentHomeTabInitial extends ContentHomeTabState {
  @override
  List<Object> get props => [];
}

class ContentHomeTabStateLoading extends ContentHomeTabState {
  const ContentHomeTabStateLoading();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class ContentHomeTabStateTargetReservation extends ContentHomeTabState {
  final List<ReservationTargetDateModel> targetReservationList;

  const ContentHomeTabStateTargetReservation(
      {required this.targetReservationList});

  @override
  List<Object?> get props => [targetReservationList];

  @override
  bool? get stringify => false;
}

class ContentHomeTabStateTargetReservationFailed extends ContentHomeTabState {
  final String message;
  const ContentHomeTabStateTargetReservationFailed({required this.message});

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => false;
}
