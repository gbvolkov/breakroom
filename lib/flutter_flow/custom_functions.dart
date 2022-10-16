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
  List<PhotoStruct>? options,
  int? optionNo,
) {
  if (options != null && options.isNotEmpty) {
    optionNo = optionNo ?? 0;
    if (optionNo >= options.length) optionNo = options.length - 1;
    return options[optionNo].image;
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

String isMatchedListValue(
  String value,
  List<String> list,
) {
  if (list.contains(value)) {
    return value;
  } else {
    return "$value;";
  }
  // Add your function code here!
}

List<DocumentReference> concatUsersList(
  List<DocumentReference>? list1,
  List<DocumentReference>? list2,
  DocumentReference user,
) {
  List<DocumentReference> result = [];
  if (list1 != null) result += list1;
  if (list2 != null) result += list2;
  result.add(user);

  return result;
}

List<UsersRecord> filterMatches(
  List<UsersRecord> fans,
  List<DocumentReference>? liked,
) {
  List<UsersRecord> result = [];
  if (liked == null) {
    return result;
  }
  for (var fan in fans) {
    if (liked.contains(fan.reference)) {
      result.add(fan);
    }
  }
  return result;
}

List<UsersRecord> cleanUpFilteredProfiles(
  List<UsersRecord> fliteredProfiles,
  List<DocumentReference> likedUsers,
  List<DocumentReference> dislikedUsers,
) {
  List<UsersRecord> result = [];
  List<DocumentReference> selectedUsers = likedUsers + dislikedUsers;

  for (var profile in fliteredProfiles) {
    if (!selectedUsers.contains(profile.reference)) {
      result.add(profile);
      return result;
    }
  }
  return result;
}

double geoDistance(
  LatLng? latlng1,
  LatLng? latlng2,
) {
  latlng1 = latlng1 ?? const LatLng(0, 0);
  latlng2 = latlng2 ?? const LatLng(0, 0);
  double lat1 = latlng1.latitude;
  double lng1 = latlng1.longitude;
  double lat2 = latlng2.latitude;
  double lng2 = latlng2.longitude;
  var p = 0.017453292519943295;
  var c = math.cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lng2 - lng1) * p)) / 2;
  // Returns distance in Kilo-meters
  var d = (12742 * math.asin(math.sqrt(a)));
  String inString = d.toStringAsFixed(2); // '2.35'
  double inDouble = double.parse(inString);
  return inDouble;
}

bool isEmailValid(String email) {
  // Check if email and password valid
  email = email.trim();

  return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}
