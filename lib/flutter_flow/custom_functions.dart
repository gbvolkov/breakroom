import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String stringifyList(
  List<String>? list,
  int? maxItems,
) {
  list = list ?? [];
  if (list.isEmpty) {
    return "";
  }
  maxItems = maxItems ?? list.length;
  maxItems = (maxItems <= list.length) ? maxItems : list.length;
  String? res = list.sublist(0, maxItems).join(', ');
  if (list.length > maxItems) res += '...';
  return res;
}

int getAge(DateTime? birthday) {
  return (DateTime.now()).difference(birthday ?? DateTime.now()).inDays ~/ 365;
}

String getFullName(
  String? firstName,
  String? lastName,
) {
  // Add your function code here!
  return (firstName ?? "") + " " + (lastName ?? "");
}

bool isEmailAndPasswordValid(
  String email,
  String password,
) {
  // Check if email and password valid
  email = email.trim();
  password = password.trim();

  return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email) &&
      password.length > 5;
}

String getListValue(
  List<String> options,
  int? optionNo,
) {
  return options[optionNo ?? 0];
}

String? getPhotosListValue(
  List<PhotoStruct> options,
  int? optionNo,
) {
  if (options.isNotEmpty) {
    return options[optionNo ?? 0].image;
  } else {
    return null;
  }
}

List<String> splitString(
  String str,
  String? separator,
) {
  return str.split(separator ?? '|');
}

String getSelectAllButtonTitle(bool isSelectAllVisible) {
  // Add your function code here!
  return (isSelectAllVisible ? "Select all" : "Clear all");
}

DateTime addYearsToDate(
  DateTime fromDate,
  double years,
  int? direction,
) {
  return fromDate
      .add(Duration(days: years.toInt() * 365 * (direction ?? 1).sign));
}
