// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:numberpicker/numberpicker.dart' as np;

class MyNumberPicker extends StatefulWidget {
  const MyNumberPicker(
      {Key? key,
      this.width,
      this.height,
      required this.personHeight,
      required this.updateCallback})
      : super(key: key);

  final double? width;
  final double? height;
  final int personHeight;
  final Future<dynamic> Function() updateCallback;

  @override
  _MyNumberPickerState createState() => _MyNumberPickerState();
}

class _MyNumberPickerState extends State<MyNumberPicker> {
  int _currentValue = 170;

  @override
  Widget build(BuildContext context) {
    return np.NumberPicker(
        value: _currentValue,
        minValue: 150,
        maxValue: 220,
        onChanged: (value) => widget.updateCallback
        //(value) => setState(() => _currentValue = value)
        );
  }
}
