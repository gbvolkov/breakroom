import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_add_photo_model.dart';
export 'menu_add_photo_model.dart';

class MenuAddPhotoWidget extends StatefulWidget {
  const MenuAddPhotoWidget({Key? key}) : super(key: key);

  @override
  _MenuAddPhotoWidgetState createState() => _MenuAddPhotoWidgetState();
}

class _MenuAddPhotoWidgetState extends State<MenuAddPhotoWidget> {
  late MenuAddPhotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuAddPhotoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 270.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).noColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FFButtonWidget(
              onPressed: () async {
                final selectedMedia = await selectMedia(
                  mediaSource: MediaSource.photoGallery,
                  multiImage: false,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
                  setState(() => _model.isDataUploading1 = true);
                  var selectedUploadedFiles = <FFUploadedFile>[];
                  var downloadUrls = <String>[];
                  try {
                    showUploadMessage(
                      context,
                      'Uploading file...',
                      showLoading: true,
                    );
                    selectedUploadedFiles = selectedMedia
                        .map((m) => FFUploadedFile(
                              name: m.storagePath.split('/').last,
                              bytes: m.bytes,
                              height: m.dimensions?.height,
                              width: m.dimensions?.width,
                              blurHash: m.blurHash,
                            ))
                        .toList();

                    downloadUrls = (await Future.wait(
                      selectedMedia.map(
                        (m) async => await uploadData(m.storagePath, m.bytes),
                      ),
                    ))
                        .where((u) => u != null)
                        .map((u) => u!)
                        .toList();
                  } finally {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    _model.isDataUploading1 = false;
                  }
                  if (selectedUploadedFiles.length == selectedMedia.length &&
                      downloadUrls.length == selectedMedia.length) {
                    setState(() {
                      _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                      _model.uploadedFileUrl1 = downloadUrls.first;
                    });
                    showUploadMessage(context, 'Success!');
                  } else {
                    setState(() {});
                    showUploadMessage(context, 'Failed to upload data');
                    return;
                  }
                }

                if (_model.uploadedFileUrl1 != null &&
                    _model.uploadedFileUrl1 != '') {
                  final usersUpdateData = {
                    'photos': FieldValue.arrayUnion([
                      getPhotoFirestoreData(
                        createPhotoStruct(
                          image: _model.uploadedFileUrl1,
                          rating: 0.0,
                          clearUnsetFields: true,
                        ),
                        true,
                      )
                    ]),
                  };
                  await currentUserReference!.update(usersUpdateData);
                }
              },
              text: 'From gallery',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.normal,
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  final selectedMedia = await selectMedia(
                    multiImage: false,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    setState(() => _model.isDataUploading2 = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];
                    var downloadUrls = <String>[];
                    try {
                      showUploadMessage(
                        context,
                        'Uploading file...',
                        showLoading: true,
                      );
                      selectedUploadedFiles = selectedMedia
                          .map((m) => FFUploadedFile(
                                name: m.storagePath.split('/').last,
                                bytes: m.bytes,
                                height: m.dimensions?.height,
                                width: m.dimensions?.width,
                                blurHash: m.blurHash,
                              ))
                          .toList();

                      downloadUrls = (await Future.wait(
                        selectedMedia.map(
                          (m) async => await uploadData(m.storagePath, m.bytes),
                        ),
                      ))
                          .where((u) => u != null)
                          .map((u) => u!)
                          .toList();
                    } finally {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      _model.isDataUploading2 = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length &&
                        downloadUrls.length == selectedMedia.length) {
                      setState(() {
                        _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                        _model.uploadedFileUrl2 = downloadUrls.first;
                      });
                      showUploadMessage(context, 'Success!');
                    } else {
                      setState(() {});
                      showUploadMessage(context, 'Failed to upload data');
                      return;
                    }
                  }

                  if (_model.uploadedFileUrl2 != null &&
                      _model.uploadedFileUrl2 != '') {
                    final usersUpdateData = {
                      'photos': FieldValue.arrayUnion([
                        getPhotoFirestoreData(
                          createPhotoStruct(
                            image: _model.uploadedFileUrl2,
                            rating: 0.0,
                            clearUnsetFields: false,
                          ),
                          true,
                        )
                      ]),
                    };
                    await currentUserReference!.update(usersUpdateData);
                  }
                },
                text: 'Take a photo',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Cancel',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).alternate,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
