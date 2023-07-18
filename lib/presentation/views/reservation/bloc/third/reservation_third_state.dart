part of 'reservation_third_bloc.dart';


abstract class ReservationThirdState extends Equatable {
  const ReservationThirdState();
}

class ReservationThirdInitial extends ReservationThirdState {
  const ReservationThirdInitial();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class ReservationThirdStateLoading extends ReservationThirdState {
  const ReservationThirdStateLoading();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class ReservationThirdStateTermList extends ReservationThirdState {
  final List<ReservationTermModel> termsList; // 약관 동의 List

  const ReservationThirdStateTermList({required this.termsList});

  @override
  List<Object?> get props => [termsList];

  @override
  bool? get stringify => true;
}
