import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/allow_location_notiff_window_widget.dart';
import '/components/empty_candidates_list_widget_widget.dart';
import '/components/gender_icon_widget.dart';
import '/components/likes_limit_exceed_widget_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class HomeViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getUserDocument] action in HomeView widget.
  UsersRecord? userDoc;
  // State field(s) for SwipeableStack widget.
  late SwipeableCardSectionController swipeableStackController;
  // Stores action output result for [Custom Action - canProcessLikeAction] action in SwipeableStack widget.
  int? clikesState;
  // Stores action output result for [Bottom Sheet - LikesLimitExceedWidget] action in SwipeableStack widget.
  bool? didPurchase;
  // Stores action output result for [Group Chat Action] action in SwipeableStack widget.
  ChatsRecord? groupChat;
  // Stores action output result for [Custom Action - getLastString] action in IconButton widget.
  String? uid;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    swipeableStackController = SwipeableCardSectionController();
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
