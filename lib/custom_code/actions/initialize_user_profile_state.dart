// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future initializeUserProfileState(UserProfilesRecord userProfile) async {
  FFAppState().usrBodyType = userProfile.bodyType ?? "";
  FFAppState().usrChildfreeStatus = userProfile.childfreeStatus ?? "";
  FFAppState().usrDrinkingStatus = userProfile.drinkingStatus ?? "";
  FFAppState().usrEducation = userProfile.education ?? "";
  FFAppState().usrGender = userProfile.gender ?? "";
  FFAppState().usrGenderPreference = userProfile.genderPreference ?? "";
  FFAppState().usrHeight = userProfile.height ?? 170;
  FFAppState().usrIntention = userProfile.intention ?? "";
  FFAppState().usrLookingFor = userProfile.lookingFor?.asList() ?? [];
  FFAppState().usrReligion = userProfile.religion ?? "";
  FFAppState().usrSmokingStatus = userProfile.smokingStatus ?? "";
  FFAppState().usrSpiritualStatus = userProfile.spiritualStatus ?? "";
  FFAppState().usrWorkoutStatus = userProfile.workoutStatus ?? "";
  FFAppState().usrFirstName = userProfile.firstName ?? "";
  FFAppState().usrLastName = userProfile.lastName ?? "";
  FFAppState().usrBDay = userProfile.birthDay ?? DateTime.now();
  FFAppState().usrBio = userProfile.bio ?? "";
  FFAppState().usrIndustry = userProfile.industry ?? "";
  FFAppState().usrOccupation = userProfile.occupation ?? "";
  FFAppState().usrInterests = userProfile.interests?.asList() ?? [];
}
