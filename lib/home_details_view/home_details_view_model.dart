import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/gender_icon_widget.dart';
import '/components/likes_limit_exceed_widget_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeDetailsViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for GenderIcon component.
  late GenderIconModel genderIconModel;
  // Stores action output result for [Custom Action - canProcessLikeAction] action in IconButton widget.
  int? clikesState;
  // Stores action output result for [Bottom Sheet - LikesLimitExceedWidget] action in IconButton widget.
  bool? didPurchase;
  // Stores action output result for [Group Chat Action] action in IconButton widget.
  ChatsRecord? groupChat;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    genderIconModel = createModel(context, () => GenderIconModel());
  }

  void dispose() {
    genderIconModel.dispose();
  }

  /// Additional helper methods are added here.

}
