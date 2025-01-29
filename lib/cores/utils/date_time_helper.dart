import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeHelper {
  static final _dayMap = {1: 'st', 2: 'nd', 3: 'rd', 23: "rd"};

  static String formatDate(DateTime dateTime) {
    return DateFormat('E, MMM dd yyyy').format(dateTime);
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm a E, MMM dd yyyy').format(dateTime);
  }

  static String formatDateDefault(DateTime? dateTime) {
    if (dateTime == null) return "N/A";
    return DateFormat('MMM dd yyyy').format(dateTime);
  }

  static String formatDateRangeDefault(DateTime? start, DateTime? end) {
    final bool bothIsNotNull = (start != null && end != null);
    if (bothIsNotNull) {
      final bool isSameDay = start.day == end.day;
      final bool isSameMonth = start.month == end.month;

      if (isSameDay) {
        return DateFormat('MMM dd yyyy').format(end);
      } else if (isSameMonth) {
        final days = [start.day, end.day];

        return "${days[0]}${_dayMap[days[0]] ?? "th"} - ${days[1]}${_dayMap[days[1]] ?? "th"} ${DateFormat('MMM').format(start)}";
      }
    }

    final startDate =
        start == null ? "N/A" : DateFormat('MMM dd yyyy').format(start);
    final endDate = end == null ? "N/A" : DateFormat('MMM dd yyyy').format(end);

    return "$startDate - $endDate";
  }

  static String formatDateTimeShort(DateTime dateTime) {
    return DateFormat('MMM d, hh:mm a').format(dateTime);
  }

  static String formatDay(DateTime dateTime) {
    return DateFormat('EEE, MMM d').format(dateTime);
  }

  static String formatDateYYMMDD(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String formatDateYYMMDDTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm').format(dateTime);
  }

  static String formatTimeOnly(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String formatDatAndDate(DateTime dateTime) {
    return DateFormat('E, MMM dd yyyy').format(dateTime);
  }

  static String timeAgo(
    DateTime date, {
    bool numericDates = true,
    bool withTime = false,
  }) {
    final date2 = DateTime.now();
    final difference = date2.difference(date);
    final time = DateFormat('hh:mm a').format(date);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago - $time' : 'Last week - - $time';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago - $time';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago - $time' : 'Yesterday - $time';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago - $time';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago - $time' : 'An hour ago - $time';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  static String timeLeft(DateTime date, {bool addLeft = true}) {
    final date2 = DateTime.now();
    final difference = date.difference(date2);

    if ((difference.inDays / 7).floor() >= 1) {
      return '1 week ${addLeft ? "Left" : ""}';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ${addLeft ? "Left" : ""}';
    } else if (difference.inDays >= 1) {
      return '1 day ${addLeft ? "Left" : ""}';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ${addLeft ? "Left" : ""}';
    } else if (difference.inHours >= 1) {
      return '1 hour${addLeft ? "Left" : ""}';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ${addLeft ? "Left" : ""}';
    } else if (difference.inMinutes >= 1) {
      return '1 minute${addLeft ? "Left" : ""}';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ${addLeft ? "Left" : ""}';
    } else {
      return 'Expired';
    }
  }

  static String lockTimeLeft(DateTime date, {bool addLeft = true}) {
    final date2 = DateTime.now();
    final difference = date.difference(date2);

    // Calculate total days and adjust hours to be less than 24
    // int totalDays = difference.inDays;
    // int adjustedHours = difference.inHours % 24;
    //
    // // Combine days and hours if necessary
    // if (totalDays > 0 || adjustedHours > 0) {
    //   String result = '';
    //
    //   if (totalDays > 0) {
    //     result += '$totalDays day${addLeft ? "s" : ""}';
    //   }
    //
    //   if (adjustedHours > 0) {
    //     if (result.isNotEmpty) {
    //       result += ' ';
    //     }
    //
    //     result += '$adjustedHours hour${addLeft ? "s" : ""}';
    //   }
    //
    //   return result + (addLeft ? " Left" : "");
    // }

    if (difference.inDays >= 2) {
      return '${difference.inDays} day ${addLeft ? "Left" : ""}';
    } else if (difference.inDays >= 1) {
      return '1 day ${addLeft ? "Left" : ""}';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hour ${addLeft ? "Left" : ""}';
    } else if (difference.inHours >= 1) {
      return '1 hour${addLeft ? "Left" : ""}';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minute ${addLeft ? "Left" : ""}';
    } else if (difference.inMinutes >= 1) {
      return '1 minute${addLeft ? "Left" : ""}';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} second ${addLeft ? "Left" : ""}';
    } else {
      return 'Done';
    }
  }

  static Future<DateTime?> pickDate(BuildContext context) async {
    final DateTime? result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    return result;
  }

  static Future<TimeOfDay?> pickTime(BuildContext context) async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    return result;
  }
}
