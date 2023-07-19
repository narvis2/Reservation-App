
class TextUtils {
  static bool isNameValid(String text) {
    // 2~4 자리 한글 이름 검사
    RegExp regex = RegExp(r'^[가-힣]{2,4}$');
    return regex.hasMatch(text);
  }

  static bool isPhoneNumberValid(String text) {
    RegExp regex = RegExp(r'^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$');
    return regex.hasMatch(text);
  }
}