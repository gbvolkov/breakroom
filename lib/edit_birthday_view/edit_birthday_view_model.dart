import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditBirthdayViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for calBDay widget.
  DateTimeRange? calBDaySelectedDay;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calBDaySelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
