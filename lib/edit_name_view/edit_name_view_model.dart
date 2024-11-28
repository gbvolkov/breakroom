import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditNameViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtFirstName widget.
  TextEditingController? txtFirstNameController;
  String? Function(BuildContext, String?)? txtFirstNameControllerValidator;
  // State field(s) for txtLastName widget.
  TextEditingController? txtLastNameController;
  String? Function(BuildContext, String?)? txtLastNameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtFirstNameController?.dispose();
    txtLastNameController?.dispose();
  }

  /// Additional helper methods are added here.

}
