import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upload_photos_view_model.dart';
export 'upload_photos_view_model.dart';

class UploadPhotosViewWidget extends StatefulWidget {
  const UploadPhotosViewWidget({
    Key? key,
    this.photos,
  }) : super(key: key);

  final List<String>? photos;

  @override
  _UploadPhotosViewWidgetState createState() => _UploadPhotosViewWidgetState();
}

class _UploadPhotosViewWidgetState extends State<UploadPhotosViewWidget> {
  late UploadPhotosViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadPhotosViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().photosCollection = widget.photos!.toList();
        FFAppState().lastUploadedURL = '';
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 64.0),
                        child: Text(
                          'Upload your\nphotos',
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final photoCollection = FFAppState()
                          .photosCollection
                          .toList()
                          .take(6)
                          .toList();
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.73,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: photoCollection.length,
                        itemBuilder: (context, photoCollectionIndex) {
                          final photoCollectionItem =
                              photoCollection[photoCollectionIndex];
                          return Container(
                            width: 116.0,
                            height: 150.0,
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                if (photoCollectionItem == null ||
                                    photoCollectionItem == '')
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];
                                          var downloadUrls = <String>[];
                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            _model.isDataUploading = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl =
                                                  downloadUrls.first;
                                            });
                                            showUploadMessage(
                                                context, 'Success!');
                                          } else {
                                            setState(() {});
                                            showUploadMessage(context,
                                                'Failed to upload data');
                                            return;
                                          }
                                        }

                                        if (_model.uploadedFileUrl != null &&
                                            _model.uploadedFileUrl != '') {
                                          if (_model.uploadedFileUrl !=
                                              FFAppState().lastUploadedURL) {
                                            _model.photoCollectionResult =
                                                await actions
                                                    .setImageToCollection(
                                              FFAppState()
                                                  .photosCollection
                                                  .toList(),
                                              _model.uploadedFileUrl,
                                              valueOrDefault<int>(
                                                photoCollectionIndex,
                                                0,
                                              ),
                                            );
                                            FFAppState().update(() {
                                              FFAppState().photosCollection =
                                                  _model.photoCollectionResult!
                                                      .toList();
                                              FFAppState().lastUploadedURL =
                                                  _model.uploadedFileUrl;
                                            });
                                          }
                                        }

                                        setState(() {});
                                      },
                                      child: Image.asset(
                                        'assets/images/photo-frame.png',
                                        width: 105.0,
                                        height: 140.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                if (photoCollectionItem != null &&
                                    photoCollectionItem != '')
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: Image.network(
                                      photoCollectionItem,
                                      width: 105.0,
                                      height: 140.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                if (photoCollectionItem != null &&
                                    photoCollectionItem != '')
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Container(
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        shape: BoxShape.circle,
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Delete photo',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .backgroundDisable,
                                            ),
                                          );
                                          _model.photosCollectionResultRemove =
                                              await actions
                                                  .setImageToCollection(
                                            FFAppState()
                                                .photosCollection
                                                .toList(),
                                            '.',
                                            photoCollectionIndex,
                                          );
                                          FFAppState().update(() {
                                            FFAppState().photosCollection = _model
                                                .photosCollectionResultRemove!
                                                .toList();
                                          });

                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFEE837B),
                              Color(0xFFF95A82),
                              Color(0xFFEA3C7D)
                            ],
                            stops: [0.13, 0.69, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.photosArray =
                                await actions.packImageCollectionToPhotos(
                              FFAppState().photosCollection.toList(),
                            );

                            final usersUpdateData = {
                              'photos': getPhotoListFirestoreData(
                                _model.photosArray,
                              ),
                            };
                            await currentUserReference!.update(usersUpdateData);

                            context.pushNamed('HomeView');

                            setState(() {});
                          },
                          text: 'Continue',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
