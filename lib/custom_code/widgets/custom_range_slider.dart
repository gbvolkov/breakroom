// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({
    Key? key,
    this.width,
    this.height,
    this.minValue,
    this.maxValue,
    this.rangeStart,
    this.activeColor,
    this.inactiveColor,
    this.rangeEnd,
    required this.onValueChanged,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? minValue;
  final double? maxValue;
  final double? rangeStart;
  final double? rangeEnd;
  final Color? activeColor;
  final Color? inactiveColor;
  final Future<dynamic> Function() onValueChanged;

  @override
  _CustomRangeSliderState createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  RangeValues _currentRangeValues = RangeValues(0, 0);
  double _minValue = 0;
  double _maxValue = 0;
  Color _activeColor = Color(0);
  Color _inactiveColor = Color(0);

  @override
  void initState() {
    _minValue = widget.minValue ?? 0;
    _maxValue = widget.maxValue ?? 100;
    _activeColor = widget.activeColor ?? FlutterFlowTheme.of(context).alternate;
    _inactiveColor = widget.inactiveColor ??
        FlutterFlowTheme.of(context).secondaryBackground;
    _currentRangeValues = RangeValues(
        widget.rangeStart ?? _minValue, widget.rangeEnd ?? _maxValue);
    FFAppState().rangeSliderStart = _minValue;
    FFAppState().rangeSliderEnd = _maxValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      max: _maxValue,
      min: _minValue,
      divisions: (_maxValue - _minValue).round(),
      activeColor: _activeColor,
      inactiveColor: _inactiveColor,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        FFAppState().rangeSliderStart = values.start;
        FFAppState().rangeSliderEnd = values.end;

        setState(() {
          _currentRangeValues = values;
        });
        widget.onValueChanged();
      },
    );
  }
}
