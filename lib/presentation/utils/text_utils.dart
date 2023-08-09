
class TextUtils {
  static bool isNameValid(String text) {
    // 2~4 자리 한글 이름 검사
    final RegExp regExp = RegExp(r'^[가-힣]{2,4}$');
    return regExp.hasMatch(text);
  }

  static bool isPhoneNumberValid(String text) {
    final RegExp regExp = RegExp(r'^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$');
    return regExp.hasMatch(text);
  }

  // 이메일 형식 정규식
  static bool isEmailValid(String text) {
    final RegExp regExp = RegExp(r'[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}');
    return regExp.hasMatch(text);
  }

  // 최소 8자리이면서 1개 이상의 알파벳, 숫자, 특수문자를 포함해야함
  static bool isPasswordValid(String text) {
    final RegExp regExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
    return regExp.hasMatch(text);
  }
}