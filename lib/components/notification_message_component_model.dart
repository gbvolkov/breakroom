import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/interaction_type_icon_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationMessageComponentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for InteractionTypeIconWidget component.
  late InteractionTypeIconWidgetModel interactionTypeIconWidgetModel1;
  // Model for InteractionTypeIconWidget component.
  late InteractionTypeIconWidgetModel interactionTypeIconWidgetModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    interactionTypeIconWidgetModel1 =
        createModel(context, () => InteractionTypeIconWidgetModel());
    interactionTypeIconWidgetModel2 =
        createModel(context, () => InteractionTypeIconWidgetModel());
  }

  void dispose() {
    interactionTypeIconWidgetModel1.dispose();
    interactionTypeIconWidgetModel2.dispose();
  }

  /// Additional helper methods are added here.

}
