// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
int getAge(DateTime? birthday) {
  return (DateTime.now()).difference(birthday ?? DateTime.now()).inDays ~/ 365;
}

Future initializeFilterState(
  FiltersRecord? filter,
  UsersRecord userProfile,
  LatLng? currentLocation,
) async {
  FFAppState().fltrName =
      filter?.filterName ?? userProfile.firstName ?? "Filter";
  if (filter?.ageRange.min == null) {
    FFAppState().fltrAgeMin =
        getAge(userProfile.birthDay ?? DateTime.now()) - 10;
  } else {
    FFAppState().fltrAgeMin = filter?.ageRange.min ?? 0;
  }
  if (filter?.ageRange.max == null) {
    FFAppState().fltrAgeMax =
        getAge(userProfile.birthDay ?? DateTime.now()) + 10;
  } else {
    FFAppState().fltrAgeMax = filter?.ageRange.max ?? 0;
  }
  FFAppState().fltrAgeRangeExt = false;
  FFAppState().fltrIndusrtries = filter?.industries?.asList() ?? [];
  FFAppState().fltrLocation = filter?.location ?? currentLocation;
}
