// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart'
    as rb;

class MyRadioButton extends StatefulWidget {
  const MyRadioButton(
      {Key? key,
      this.width,
      this.height,
      this.buttonLabels,
      this.buttonValues,
      this.horizontal,
      this.buttonWidth,
      this.buttonHeight,
      this.defaultSelected})
      : super(key: key);

  final double? width;
  final double? height;
  final double? buttonWidth;
  final double? buttonHeight;
  final bool? horizontal;
  final List<String>? buttonLabels;
  final List<String>? buttonValues;
  final String? defaultSelected;

  @override
  _MyRadioButtonState createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  //@override
  //Widget build(BuildContext context) {
  //  return NumberPicker(
  //        value: _currentValue,
  //        minValue: 150,
  //        maxValue: 220,
  //        onChanged: (value) => setState(() => _currentValue = value)
  //      );
  //  }

  @override
  Widget build(BuildContext context) {
    return rb.CustomRadioButton(
      elevation: 0,
      horizontal: widget.horizontal ?? false,
      unSelectedColor: FlutterFlowTheme.of(context).primaryBackground,
      buttonLables: widget.buttonLabels ?? ['Option'],
      buttonValues: widget.buttonValues ?? ['Option'],
      radioButtonValue: (value) {
        print(value);
      },
      defaultSelected: widget.defaultSelected,
      width: widget.buttonWidth ?? 150,
      height: widget.buttonHeight ?? 60,
      selectedColor: FlutterFlowTheme.of(context).alternate,
      selectedBorderColor: Colors.transparent,
      unSelectedBorderColor: Colors.transparent,
      padding: 5,
      enableShape: true,
    );
  }
}
