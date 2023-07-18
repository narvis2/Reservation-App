part of 'reservation_third_bloc.dart';

abstract class ReservationThirdEvent extends Equatable {
  const ReservationThirdEvent();
}

// 📌 이용약관 - 전체 약관 List 가져오기
class ReservationThirdTermListEvent extends ReservationThirdEvent {
  const ReservationThirdTermListEvent();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

// 📌 이용약관 개별 선택 
class ReservationThirdTermClickEvent extends ReservationThirdEvent {
  final int selectedIndex;

  const ReservationThirdTermClickEvent({required this.selectedIndex,});

  @override
  List<Object?> get props => [selectedIndex];

  @override
  bool? get stringify => false;
}

// 📌 전체동의, 전체동의 해제
class ReservationThirdTermSelectAllEvent extends ReservationThirdEvent {
  final bool isAllSelected;
  const ReservationThirdTermSelectAllEvent({required this.isAllSelected});

  @override
  List<Object?> get props => [isAllSelected];

  @override
  bool? get stringify => false;
}