// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:flutter/foundation.dart';
import 'package:flutter_google_places/flutter_google_places.dart' as fgp;
import 'package:google_api_headers/google_api_headers.dart' as hdr;
import 'package:google_maps_webservice/places.dart' as plc;

String get googleMapsApiKey {
  if (kIsWeb) {
    return 'AIzaSyCecli0giGx_CRhnrErLWcGGNnT496HAcg';
  }
  switch (defaultTargetPlatform) {
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
      return '';
    case TargetPlatform.iOS:
      return 'AIzaSyCGa189ibbYv_GlfmMckfYlsHOEc5RRDSE';
    case TargetPlatform.android:
      return 'AIzaSyD3BF3LlQ_jm7HkDSIni9pGeTF-98gV7iA';
    default:
      return 'AIzaSyCecli0giGx_CRhnrErLWcGGNnT496HAcg';
  }
}

Future<plc.PlacesDetailsResponse?> displayPrediction(plc.Prediction? p) async {
  if (p == null) {
    return null;
  }
  final placeId = p.placeId;
  if (placeId == null) {
    return null;
  }
  plc.GoogleMapsPlaces _places = plc.GoogleMapsPlaces(
    apiKey: googleMapsApiKey,
    apiHeaders: await const hdr.GoogleApiHeaders().getHeaders(),
  );
  return await _places.getDetailsByPlaceId(placeId);
}

Future<FFPlace> placePickerAction(
  BuildContext context,
  LatLng? defaultLocation,
  String? defaultAddress,
) async {
  final p = await fgp.PlacesAutocomplete.show(
    context: context,
    apiKey: googleMapsApiKey,
    onError: (response) => print('Error occured when getting places response:'
        '\n${response.errorMessage}'),
    mode: fgp.Mode.overlay,
    types: [],
    components: [],
    strictbounds: false,
    proxyBaseUrl: null,
  );

  plc.PlacesDetailsResponse? detail = await displayPrediction(p);
  if (detail == null) {
    return FFPlace(
        latLng: LatLng(
          defaultLocation?.latitude ?? 0,
          defaultLocation?.longitude ?? 0,
        ),
        address: defaultAddress ?? '');
  } else {
    return FFPlace(
      latLng: LatLng(
        detail.result.geometry?.location.lat ?? defaultLocation?.latitude ?? 0,
        detail.result.geometry?.location.lng ?? defaultLocation?.longitude ?? 0,
      ),
      name: detail.result.name,
      address: detail.result.formattedAddress ?? defaultAddress ?? '',
      city: detail.result.addressComponents
              .firstWhere((element) => element.types.contains('locality'))
              ?.shortName ??
          '',
      state: detail.result.addressComponents
              .firstWhere((element) =>
                  element.types.contains('administrative_area_level_1'))
              ?.shortName ??
          '',
      country: detail.result.addressComponents
              .firstWhere((element) => element.types.contains('country'))
              ?.shortName ??
          '',
      zipCode: detail.result.addressComponents
              .firstWhere((element) => element.types.contains('postal_code'))
              ?.shortName ??
          '',
    );
  }
}
