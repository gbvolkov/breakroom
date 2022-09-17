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
  const MyRadioButton({
    Key? key,
    this.width,
    this.height,
    this.buttonLabels,
    this.buttonValues,
    this.horizontal,
    this.buttonWidth,
    this.buttonHeight,
    this.defaultSelected,
    required this.onValue,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? buttonWidth;
  final double? buttonHeight;
  final bool? horizontal;
  final List<String>? buttonLabels;
  final List<String>? buttonValues;
  final String? defaultSelected;
  final Future<dynamic> Function() onValue;

  @override
  _MyRadioButtonState createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  //late String selValue;
  late String defaultValue;

  @override
  void initState() {
    //String selValue = widget.defaultSelected ?? "";
    defaultValue = widget.defaultSelected ?? "";
    if (defaultValue.isEmpty) {
      defaultValue = widget.buttonValues?[0] ?? "";
    } else if (widget.buttonValues != null) {
      if (!widget.buttonValues!.contains(defaultValue)) {
        widget.buttonLabels?.add(defaultValue);
        widget.buttonValues!.add(defaultValue);
      }
      FFAppState().mrbSelectedValue = defaultValue;
    }
    super.initState();

    /*if (!(widget.buttonValues ?? []).contains(widget.defaultSelected ?? "")) {
      (widget.buttonValues ?? []).add(widget.defaultSelected ?? ""); //defaultValue = (widget.buttonValues ?? [])[0];
    } else {
      defaultValue = widget.defaultSelected ?? "";
    }*/
  }

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
    return rb.CustomRadioButton<String>(
      elevation: 0,
      horizontal: widget.horizontal ?? false,
      unSelectedColor: FlutterFlowTheme.of(context).primaryBackground,
      buttonLables: widget.buttonLabels ?? ['Option'],
      buttonValues: widget.buttonValues ?? ['Option'],
      radioButtonValue: (value) {
        setState(() => {
              FFAppState().mrbSelectedValue = value.toString(),
            });
        widget.onValue();
      },
      defaultSelected: defaultValue,
      width: widget.buttonWidth ?? 150,
      height: widget.buttonHeight ?? 60,
      selectedColor: FlutterFlowTheme.of(context).alternate,
      selectedBorderColor: Colors.transparent,
      unSelectedBorderColor: FlutterFlowTheme.of(context).alternate,
      padding: 5,
      enableShape: true,
      radius: 15,
      shapeRadius: 15,
      buttonTextStyle: rb.ButtonTextStyle(
          selectedColor: FlutterFlowTheme.of(context).primaryBackground,
          unSelectedColor: FlutterFlowTheme.of(context).primaryText,
          textStyle: TextStyle(
              fontSize: FlutterFlowTheme.of(context).subtitle1.fontSize)),
    );
  }
}
