import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/gender_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileViewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getUserDocument] action in ProfileView widget.
  UsersRecord? userDoc;
  // Stores action output result for [Custom Action - getAddressFromLocation] action in ProfileView widget.
  String? userAddress;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Model for GenderIcon component.
  late GenderIconModel genderIconModel;
  // Stores action output result for [Custom Action - getAddressFromLocation] action in IconButton widget.
  String? address;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Custom Action - clearPhotosList] action in Button widget.
  List<PhotoStruct>? clearedPhotos;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    genderIconModel = createModel(context, () => GenderIconModel());
  }

  void dispose() {
    genderIconModel.dispose();
  }

  /// Additional helper methods are added here.

}
