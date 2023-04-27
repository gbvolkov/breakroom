// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DateTime?> vvShowDatePicker(
  BuildContext context,
  DateTime? initialDate,
  String? helpText,
  String? fieldHintText,
  String? fieldLabelText,
) async {
  // Add your function code here!

  return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
      helpText: helpText,
      fieldHintText: fieldHintText,
      fieldLabelText: fieldLabelText,
      builder: (context, child) {
        return Theme(data: ThemeData.light(), child: child!);
      });
}
