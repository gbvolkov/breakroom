import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangeEmailViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailTextField widget.
  TextEditingController? emailTextFieldController;
  String? Function(BuildContext, String?)? emailTextFieldControllerValidator;
  // State field(s) for passwordTextField widget.
  TextEditingController? passwordTextFieldController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)? passwordTextFieldControllerValidator;
  // Stores action output result for [Custom Action - reauthUser] action in Button widget.
  String? reauthUserResult;
  // Stores action output result for [Custom Action - resetUserEmail] action in Button widget.
  bool? isOK;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordTextFieldVisibility = false;
  }

  void dispose() {
    emailTextFieldController?.dispose();
    passwordTextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
