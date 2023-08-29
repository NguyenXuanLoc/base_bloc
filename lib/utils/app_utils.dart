import 'dart:math';

import 'package:diacritic/diacritic.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../components/date_picker.dart';
import '../theme/colors.dart';

class Utils {
  static var METHOD_CHANNEL = "METHOD_CALL_NATIVE";
  static var eventBus = EventBus();

  static fireEvent(dynamic model) => eventBus.fire(model);

  static bool validatePassword(String value) {
    String pattern = r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String getQueryString(Map params,
      {String prefix = '&', bool inRecursion = false}) {
    String query = '';

    params.forEach((key, value) {
      if (inRecursion) {
        key = '[$key]';
      }
      if (value is String || value is int || value is double || value is bool) {
        query += '$prefix$key=$value';
      } else if (value is List || value is Map) {
        if (value is List) value = value.asMap();
        value.forEach((k, v) {
          query +=
              getQueryString({k: v}, prefix: '$prefix$key', inRecursion: true);
        });
      }
    });
    query = query.replaceFirst(RegExp('&'), '?');
    return query;
  }

  static void hideKeyboard(BuildContext? context) {
    if (context != null) FocusScope.of(context).requestFocus(FocusNode());
  }

  static List<String> getDaysOfWeek() {
    final now = DateTime.now();
    final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(7, (index) => index)
        .map((value) => DateFormat('yyyy-MM-dd ${DateFormat.WEEKDAY}')
            .format(firstDayOfWeek.add(Duration(days: value))))
        .toList();
  }

  static DateTime findFirstDateOfTheWeek() {
    var dateTime = DateTime.now();
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  static DateTime findLastDateOfTheWeek() {
    var dateTime = DateTime.now();
    return DateTime.now()
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  static String convertTimeStampToYYMMDD(int timeStamp) {
    var dateTime =
        DateTime.fromMicrosecondsSinceEpoch(timeStamp, isUtc: true).toLocal();
    return '${dateTime.year}-${dateTime.month.toString().length == 1 ? '0' + dateTime.month.toString() : dateTime.month}-${dateTime.day.toString().length == 1 ? '0' + dateTime.day.toString() : dateTime.day}';
  }

  static bool validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

/*String stringTimeFormatYearDuration(int month, String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? Jiffy(date).add(months: month).format('dd/MM/yyyy') : '';
}*/

  static void snackBarMessage(String message,
      {Color? backgroundColor, SnackPosition? position, Color? colorText}) {
    Get.snackbar("LocaleKeys.notify.tr", message,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: backgroundColor ?? colorBackgroundWhite,
        colorText: colorText ?? colorText100,
        animationDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 2),
        snackPosition: position ?? SnackPosition.BOTTOM);
  }

/*  static bool validatePassword(String value) {
    String pattern = r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }*/

  static void pickDate(BuildContext context, Function(DateTime) callback) {
    var time = DateTime.now();
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1900, 3, 5),
        maxTime: DateTime(time.year, time.month, time.day),
        onChanged: (date) {}, onConfirm: (date) {
      callback.call(date);
    }, currentTime: DateTime.now(), locale: LocaleType.pl);
  }

  static String convertTimeToDDMMHH(DateTime? time) {
    if (time == null) return '';
    var result = DateFormat('dd-MM-yyyy').format(time);
    return result.toString().split(' ')[0];
  }

  static String convertTimeToYYMMDDFromStr(String time) {
    var result = time.split('-');
    return '${result[2]}-${result[1]}-${result[0]}';
  }

  static String getFullTimeFromStr(String time) {
    var result = time.split(':');
    return "${result[0]}:${(result[1].length == 1 ? "0" + result[1] : result[1])}";
  }

  static String getFullHoursFromStr(String time) {
    var result = time.split(':');
    return "${(result[0].length == 1 ? "0" + result[0] : result[0])}:${(result[1].length == 1 ? "0" + result[1] : result[1])}";
  }

  static String convertTimeToYYMMDDFromDateTime(DateTime time) =>
      DateFormat('yyyy-MM-dd').format(time).toString();

  static String convertTimeToDDMMYYFromStr(String time) =>
      DateFormat('dd-MM-yyyy').parse(time).toString();

  static String convertTimeToDDMMYYFromDateTime(DateTime time) =>
      DateFormat('dd-MM-yyyy').format(time).toString();

  static String convertTimeToMMMDDYYYYHOUR(DateTime? time) =>
      DateFormat('MMM dd yyyy, HH:MM')
          .format(time ?? DateTime.now())
          .toString();

  static String convertTimeToMMMDDYYYY(DateTime? time) =>
      DateFormat('MMM dd yyyy').format(time ?? DateTime.now()).toString();

  static String convertTimeToDDMMYYHHMMFromDateTime(DateTime time) =>
      DateFormat('dd/MM/yyyy - hh:mm').format(time).toString();

  static String convertTimeToYYHHFromDateTime(DateTime time) =>
      DateFormat('hh:mm').format(time).toString();

  static String convertTimeToMMMYYDD(DateTime time) =>
      DateFormat('dd - MMM').format(time).toString();

  static String convertHoursFromStr(String? input) {
    if (input == null || input.isEmpty) return '';
    var time = parseTimeOfDay(input);
    var hour = time.hour.toString().length == 1
        ? "0" + time.hour.toString()
        : time.hour.toString();
    var minute = time.minute.toString().length == 1
        ? "0" + time.minute.toString()
        : time.minute.toString();
    return "$hour:$minute";
  }

  static TimeOfDay parseTimeOfDay(String t) {
    DateTime dateTime = DateFormat("HH:mm").parse(t);
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  static String reformatDateToMMMDDYYFromStr(String dateTime) {
    return DateFormat('MMM DD YYYY').parse(dateTime).toString();
  }

  static DateTime convertStringToDate(String date) =>
      DateFormat('yy-MM-dd').parse(date);

  static String convertDateToMMYYYY(DateTime date) =>
      DateFormat('MM/yyyy').format(date);

  static bool checkDiacriticsForEmail(String email) =>
      removeDiacritics(email) == email ? false : true;

  static String formatMoney(int? money) =>
      NumberFormat('#,###,###,#,###,###,###', 'vi').format(money ?? 0);

  static String randomTag() => Random().nextInt(100).toString();
}
