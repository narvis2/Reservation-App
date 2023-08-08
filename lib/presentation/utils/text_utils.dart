
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

  static bool isEmailValid(String text) {
    final RegExp regExp = RegExp(r'[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}'); // 이메일 형식 정규식
    return regExp.hasMatch(text);
  }

  static bool isPasswordValid(String text) {
    final RegExp regExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
    return regExp.hasMatch(text);
  }
}