// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

import '../../flutter_flow/flutter_flow_place_picker.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';

// Begin custom widget code
class MyPlacePicker extends StatefulWidget {
  const MyPlacePicker({
    Key? key,
    this.width,
    this.height,
    required this.iOSGoogleMapsApiKey,
    required this.androidGoogleMapsApiKey,
    required this.webGoogleMapsApiKey,
    this.defaultText,
    this.icon,
    this.color,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;
  final String? defaultText;
  final Widget? icon;
  final Color? color;

  @override
  _MyPlacePickerState createState() => _MyPlacePickerState();
}

class _MyPlacePickerState extends State<MyPlacePicker> {
  var placePickerValue = const FFPlace();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterFlowPlacePicker(
        iOSGoogleMapsApiKey: 'AIzaSyCGa189ibbYv_GlfmMckfYlsHOEc5RRDSE',
        androidGoogleMapsApiKey: 'AIzaSyD3BF3LlQ_jm7HkDSIni9pGeTF-98gV7iA',
        webGoogleMapsApiKey: 'AIzaSyCecli0giGx_CRhnrErLWcGGNnT496HAcg',
        onSelect: (place) async {
          setState(() => placePickerValue = place);
        },
        defaultText: 'Select Location',
        icon: Icon(
          Icons.place,
          color: Colors.white,
          size: 16,
        ),
        buttonOptions: FFButtonOptions(
          width: double.infinity,
          height: 40,
          color: FlutterFlowTheme.of(context).primaryColor,
          textStyle: FlutterFlowTheme.of(context).title2,
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
