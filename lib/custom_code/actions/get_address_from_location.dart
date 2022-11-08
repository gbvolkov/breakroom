// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:geocoding/geocoding.dart' as geo;

Future<String> getAddressFromLocation(LatLng location) async {
  try {
    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        location.latitude, location.longitude);
    geo.Placemark place = placemarks[0];
    String address =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
    return address;
  } catch (ex) {
    return "N/D";
  }
}
