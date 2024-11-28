// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<PhotoStruct>> packImageCollectionToPhotos(
    List<String> images) async {
  List<PhotoStruct> photoCollection = [];
  for (final img in images) {
    if (img.isNotEmpty) {
      PhotoStruct photo =
          PhotoStruct((p0) => {p0.image = img, p0.rating = 0.0});
      photoCollection.add(photo);
    }
  }
  return photoCollection;
}
