import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for currentPasswordTextField widget.
  TextEditingController? currentPasswordTextFieldController;
  late bool currentPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      currentPasswordTextFieldControllerValidator;
  // State field(s) for newPassword1TextField widget.
  TextEditingController? newPassword1TextFieldController;
  late bool newPassword1TextFieldVisibility;
  String? Function(BuildContext, String?)?
      newPassword1TextFieldControllerValidator;
  // State field(s) for newPassword2TextField widget.
  TextEditingController? newPassword2TextFieldController;
  late bool newPassword2TextFieldVisibility;
  String? Function(BuildContext, String?)?
      newPassword2TextFieldControllerValidator;
  // Stores action output result for [Custom Action - reauthUser] action in btnSaveNewPassword widget.
  String? reauthUserResult1;
  // Stores action output result for [Custom Action - resetUserPassword] action in btnSaveNewPassword widget.
  bool? isPwdChanged;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    currentPasswordTextFieldVisibility = false;
    newPassword1TextFieldVisibility = false;
    newPassword2TextFieldVisibility = false;
  }

  void dispose() {
    currentPasswordTextFieldController?.dispose();
    newPassword1TextFieldController?.dispose();
    newPassword2TextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
