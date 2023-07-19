import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/data/model/sign/phone_auth_request.dart';
import 'package:reservation_app/domain/model/base/data_state.dart';
import 'package:reservation_app/domain/usecase/sign/get_auth_phone_number_use_case.dart';

part 'reservation_fourth_event.dart';

part 'reservation_fourth_state.dart';

class ReservationFourthBloc
    extends Bloc<ReservationFourthEvent, ReservationFourthState> {
  final GetAuthPhoneNumberUseCase _getAuthPhoneNumberUseCase;

  ReservationFourthBloc(this._getAuthPhoneNumberUseCase)
      : super(ReservationFourthState.initial()) {
    on<ReservationFourthGetPhoneAuthNumberEvent>(
      (event, emit) => _requestPhoneAuthNumber(event, emit),
    );
  }

  void _requestPhoneAuthNumber(
    ReservationFourthGetPhoneAuthNumberEvent event,
    Emitter<ReservationFourthState> emit,
  ) async {
    emit(state.copyWith(sendMessageStateType: SentMessageStateType.loading));

    final response = await _getAuthPhoneNumberUseCase.invoke(
      PhoneAuthRequest(
        name: state.name,
        phoneNumber: state.phoneNumber,
      ),
    );

    if (response is DataSuccess) {
      emit(state.copyWith(isSentMessageSuccessfully: response.data ?? false));
    } else if (response is DataError) {
      emit(state.copyWith(sendMessageStateType: SentMessageStateType.failure));
    } else if (response is DataNetworkError) {
      emit(state.copyWith(sendMessageStateType: SentMessageStateType.failure));
    } else {
      emit(state.copyWith(sendMessageStateType: SentMessageStateType.failure));
    }
  }
}
