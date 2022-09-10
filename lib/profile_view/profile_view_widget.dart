import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/menu_add_photo_widget.dart';
import '../edit_profile_view/edit_profile_view_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../welcome_view/welcome_view_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileViewWidget extends StatefulWidget {
  const ProfileViewWidget({Key? key}) : super(key: key);

  @override
  _ProfileViewWidgetState createState() => _ProfileViewWidgetState();
}

class _ProfileViewWidgetState extends State<ProfileViewWidget> {
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
            style: FlutterFlowTheme.of(context).title3,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: InkWell(
              onTap: () async {
                await signOut();
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeViewWidget(),
                  ),
                  (r) => false,
                );
              },
              child: Icon(
                Icons.settings_outlined,
                color: FlutterFlowTheme.of(context).alternate,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
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
                  return SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Divider(
                          height: 30,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Row(
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
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -24.58, -1),
                                            child: AuthUserStreamWidget(
                                              child: Container(
                                                width: 105,
                                                height: 105,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  currentUserPhoto,
                                                  fit: BoxFit.cover,
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
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfileViewWidget(
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
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontWeight: FontWeight.normal,
                                                ),
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
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              'Bio',
                              style: FlutterFlowTheme.of(context).subtitle1,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              'About me',
                              style: FlutterFlowTheme.of(context).subtitle1,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
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
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text:
                                      columnUserProfilesRecord!.drinkingStatus!,
                                  icon: Icon(
                                    Icons.wine_bar_outlined,
                                    size: 16,
                                  ),
                                  options: FFButtonOptions(
                                    height: 32,
                                    color: FlutterFlowTheme.of(context)
                                        .backgroundGrey,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text:
                                      columnUserProfilesRecord!.smokingStatus!,
                                  icon: Icon(
                                    Icons.smoking_rooms,
                                    size: 16,
                                  ),
                                  options: FFButtonOptions(
                                    height: 32,
                                    color: FlutterFlowTheme.of(context)
                                        .backgroundGrey,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: functions.stringifyList(
                                      columnUserProfilesRecord!.lookingFor!
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
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              'Interests',
                              style: FlutterFlowTheme.of(context).subtitle1,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Builder(
                              builder: (context) {
                                final interests = columnUserProfilesRecord!
                                    .interests!
                                    .toList();
                                return Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(interests.length,
                                      (interestsIndex) {
                                    final interestsItem =
                                        interests[interestsIndex];
                                    return FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Gamer',
                                      options: FFButtonOptions(
                                        height: 32,
                                        color: FlutterFlowTheme.of(context)
                                            .backgroundGrey,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
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
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                            child: Text(
                              'Photos',
                              style: FlutterFlowTheme.of(context).subtitle1,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
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
                                      child: MenuAddPhotoWidget(),
                                    );
                                  },
                                );
                              },
                              text: 'Add photo',
                              icon: Icon(
                                Icons.add_circle,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48,
                                color: FlutterFlowTheme.of(context).alternate,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontWeight: FontWeight.normal,
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
                        Builder(
                          builder: (context) {
                            final userPhotos =
                                columnUserProfilesRecord!.photos!.toList();
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
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
