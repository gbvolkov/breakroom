// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future initializeUserDataState(
  String? bodyType,
  String? childfreeStatus,
  String? drinkingStatus,
  String? education,
  String? gender,
  String? genderPreference,
  int? height,
  int? weight,
  String? intention,
  List<String>? lookingFor,
  String? religion,
  String? smokingStatus,
  String? spiritualStatus,
  String? workoutStatus,
  String? firstName,
  String? lastName,
  DateTime? birthDay,
  String? bio,
  String? industry,
  String? occupation,
  List<String>? interests,
) async {
  FFAppState().usrBodyType = bodyType ?? "";
  FFAppState().usrChildfreeStatus = childfreeStatus ?? "";
  FFAppState().usrDrinkingStatus = drinkingStatus ?? "";
  FFAppState().usrEducation = education ?? "";
  FFAppState().usrGender = gender ?? "";
  FFAppState().usrGenderPreference = genderPreference ?? "";
  FFAppState().usrHeight = height ?? 60;
  FFAppState().usrIntention = intention ?? "";
  FFAppState().usrLookingFor = lookingFor ?? [];
  FFAppState().usrReligion = religion ?? "";
  FFAppState().usrSmokingStatus = smokingStatus ?? "";
  FFAppState().usrSpiritualStatus = spiritualStatus ?? "";
  FFAppState().usrWorkoutStatus = workoutStatus ?? "";
  FFAppState().usrFirstName = firstName ?? "";
  FFAppState().usrLastName = lastName ?? "";
  DateTime dt = DateTime(
      DateTime.now().year - 18, DateTime.now().month, DateTime.now().day);
  FFAppState().usrBDay = birthDay ?? dt;
  FFAppState().usrBio = bio ?? "";
  FFAppState().usrIndustry = industry ?? "";
  FFAppState().usrOccupation = occupation ?? "";
  FFAppState().usrInterests = interests ?? [];
}
