part of 'reservation_fourth_bloc.dart';

enum RequestAuthNumberStatus {
  initial,
  loading,
  success,
  error,
}

enum CheckAuthNumberStatus {
  initial,
  loading,
  success,
  error,
}

@freezed
class ReservationFourthState with _$ReservationFourthState {
  const factory ReservationFourthState({
    @Default(RequestAuthNumberStatus.initial) RequestAuthNumberStatus reqAuthNumberStatus,
    @Default(CheckAuthNumberStatus.initial) CheckAuthNumberStatus checkAuthNumberStatus,
    @Default(false) bool isRequestSuccess,
    @Default(false) bool isCheckSuccess,
    @Default('') String name,
    @Default('') String phoneNumber,
  }) = Initial;
}
