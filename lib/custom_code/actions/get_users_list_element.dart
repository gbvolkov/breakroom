// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<UsersRecord?> getUsersListElement(
  List<UsersRecord> users,
  int no,
) async {
  if (users.isEmpty) return null;
  if (no >= users.length) no = users.length - 1;
  if (no < 0) no = 0;
  return users[0];
  // Add your function code here!
}
