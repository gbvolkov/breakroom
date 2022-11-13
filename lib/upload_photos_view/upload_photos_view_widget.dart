import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

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
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  List<String>? photoCollectionResult;
  List<String>? photosCollectionResultRemove;
  List<PhotoStruct>? photosArray;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().photosCollection = widget.photos!.toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 32),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 64),
                        child: Text(
                          'Upload your\nphotos',
                          style: FlutterFlowTheme.of(context).title1,
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
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.73,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: photoCollection.length,
                        itemBuilder: (context, photoCollectionIndex) {
                          final photoCollectionItem =
                              photoCollection[photoCollectionIndex];
                          return Container(
                            width: 116,
                            height: 150,
                            child: Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                if (photoCollectionItem == null ||
                                    photoCollectionItem == '')
                                  Align(
                                    alignment: AlignmentDirectional(-1, 1),
                                    child: InkWell(
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
                                          setState(
                                              () => isMediaUploading = true);
                                          var downloadUrls = <String>[];
                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
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
                                            isMediaUploading = false;
                                          }
                                          if (downloadUrls.length ==
                                              selectedMedia.length) {
                                            setState(() => uploadedFileUrl =
                                                downloadUrls.first);
                                            showUploadMessage(
                                                context, 'Success!');
                                          } else {
                                            setState(() {});
                                            showUploadMessage(context,
                                                'Failed to upload media');
                                            return;
                                          }
                                        }

                                        if (uploadedFileUrl != null &&
                                            uploadedFileUrl != '') {
                                          photoCollectionResult = await actions
                                              .setImageToCollection(
                                            FFAppState()
                                                .photosCollection
                                                .toList(),
                                            uploadedFileUrl,
                                            valueOrDefault<int>(
                                              photoCollectionIndex,
                                              0,
                                            ),
                                          );
                                          setState(() => FFAppState()
                                                  .photosCollection =
                                              photoCollectionResult!.toList());
                                        }

                                        setState(() {});
                                      },
                                      child: Image.asset(
                                        'assets/images/photo-frame.png',
                                        width: 105,
                                        height: 140,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                if (photoCollectionItem != null &&
                                    photoCollectionItem != '')
                                  Align(
                                    alignment: AlignmentDirectional(-1, 1),
                                    child: Image.network(
                                      photoCollectionItem,
                                      width: 105,
                                      height: 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                if (photoCollectionItem != null &&
                                    photoCollectionItem != '')
                                  Align(
                                    alignment: AlignmentDirectional(1, -1),
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        shape: BoxShape.circle,
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Delete photo',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .backgroundDisable,
                                            ),
                                          );
                                          photosCollectionResultRemove =
                                              await actions
                                                  .setImageToCollection(
                                            FFAppState()
                                                .photosCollection
                                                .toList(),
                                            '.',
                                            photoCollectionIndex,
                                          );
                                          setState(() =>
                                              FFAppState().photosCollection =
                                                  photosCollectionResultRemove!
                                                      .toList());

                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 20,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFEE837B),
                              Color(0xFFF95A82),
                              Color(0xFFEA3C7D)
                            ],
                            stops: [0.13, 0.69, 1],
                            begin: AlignmentDirectional(0, -1),
                            end: AlignmentDirectional(0, 1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            photosArray =
                                await actions.packImageCollectionToPhotos(
                              FFAppState().photosCollection.toList(),
                            );

                            final usersUpdateData = {
                              'photos': getPhotoListFirestoreData(
                                photosArray,
                              ),
                            };
                            await currentUserReference!.update(usersUpdateData);

                            context.pushNamed('HomeView');

                            setState(() {});
                          },
                          text: 'Continue',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48,
                            color: Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle1
                                .override(
                                  fontFamily: 'Roboto',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(8),
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
