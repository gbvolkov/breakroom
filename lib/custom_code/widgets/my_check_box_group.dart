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

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart'
    as cb;

class MyCheckBoxGroup extends StatefulWidget {
  const MyCheckBoxGroup(
      {Key? key,
      this.width,
      this.height,
      this.buttonLabels,
      this.buttonValues,
      this.horizontal,
      this.buttonWidth,
      this.buttonHeight,
      this.defaultSelected,
      required this.onValue})
      : super(key: key);

  final double? width;
  final double? height;
  final List<String>? buttonLabels;
  final List<String>? buttonValues;
  final double? buttonWidth;
  final double? buttonHeight;
  final bool? horizontal;
  final List<String>? defaultSelected;
  final Future<dynamic> Function() onValue;

  @override
  _MyCheckBoxGroupState createState() => _MyCheckBoxGroupState();
}

class _MyCheckBoxGroupState extends State<MyCheckBoxGroup> {
  late List<String> defaultValue;

  @override
  void initState() {
    //String selValue = widget.defaultSelected ?? "";
    defaultValue = widget.defaultSelected ?? [];
    setState(
      () => FFAppState().mcbSelectedValues = defaultValue,
    );
    super.initState();
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
  late List<Object?> selectedValues;

  @override
  Widget build(BuildContext context) {
    selectedValues = widget.defaultSelected ?? [];

    return cb.CustomCheckBoxGroup<String>(
      unSelectedColor: Theme.of(context).canvasColor,
      buttonLables: widget.buttonLabels ?? ['Option'],
      buttonValuesList: widget.buttonValues ?? ['Option'],
      checkBoxButtonValues: (List values) {
        setState(() => FFAppState().mcbSelectedValues =
            values.map((e) => e.toString()).toList());
        widget.onValue();
      },
      defaultSelected: widget.defaultSelected,
      horizontal: widget.horizontal ?? true,
      width: widget.buttonWidth ?? 120,
      height: widget.buttonHeight ?? 60,
      selectedColor: FlutterFlowTheme.of(context).alternate,
      selectedBorderColor: Colors.transparent,
      unSelectedBorderColor: Colors.transparent,
      padding: 5,
      enableShape: true,
      radius: 15,
      shapeRadius: 15,
      buttonTextStyle: cb.ButtonTextStyle(
          selectedColor: FlutterFlowTheme.of(context).primaryBackground,
          unSelectedColor: FlutterFlowTheme.of(context).primaryText,
          textStyle: TextStyle(
              fontSize: FlutterFlowTheme.of(context).subtitle2.fontSize)),
    );
  }
}
