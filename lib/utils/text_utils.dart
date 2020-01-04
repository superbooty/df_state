import 'dart:convert';

class TextUtils {

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );
    RegExp exp2 = RegExp(
      r"&[^;]*;",
      multiLine: true,
      caseSensitive: true
    );
    String jsonInfo = htmlText.replaceAll(exp, '').replaceAll(exp2 , '');
    return jsonInfo.trimLeft();
  }

  static Map<String, dynamic> toJSONMap(String toConver) {
    return json.decode(toConver);
  }
}