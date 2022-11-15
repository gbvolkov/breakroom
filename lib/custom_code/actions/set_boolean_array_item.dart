// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<List<bool>> setBooleanArrayItem(
  List<bool> array,
  int index,
  bool value,
) async {
  if (array.length <= index) {
    array.addAll(List<bool>.filled(index + 1 - array.length, true));
  }
  array[index] = value;
  return array;
}
