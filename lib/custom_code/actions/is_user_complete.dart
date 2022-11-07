// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import '../../backend/backend.dart';

Future<bool> isUserComplete(DocumentReference userRef) async {
  try {
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(userRef.id).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      var value = data?['is_complete'];

      UsersRecord userRecord = UsersRecord.getDocumentOnce(userRef);

      return value ?? true;
    }

    return true;
  } catch (ex) {
    return true;
  }
}
