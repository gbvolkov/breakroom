import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditBioViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtBio widget.
  TextEditingController? txtBioController;
  String? Function(BuildContext, String?)? txtBioControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtBioController?.dispose();
  }

  /// Additional helper methods are added here.

}
