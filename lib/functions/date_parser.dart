import 'package:intl/intl.dart';

class DateParser {
  static List<String> dayNames = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu"
  ];
  static List<String> monthNames = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static String parse(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    var dayName = dayNames[localDate.weekday - 1];
    var monthName = monthNames[localDate.month - 1];
    var formatter = NumberFormat("00");
    return "$dayName, ${localDate.day} $monthName ${localDate.year}, Pk. ${formatter.format(localDate.hour)}:${formatter.format(localDate.minute)}";
  }

  static String parseDate(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    var dayName = dayNames[localDate.weekday - 1];
    var monthName = monthNames[localDate.month - 1];
    return "$dayName, ${localDate.day} $monthName ${localDate.year}";
  }

  static String parseDateOnly(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    var monthName = monthNames[localDate.month - 1];
    return "${localDate.day} $monthName ${localDate.year}";
  }

  static String parseDateMonth(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    var monthName = monthNames[localDate.month - 1];
    return "${localDate.day} $monthName";
  }

  static String parseYearMonth(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    var monthName = monthNames[localDate.month - 1];
    return "$monthName ${localDate.year}";
  }

  static String parseTime(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    var formatter = NumberFormat("00");
    return "Pk. ${formatter.format(localDate.hour)}:${formatter.format(localDate.minute)}";
  }

  static String parseTimeOnly(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    var formatter = NumberFormat("00");
    return "${formatter.format(localDate.hour)}:${formatter.format(localDate.minute)}";
  }

  static String parseYear(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    return "${localDate.year}";
  }

  static String daysAgoFromNow(DateTime dateTime) {
    var localDate = dateTime.toLocal();
    var now = DateTime.now().toLocal();
    var diff = now.difference(localDate);
    if (diff.inDays == 0) {
      return "Hari ini";
    } else if (diff.inDays == 1) {
      return "Kemarin";
    } else if (diff.inDays <= 10) {
      return "${diff.inDays} hari yang lalu";
    } else {
      return parseDateOnly(dateTime);
    }
  }
}
