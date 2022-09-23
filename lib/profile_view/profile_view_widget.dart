import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/menu_add_photo_widget.dart';
import '../edit_profile_new_view/edit_profile_new_view_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../settings_view/settings_view_widget.dart';
import '../welcome_view/welcome_view_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileViewWidget extends StatefulWidget {
  const ProfileViewWidget({Key? key}) : super(key: key);

  @override
  _ProfileViewWidgetState createState() => _ProfileViewWidgetState();
}

class _ProfileViewWidgetState extends State<ProfileViewWidget> {
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: AlignmentDirectional(0.2, 0),
          child: Text(
            'Profile',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).title3.override(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.logout,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              await signOut();
              await Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomeViewWidget(),
                ),
                (r) => false,
              );
            },
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.settings_outlined,
              color: FlutterFlowTheme.of(context).alternate,
              size: 30,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsViewWidget(),
                ),
              );
            },
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 10, 0),
            child: StreamBuilder<List<UserProfilesRecord>>(
              stream: queryUserProfilesRecord(
                queryBuilder: (userProfilesRecord) => userProfilesRecord
                    .where('user', isEqualTo: currentUserReference),
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primaryColor,
                      ),
                    ),
                  );
                }
                List<UserProfilesRecord> columnUserProfilesRecordList =
                    snapshot.data!;
                final columnUserProfilesRecord =
                    columnUserProfilesRecordList.isNotEmpty
                        ? columnUserProfilesRecordList.first
                        : null;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.65,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 24, 0),
                                    child: Container(
                                      width: 105,
                                      child: Stack(
                                        alignment: AlignmentDirectional(
                                            0.050000000000000044,
                                            0.050000000000000044),
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: Icon(
                                              Icons.camera_alt,
                                              color: Color(0x7F050A41),
                                              size: 30,
                                            ),
                                            onPressed: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                allowPhoto: true,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                showUploadMessage(
                                                  context,
                                                  'Uploading file...',
                                                  showLoading: true,
                                                );
                                                final downloadUrls = (await Future
                                                        .wait(selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes))))
                                                    .where((u) => u != null)
                                                    .map((u) => u!)
                                                    .toList();
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                if (downloadUrls.length ==
                                                    selectedMedia.length) {
                                                  setState(() =>
                                                      uploadedFileUrl1 =
                                                          downloadUrls.first);
                                                  showUploadMessage(
                                                    context,
                                                    'Success!',
                                                  );
                                                } else {
                                                  showUploadMessage(
                                                    context,
                                                    'Failed to upload media',
                                                  );
                                                  return;
                                                }
                                              }

                                              final usersUpdateData =
                                                  createUsersRecordData(
                                                photoUrl: uploadedFileUrl1,
                                              );
                                              await currentUserReference!
                                                  .update(usersUpdateData);
                                            },
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -24.58, -1),
                                            child: AuthUserStreamWidget(
                                              child: InkWell(
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    textColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    showUploadMessage(
                                                      context,
                                                      'Uploading file...',
                                                      showLoading: true,
                                                    );
                                                    final downloadUrls = (await Future
                                                            .wait(selectedMedia
                                                                .map((m) async =>
                                                                    await uploadData(
                                                                        m.storagePath,
                                                                        m.bytes))))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    if (downloadUrls.length ==
                                                        selectedMedia.length) {
                                                      setState(() =>
                                                          uploadedFileUrl2 =
                                                              downloadUrls
                                                                  .first);
                                                      showUploadMessage(
                                                        context,
                                                        'Success!',
                                                      );
                                                    } else {
                                                      showUploadMessage(
                                                        context,
                                                        'Failed to upload media',
                                                      );
                                                      return;
                                                    }
                                                  }

                                                  final usersUpdateData =
                                                      createUsersRecordData(
                                                    photoUrl: uploadedFileUrl1,
                                                  );
                                                  await currentUserReference!
                                                      .update(usersUpdateData);
                                                },
                                                child: Container(
                                                  width: 105,
                                                  height: 105,
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
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, -1),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 100, 0, 0),
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                text: valueOrDefault<String>(
                                                  columnUserProfilesRecord!
                                                      .intention,
                                                  'Unset',
                                                ),
                                                options: FFButtonOptions(
                                                  width: 80,
                                                  height: 32,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .backgroundGrey,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  elevation: 0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, -0.05),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${valueOrDefault<String>(
                                          columnUserProfilesRecord!.firstName,
                                          'Unset',
                                        )}, ${functions.getAge(columnUserProfilesRecord!.birthDay).toString()}',
                                        style:
                                            FlutterFlowTheme.of(context).title1,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 8, 0),
                                            child: Icon(
                                              Icons.person_outline_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24,
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              '${valueOrDefault<String>(
                                                columnUserProfilesRecord!
                                                    .industry,
                                                'Unset',
                                              )}, ${valueOrDefault<String>(
                                                columnUserProfilesRecord!
                                                    .occupation,
                                                'Unset',
                                              )}',
                                              'Unset',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await actions
                                                .initializeUserProfileState(
                                              columnUserProfilesRecord!,
                                            );
                                            setState(() => FFAppState()
                                                .profileContainerName = '');
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfileNewViewWidget(
                                                  userProfile:
                                                      columnUserProfilesRecord,
                                                ),
                                              ),
                                            );
                                          },
                                          text: 'Edit profile',
                                          options: FFButtonOptions(
                                            width: 130,
                                            height: 40,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Text(
                                      'Bio',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: Text(
                                      columnUserProfilesRecord!.bio!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Text(
                                      'About me',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
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
                                          text: '${valueOrDefault<String>(
                                            columnUserProfilesRecord!.height
                                                ?.toString(),
                                            '0',
                                          )} sm',
                                          icon: Icon(
                                            Icons.height,
                                            size: 16,
                                          ),
                                          options: FFButtonOptions(
                                            height: 32,
                                            color: FlutterFlowTheme.of(context)
                                                .backgroundGrey,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: columnUserProfilesRecord!
                                              .drinkingStatus!,
                                          icon: Icon(
                                            Icons.wine_bar_outlined,
                                            size: 16,
                                          ),
                                          options: FFButtonOptions(
                                            height: 32,
                                            color: FlutterFlowTheme.of(context)
                                                .backgroundGrey,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: columnUserProfilesRecord!
                                              .smokingStatus!,
                                          icon: Icon(
                                            Icons.smoking_rooms,
                                            size: 16,
                                          ),
                                          options: FFButtonOptions(
                                            height: 32,
                                            color: FlutterFlowTheme.of(context)
                                                .backgroundGrey,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: functions.stringifyList(
                                              columnUserProfilesRecord!
                                                  .lookingFor!
                                                  .toList(),
                                              1),
                                          icon: Icon(
                                            Icons.search_outlined,
                                            size: 16,
                                          ),
                                          options: FFButtonOptions(
                                            height: 32,
                                            color: FlutterFlowTheme.of(context)
                                                .backgroundGrey,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Text(
                                      'Interests',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: Builder(
                                      builder: (context) {
                                        final interests =
                                            columnUserProfilesRecord!.interests!
                                                .toList();
                                        return Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children:
                                              List.generate(interests.length,
                                                  (interestsIndex) {
                                            final interestsItem =
                                                interests[interestsIndex];
                                            return FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: interestsItem,
                                              options: FFButtonOptions(
                                                height: 32,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .backgroundGrey,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 4),
                                    child: Text(
                                      'Photos',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final userPhotos = columnUserProfilesRecord!
                                        .photos!
                                        .toList();
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 0.8,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: userPhotos.length,
                                      itemBuilder: (context, userPhotosIndex) {
                                        final userPhotosItem =
                                            userPhotos[userPhotosIndex];
                                        return Image.network(
                                          userPhotosItem.image!,
                                          width: 100,
                                          height: 130,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
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
                              stops: [0, 0.6, 1],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Color(0x7B000000),
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: MenuAddPhotoWidget(
                                        userProfile: columnUserProfilesRecord,
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              text: 'Add photo',
                              icon: Icon(
                                Icons.add_circle,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48,
                                color: Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
