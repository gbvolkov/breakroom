import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_companions_list_widget_widget.dart';
import '/components/empty_list_widget_widget.dart';
import '/components/menu_report_user_widget.dart';
import '/components/report_user_dialog_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllChatsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtSearch widget.
  TextEditingController? txtSearchController;
  String? Function(BuildContext, String?)? txtSearchControllerValidator;
  // Stores action output result for [Bottom Sheet - Menu_ReportUser] action in SlidableActionWidget widget.
  String? choice;
  // Stores action output result for [Bottom Sheet - ReportUserDialog] action in SlidableActionWidget widget.
  String? report;
  // Stores action output result for [Backend Call - Create Document] action in SlidableActionWidget widget.
  ComplaintsRecord? reportDoc;
  // Stores action output result for [Bottom Sheet - Menu_ReportUser] action in SlidableActionWidget widget.
  String? choiceRecent;
  // Stores action output result for [Bottom Sheet - ReportUserDialog] action in SlidableActionWidget widget.
  String? reportRecent;
  // Stores action output result for [Backend Call - Create Document] action in SlidableActionWidget widget.
  ComplaintsRecord? reportDocRecent;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtSearchController?.dispose();
  }

  /// Additional helper methods are added here.

}
