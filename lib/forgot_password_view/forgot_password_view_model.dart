import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;
  // State field(s) for txtEmail widget.
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  // State field(s) for Timer widget.
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  // Stores action output result for [Custom Action - sendPwdResetEmail] action in Button widget.
  String? error;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    newPassword1TextFieldVisibility = false;
    newPassword2TextFieldVisibility = false;
  }

  void dispose() {
    txtEmailController?.dispose();
    timerController.dispose();
    pinCodeController?.dispose();
    newPassword1TextFieldController?.dispose();
    newPassword2TextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
