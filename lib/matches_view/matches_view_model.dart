import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_matches_widget_widget.dart';
import '/components/gender_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MatchesViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtSearch widget.
  TextEditingController? txtSearchController;
  String? Function(BuildContext, String?)? txtSearchControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtSearchController?.dispose();
  }

  /// Additional helper methods are added here.

}
