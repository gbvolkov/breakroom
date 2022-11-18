// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> setImageToCollection(
  List<String> imageCollection,
  String imagePath,
  int? index,
) async {
  if (imagePath == ".") imagePath = "";
  index = (index ?? 0) < 0 ? 0 : index;
  if (imagePath.isNotEmpty && (index! >= imageCollection.length)) {
    imageCollection.add(imagePath);
  } else {
    imageCollection[index!] = imagePath;
  }
  return imageCollection;
}
