// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> resetUserPassword(
  String currentEMail,
  String currentPassword,
  String newPassword,
) async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    return false;
  } else {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
          email: currentUser.email ?? currentEMail, password: currentPassword);
      await currentUser.reauthenticateWithCredential(credential);
      await currentUser.updatePassword(newPassword);
      return true;
    } catch (ex) {
      return false;
    }
  }
}
