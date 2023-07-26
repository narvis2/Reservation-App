class Constants {
  static const List<String> homeTabCategoryList = [
    "홈",
    "예약",
    "공지사항",
    "알림",
    "오시는길",
  ];

  static final List<String> reservationProcessList = [
    '예약정보 입력',
    '좌석선택',
    '약관동의',
    '본인인증',
    '예약완료',
  ];

  static const dataError = "알 수 없는 오류가 발생하였습니다. \n 잠시 후 다시 시도해주세요.";
  static const networkError = "네트워크가 원활하지 않습니다. \n 잠시 후 다시 시도해주세요.";

  static final List<String> reservationTermList = [
    '[필수] 예약을 하시면 예약금을 내셔야 해요!',
    '[필수] 예약금을 내시면 환불이 어려워요!',
    '[필수] 좌석 변경이 불가능해요!'
  ];
}
