part of 'reservation_fourth_bloc.dart';

enum SentMessageStateType {
  init,
  loading,
  success,
  failure,
}

enum CheckPhoneAuthType {
  init,
  loading,
  success,
  failure,
}

class ReservationFourthState extends Equatable {
  final String name;
  final String phoneNumber;

  final SentMessageStateType sendMessageStateType;
  final bool isSentMessageSuccessfully; // 인증 문자 발송 성공 여부

  final CheckPhoneAuthType checkPhoneAuthType;
  final bool isGrantedCheck; // 인증 문자 체크 성공 여부

  const ReservationFourthState({
    required this.name,
    required this.phoneNumber,
    required this.sendMessageStateType,
    required this.isSentMessageSuccessfully,
    required this.isGrantedCheck,
    required this.checkPhoneAuthType,
  });

  factory ReservationFourthState.initial() {
    return ReservationFourthState(
      name: '',
      phoneNumber: '',
      sendMessageStateType: SentMessageStateType.init,
      isSentMessageSuccessfully: false,
      checkPhoneAuthType: CheckPhoneAuthType.init,
      isGrantedCheck: false,
    );
  }

  ReservationFourthState copyWith({
    String? name,
    String? phoneNumber,
    SentMessageStateType? sendMessageStateType,
    bool? isSentMessageSuccessfully,
    CheckPhoneAuthType? checkPhoneAuthType,
    bool? isGrantedCheck,
  }) {
    return ReservationFourthState(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      sendMessageStateType: sendMessageStateType ?? this.sendMessageStateType,
      isSentMessageSuccessfully: isSentMessageSuccessfully ?? this.isSentMessageSuccessfully,
      checkPhoneAuthType: checkPhoneAuthType ?? this.checkPhoneAuthType,
      isGrantedCheck: isGrantedCheck ?? this.isGrantedCheck,
    );
  }

  @override
  List<Object?> get props => [
        name,
        phoneNumber,
        sendMessageStateType,
        isSentMessageSuccessfully,
        checkPhoneAuthType,
        isGrantedCheck,
      ];

  @override
  bool? get stringify => true;
}
