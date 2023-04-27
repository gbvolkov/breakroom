import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditOccupationViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtOccupation widget.
  TextEditingController? txtOccupationController;
  String? Function(BuildContext, String?)? txtOccupationControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtOccupationController?.dispose();
  }

  /// Additional helper methods are added here.

}
