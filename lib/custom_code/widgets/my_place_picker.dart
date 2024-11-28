// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:flutter_google_places/flutter_google_places.dart' as fgp;
import 'package:google_api_headers/google_api_headers.dart' as hdr;
import 'package:google_maps_webservice/places.dart' as places;

class MyPlacePicker extends StatefulWidget {
  const MyPlacePicker({
    Key? key,
    this.width,
    this.height,
    this.location,
    required this.onSelect,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng? location;
  final Future<dynamic> Function() onSelect;

  @override
  _MyPlacePickerState createState() => _MyPlacePickerState();
}

class _MyPlacePickerState extends State<MyPlacePicker> {
  String? _selectedPlace;

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

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.place),
      onPressed: () async {
        final p = await fgp.PlacesAutocomplete.show(
          context: context,
          apiKey: googleMapsApiKey,
          onError: (response) =>
              print('Error occured when getting places response:'
                  '\n${response.errorMessage}'),
          mode: fgp.Mode.overlay,
          types: [],
          components: [],
          strictbounds: false,
        );

        await displayPrediction(p);
      },
    );
  }

  Future displayPrediction(places.Prediction? p) async {
    if (p == null) {
      return;
    }
    final placeId = p.placeId;
    if (placeId == null) {
      return;
    }
    places.GoogleMapsPlaces _places = places.GoogleMapsPlaces(
      apiKey: googleMapsApiKey,
      apiHeaders: await const hdr.GoogleApiHeaders().getHeaders(),
    );
    places.PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(placeId);
    setState(() {
      FFAppState().mppLocation = LatLng(
        detail.result.geometry?.location.lat ?? 0,
        detail.result.geometry?.location.lng ?? 0,
      );
      FFAppState().mppAddress = detail.result.formattedAddress ?? "";
      _selectedPlace = detail.result.name;
    });

    widget.onSelect();
  }
}
