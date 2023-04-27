import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_view_model.dart';
export 'edit_profile_view_model.dart';

class EditProfileViewWidget extends StatefulWidget {
  const EditProfileViewWidget({Key? key}) : super(key: key);

  @override
  _EditProfileViewWidgetState createState() => _EditProfileViewWidgetState();
}

class _EditProfileViewWidgetState extends State<EditProfileViewWidget> {
  late EditProfileViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileViewModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              color: FlutterFlowTheme.of(context).alternate,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Visibility(
            visible: FFAppState().profileContainerName != 'Basics',
            child: Text(
              'Edit profile',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22.0,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 105.0,
                                height: 105.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    currentUserPhoto,
                                    'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];
                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
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
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload data');
                                    return;
                                  }
                                }

                                if (_model.uploadedFileUrl != null &&
                                    _model.uploadedFileUrl != '') {
                                  final usersUpdateData = createUsersRecordData(
                                    photoUrl: _model.uploadedFileUrl,
                                  );
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                }
                              },
                              text: 'Change profile photo',
                              options: FFButtonOptions(
                                width: 210.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
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
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              'Name',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('EditNameView');

                              FFAppState().update(() {
                                FFAppState().usrFirstName =
                                    FFAppState().usrFirstName;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 42.0,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: SelectionArea(
                                          child: Text(
                                        '${FFAppState().usrFirstName} ${FFAppState().usrLastName}'
                                            .maybeHandleOverflow(
                                          maxChars: 35,
                                          replacement: '…',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      )),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 32.0,
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('EditNameView');

                                    FFAppState().update(() {
                                      FFAppState().usrFirstName =
                                          FFAppState().usrFirstName;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Bio',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('EditBioView');

                              FFAppState().update(() {
                                FFAppState().usrFirstName =
                                    FFAppState().usrFirstName;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 62.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Text(
                                      FFAppState().usrBio.maybeHandleOverflow(
                                            maxChars: 100,
                                            replacement: '…',
                                          ),
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 32.0,
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('EditBioView');

                                    FFAppState().update(() {
                                      FFAppState().usrFirstName =
                                          FFAppState().usrFirstName;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Industry',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('EditIndustryView');

                              FFAppState().update(() {
                                FFAppState().usrFirstName =
                                    FFAppState().usrFirstName;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                        .usrIndustry
                                        .maybeHandleOverflow(
                                          maxChars: 35,
                                          replacement: '…',
                                        ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 32.0,
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('EditIndustryView');

                                    FFAppState().update(() {
                                      FFAppState().usrFirstName =
                                          FFAppState().usrFirstName;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Occupation',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('EditOccupationView');

                              FFAppState().update(() {
                                FFAppState().usrFirstName =
                                    FFAppState().usrFirstName;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                        .usrOccupation
                                        .maybeHandleOverflow(
                                          maxChars: 35,
                                          replacement: '…',
                                        ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 32.0,
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('EditOccupationView');

                                    FFAppState().update(() {
                                      FFAppState().usrFirstName =
                                          FFAppState().usrFirstName;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Date of birth',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.userBDay1 = await actions.vvShowDatePicker(
                                context,
                                FFAppState().usrBDay,
                                'Birthday',
                                'Enter your birthday',
                                'Birthday',
                              );
                              if (_model.userBDay1 != null) {
                                FFAppState().update(() {
                                  FFAppState().usrBDay = _model.userBDay1;
                                });
                              }

                              setState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    dateTimeFormat('yMd', FFAppState().usrBDay),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 32.0,
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    _model.userBDay =
                                        await actions.vvShowDatePicker(
                                      context,
                                      FFAppState().usrBDay,
                                      'Birthday',
                                      'Enter your birthday',
                                      'Birthday',
                                    );
                                    if (_model.userBDay != null) {
                                      FFAppState().update(() {
                                        FFAppState().usrBDay = _model.userBDay;
                                      });
                                    }

                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Gender',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('EditGenderView');

                              FFAppState().update(() {
                                FFAppState().usrFirstName =
                                    FFAppState().usrFirstName;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    FFAppState().usrGender,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 32.0,
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('EditGenderView');

                                    FFAppState().update(() {
                                      FFAppState().usrFirstName =
                                          FFAppState().usrFirstName;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Preferences',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('EditGenderPrefsView');

                              FFAppState().update(() {
                                FFAppState().usrFirstName =
                                    FFAppState().usrFirstName;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                        .usrGenderPreference
                                        .maybeHandleOverflow(
                                          maxChars: 35,
                                          replacement: '…',
                                        ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 32.0,
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('EditGenderPrefsView');

                                    FFAppState().update(() {
                                      FFAppState().usrFirstName =
                                          FFAppState().usrFirstName;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Status',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('EditStatusView');

                              FFAppState().update(() {
                                FFAppState().usrFirstName =
                                    FFAppState().usrFirstName;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                        .usrIntention
                                        .maybeHandleOverflow(
                                          maxChars: 35,
                                          replacement: '…',
                                        ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 32.0,
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('EditStatusView');

                                    FFAppState().update(() {
                                      FFAppState().usrFirstName =
                                          FFAppState().usrFirstName;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('EditInterestsView');

                              FFAppState().update(() {
                                FFAppState().usrFirstName =
                                    FFAppState().usrFirstName;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 4.0),
                                    child: Text(
                                      'Interests',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 32.0,
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('EditInterestsView');

                                    FFAppState().update(() {
                                      FFAppState().usrFirstName =
                                          FFAppState().usrFirstName;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    final interests =
                                        FFAppState().usrInterests.toList();
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('EditInterestsView');
                                      },
                                      child: Wrap(
                                        spacing: 8.0,
                                        runSpacing: 8.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: List.generate(
                                            interests.length, (interestsIndex) {
                                          final interestsItem =
                                              interests[interestsIndex];
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                  'EditInterestsView');
                                            },
                                            text: interestsItem,
                                            options: FFButtonOptions(
                                              height: 32.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.transparent,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 0.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('EditBasicsView');

                              FFAppState().update(() {
                                FFAppState().usrFirstName =
                                    FFAppState().usrFirstName;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 4.0),
                                    child: Text(
                                      'Basics',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 32.0,
                                  icon: Icon(
                                    Icons.chevron_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('EditBasicsView');

                                    FFAppState().update(() {
                                      FFAppState().usrFirstName =
                                          FFAppState().usrFirstName;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Wrap(
                                      spacing: 8.0,
                                      runSpacing: 8.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text:
                                              '${FFAppState().usrHeight.toString()} in',
                                          icon: Icon(
                                            Icons.height,
                                            size: 16.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 32.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .backgroundGrey,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: FFAppState().usrDrinkingStatus,
                                          icon: Icon(
                                            Icons.wine_bar_outlined,
                                            size: 16.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 32.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .backgroundGrey,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: FFAppState().usrSmokingStatus,
                                          icon: Icon(
                                            Icons.smoking_rooms,
                                            size: 16.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 32.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .backgroundGrey,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: functions.stringifyList(
                                              FFAppState()
                                                  .usrLookingFor
                                                  .toList(),
                                              1),
                                          icon: Icon(
                                            Icons.search_outlined,
                                            size: 16.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 32.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .backgroundGrey,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
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
                            stops: [0.0, 0.6, 1.0],
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
                            final usersUpdateData = {
                              ...createUsersRecordData(
                                firstName: FFAppState().usrFirstName,
                                lastName: FFAppState().usrLastName,
                                birthDay: FFAppState().usrBDay,
                                industry: FFAppState().usrIndustry,
                                occupation: FFAppState().usrOccupation,
                                bio: FFAppState().usrBio,
                                gender: FFAppState().usrGender,
                                genderPreference:
                                    FFAppState().usrGenderPreference,
                                intention: FFAppState().usrIntention,
                                childfreeStatus:
                                    FFAppState().usrChildfreeStatus,
                                religion: FFAppState().usrReligion,
                                education: FFAppState().usrEducation,
                                bodyType: FFAppState().usrBodyType,
                                workoutStatus: FFAppState().usrWorkoutStatus,
                                drinkingStatus: FFAppState().usrDrinkingStatus,
                                smokingStatus: FFAppState().usrSmokingStatus,
                                spiritualStatus:
                                    FFAppState().usrSpiritualStatus,
                                height: FFAppState().usrHeight,
                                weight: 80,
                                displayName:
                                    '${FFAppState().usrFirstName}, ${functions.getAge(FFAppState().usrBDay).toString()}',
                              ),
                              'interests': FFAppState().usrInterests,
                              'lookingFor': FFAppState().usrLookingFor,
                            };
                            await currentUserReference!.update(usersUpdateData);
                            context.pop();
                          },
                          text: 'Save',
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
