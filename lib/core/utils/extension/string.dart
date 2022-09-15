import 'shamsi_date.dart';

extension StringEx on String? {
  bool get isEmptyString => _removeWhiteSpaces(this);

  bool _removeWhiteSpaces(String? str) {
    if (str == null) {
      return true;
    }
    final newStr = str.trim();
    return newStr.isEmpty;
  }
}

extension StringDateEx on String {
  String get toJalaliDate {
    final dateTime = DateTime.parse(this);
    return dateTime.jalaliDate;
  }

  String get toJalaliDateWithTime {
    final dateTime = DateTime.parse(this);
    return dateTime.jalaliDateWithTime;
  }
}
