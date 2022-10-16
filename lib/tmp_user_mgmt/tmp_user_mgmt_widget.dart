import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TmpUserMgmtWidget extends StatefulWidget {
  const TmpUserMgmtWidget({Key? key}) : super(key: key);

  @override
  _TmpUserMgmtWidgetState createState() => _TmpUserMgmtWidgetState();
}

class _TmpUserMgmtWidgetState extends State<TmpUserMgmtWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<List<UserProfilesRecord>>(
                  stream: queryUserProfilesRecord(),
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
                    List<UserProfilesRecord> listViewUserProfilesRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewUserProfilesRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewUserProfilesRecord =
                            listViewUserProfilesRecordList[listViewIndex];
                        return InkWell(
                          onTap: () async {
                            final usersUpdateData = {
                              ...createUsersRecordData(
                                displayName:
                                    '${listViewUserProfilesRecord.firstName}, ${functions.getAge(listViewUserProfilesRecord.birthDay).toString()}',
                                firstName: listViewUserProfilesRecord.firstName,
                                lastName: listViewUserProfilesRecord.lastName,
                                birthDay: listViewUserProfilesRecord.birthDay,
                                industry: listViewUserProfilesRecord.industry,
                                occupation:
                                    listViewUserProfilesRecord.occupation,
                                bio: listViewUserProfilesRecord.bio,
                                gender: listViewUserProfilesRecord.gender,
                                genderPreference:
                                    listViewUserProfilesRecord.genderPreference,
                                intention: listViewUserProfilesRecord.intention,
                                childfreeStatus:
                                    listViewUserProfilesRecord.childfreeStatus,
                                religion: listViewUserProfilesRecord.religion,
                                education: listViewUserProfilesRecord.education,
                                bodyType: listViewUserProfilesRecord.bodyType,
                                height: listViewUserProfilesRecord.height,
                                weight: listViewUserProfilesRecord.weight,
                                workoutStatus:
                                    listViewUserProfilesRecord.workoutStatus,
                                drinkingStatus:
                                    listViewUserProfilesRecord.drinkingStatus,
                                smokingStatus:
                                    listViewUserProfilesRecord.smokingStatus,
                                spiritualStatus:
                                    listViewUserProfilesRecord.spiritualStatus,
                              ),
                              'interests': listViewUserProfilesRecord.interests!
                                  .toList(),
                              'lookingFor': listViewUserProfilesRecord
                                  .lookingFor!
                                  .toList(),
                              'photos': getPhotoListFirestoreData(
                                listViewUserProfilesRecord.photos!.toList(),
                              ),
                            };
                            await listViewUserProfilesRecord.user!
                                .update(usersUpdateData);
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Upfate user'),
                                  content: Text('Done'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            child: Text(
                              listViewUserProfilesRecord.firstName!,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
