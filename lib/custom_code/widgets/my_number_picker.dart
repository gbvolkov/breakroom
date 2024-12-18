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

import 'package:numberpicker/numberpicker.dart' as np;

class MyNumberPicker extends StatefulWidget {
  const MyNumberPicker(
      {Key? key,
      this.width,
      this.height,
      this.personHeight,
      required this.onValueChanged})
      : super(key: key);

  final double? width;
  final double? height;
  final int? personHeight;
  final Future<dynamic> Function() onValueChanged;

  @override
  _MyNumberPickerState createState() => _MyNumberPickerState();
}

int min(int a, int b) {
  return (a < b) ? a : b;
}

int max(int a, int b) {
  return (a > b) ? a : b;
}

class _MyNumberPickerState extends State<MyNumberPicker> {
  late int _currentValue;

  @override
  void initState() {
    _currentValue = min(max(widget.personHeight ?? 65, 55), 85);
    setState(() {
      FFAppState().nmpPickedNumber = _currentValue;
      FFAppState().userHeight = _currentValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return np.NumberPicker(
      value: _currentValue,
      minValue: 55,
      maxValue: 85,
      onChanged: (value) {
        setState(() {
          FFAppState().userHeight = value;
          FFAppState().nmpPickedNumber = value;
          _currentValue = value;
        });
        widget.onValueChanged();
      }, //(value) => widget.updateCallback
      itemCount: 5,
      textStyle: TextStyle(
          color: FlutterFlowTheme.of(context).secondaryText,
          fontSize: FlutterFlowTheme.of(context).title2.fontSize),
      selectedTextStyle: TextStyle(
          color: FlutterFlowTheme.of(context).alternate,
          //fontWeight: FontWeight.bold,
          fontSize: FlutterFlowTheme.of(context).title1.fontSize),
    );
  }
}
