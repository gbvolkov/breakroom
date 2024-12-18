// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

int getAge(DateTime? birthday) {
  return (DateTime.now()).difference(birthday ?? DateTime.now()).inDays ~/ 365;
}

Future initializeFilterState(
  FilterStruct? filter,
  //UsersRecord userProfile,
  LatLng? currentLocation,
) async {
  //FFAppState().fltrName = userProfile.firstName??"Filter";
  FFAppState().update(() {
    FFAppState().fltrName = "Filter";
    if (filter?.ageRange.min == null) {
      FFAppState().fltrAgeMin =
          18; //getAge(userProfile.birthDay ?? DateTime.now())-10;
    } else {
      FFAppState().fltrAgeMin = filter?.ageRange.min ?? 18;
    }
    if (filter?.ageRange.max == null) {
      FFAppState().fltrAgeMax =
          100; //getAge(userProfile.birthDay ?? DateTime.now())+10;
    } else {
      FFAppState().fltrAgeMax = filter?.ageRange.max ?? 100;
    }
    FFAppState().fltrAgeRangeExt = false;
    FFAppState().fltrGender = filter?.gender ?? "Everyone";
    FFAppState().fltrIndusrtries = filter?.industries?.asList() ?? [];
    FFAppState().fltrLocation = filter?.location ?? currentLocation;
  });
  String address = await getAddressFromLocation(FFAppState().fltrLocation!);
  FFAppState().update(() {
    FFAppState().fltrAddress = address;
  });
}
