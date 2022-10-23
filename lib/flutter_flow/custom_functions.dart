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
  List<String>? liked,
) {
  List<UsersRecord> result = [];
  if (liked == null) {
    return result;
  }
  for (var fan in fans) {
    if (liked.contains(fan.uid)) {
      result.add(fan);
    }
  }
  return result;
}

List<UsersRecord> cleanUpFilteredProfiles(
  List<UsersRecord> fliteredProfiles,
  List<String> likedUsers,
  List<String> dislikedUsers,
  FilterStruct filter,
  LatLng location,
) {
  List<UsersRecord> result = [];
  List<String> selectedUsers = likedUsers + dislikedUsers;
  bool isOK;

  for (var profile in fliteredProfiles) {
    if (!selectedUsers.contains(profile.uid)) {
      isOK = true;
      if (isOK &&
          filter.lookingFor != null &&
          filter.lookingFor!.isNotEmpty &&
          profile.lookingFor != null) {
        isOK = filter.lookingFor!
            .any((String s) => profile.lookingFor!.contains(s));
      }
      if (isOK && filter.industries != null && filter.industries!.isNotEmpty) {
        isOK = filter.industries!.contains(profile.industry);
      }
      if (isOK && filter.distance != null && filter.distance! > 0) {
        isOK = geoDistance(profile.geoposition, location) <= filter.distance!;
      }
      if (isOK) {
        result.add(profile);
        return result;
      }
    }
  }
  return result;
}

UsersRecord? getFirstFilteredProfilesCopy(
  List<UsersRecord> fliteredProfiles,
  List<String> likedUsers,
  List<String> dislikedUsers,
) {
  List<String> selectedUsers = likedUsers + dislikedUsers;

  for (var profile in fliteredProfiles) {
    if (!selectedUsers.contains(profile.uid)) {
      return profile;
    }
  }
  return null;
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

List<DocumentReference> createChatUsersList(
  DocumentReference userRef1,
  DocumentReference userRef2,
) {
  return [userRef1, userRef1];
}

String getFirst(List<String> uids) {
  // Add your function code here!
  return uids[0];
}

List<String>? getFirstDislikedFromList(List<UsersRecord> usersList) {
  return usersList[0].disliked?.asList();
}

String? getFirstUID(List<UsersRecord>? users) {
  if (users != null) {
    return users[0].uid;
  } else {
    return null;
  }
}

List<String>? getFirstLikedFromList(List<UsersRecord> usersList) {
  return usersList[0].liked?.asList();
}

DocumentReference getFirstUserRef(List<UsersRecord> users) {
  return users[0].reference;
}

List<String> getFirstLiked(List<UsersRecord> users) {
  return users[0].liked!.asList();
}

bool isAgeValid(DateTime? birthDay) {
  // Check if users age is valid
  if (birthDay == null) return false;
  DateTime today = DateTime.now();
  if (birthDay.compareTo(today) > 0) return false;

  int ageInDays = today.difference(birthDay).inDays;
  int age = ageInDays ~/ 365;
  bool result = (age > 18 && age < 70);
  return result;
}

LatLng getUserLocation(LatLng? userLocation) {
  if (userLocation == null ||
      (userLocation.latitude == 0 && userLocation.longitude == 0)) {
    return const LatLng(40.8295538, -73.9386429);
  }
  return userLocation;
}

int stringLength(String? strVal) {
  // Get length of string
  if (strVal == null) {
    return 0;
  }
  int length = 0;
  for (int i = 0; i < strVal.length; i++) {
    if (strVal.substring(i) == " ") {
      if (strVal.substring(0, i) != "") {
        length++;
      }
      while (strVal.substring(i + 1) != " " && strVal.substring(i + 1) != "") {
        length++;
        i++;
      }
    }
    length++;
  }
  return length;
}
