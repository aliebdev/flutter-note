import 'package:shamsi_date/shamsi_date.dart';

extension DateTimeEx on DateTime {
  Jalali get _jalali => Jalali.fromDateTime(this);

  String get jalaliDate =>
      "${_jalali.day} ${_jalali.monthName} ${_jalali.year}";
  String get jalaliDateWithTime =>
      "${_jalali.day} ${_jalali.monthName} ${_jalali.year} ${_jalali.hour}:${_jalali.minute}";
}

extension JalaliEx on Jalali {
  String get monthName {
    final _months = [
      "فروردین",
      "اردیبهشت",
      "خرداد",
      "تیر",
      "مرداد",
      "شهریور",
      "مهر",
      "آبان",
      "آذر",
      "دی",
      "بهمن",
      "اسفند"
    ];

    return _months[this.month - 1];
  }
}
