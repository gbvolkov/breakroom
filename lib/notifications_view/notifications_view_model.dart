import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list_widget_widget.dart';
import '/components/notification_message_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for EmptyListWidget component.
  late EmptyListWidgetModel emptyListWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emptyListWidgetModel = createModel(context, () => EmptyListWidgetModel());
  }

  void dispose() {
    emptyListWidgetModel.dispose();
  }

  /// Additional helper methods are added here.

}
