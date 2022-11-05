// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> resetUserEmail(
  String currentEMail,
  String currentPassword,
  String newEMail,
) async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    return false;
  } else {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
          email: currentEMail, password: currentPassword);
      currentUser.reauthenticateWithCredential(credential);
      currentUser.verifyBeforeUpdateEmail(newEMail);
      currentUser.updateEmail(newEMail);
      return true;
    } catch (ex) {
      return false;
    }
  }
}
