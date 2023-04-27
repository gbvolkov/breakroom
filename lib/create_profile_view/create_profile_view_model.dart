import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProfileViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;
  // State field(s) for txtFirstName widget.
  TextEditingController? txtFirstNameController;
  String? Function(BuildContext, String?)? txtFirstNameControllerValidator;
  // State field(s) for txtSecondName widget.
  TextEditingController? txtSecondNameController;
  String? Function(BuildContext, String?)? txtSecondNameControllerValidator;
  // Stores action output result for [Custom Action - vvShowDatePicker] action in IconButton widget.
  DateTime? userBDay;
  // State field(s) for ddIndustry widget.
  String? ddIndustryValue;
  FormFieldController<String>? ddIndustryValueController;
  // State field(s) for txtOccupation widget.
  TextEditingController? txtOccupationController;
  String? Function(BuildContext, String?)? txtOccupationControllerValidator;
  // State field(s) for txtBio widget.
  TextEditingController? txtBioController;
  String? Function(BuildContext, String?)? txtBioControllerValidator;
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtFirstNameController?.dispose();
    txtSecondNameController?.dispose();
    txtOccupationController?.dispose();
    txtBioController?.dispose();
  }

  /// Additional helper methods are added here.

}
