class StringUtil {
  static bool isNotEmpty(String text) {
    return text?.isNotEmpty ?? false;
  }

  static bool isEmpty(String text) {
    return text?.isEmpty ?? true;
  }

}