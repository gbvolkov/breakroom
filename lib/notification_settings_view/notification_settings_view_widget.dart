import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationSettingsViewWidget extends StatefulWidget {
  const NotificationSettingsViewWidget({Key? key}) : super(key: key);

  @override
  _NotificationSettingsViewWidgetState createState() =>
      _NotificationSettingsViewWidgetState();
}

class _NotificationSettingsViewWidgetState
    extends State<NotificationSettingsViewWidget> {
  bool? switchAllNotificationsValue1;
  bool? switchAllNotificationsValue2;
  bool? switchReceivedLikeNotificationsValue;
  bool? switchMatchNotificationsValue;
  bool? switchMessagesNotificationsValue;
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
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).alternate,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Notifications',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
            child: StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(currentUserReference!),
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
                final columnUsersRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Receive all notifications',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                        Expanded(
                                          child: SwitchListTile(
                                            value:
                                                switchAllNotificationsValue1 ??=
                                                    columnUsersRecord
                                                        .notiffAll!,
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  switchAllNotificationsValue1 =
                                                      newValue!);
                                              if (newValue!) {
                                                final usersUpdateData =
                                                    createUsersRecordData(
                                                  notiffAll: true,
                                                );
                                                await columnUsersRecord
                                                    .reference
                                                    .update(usersUpdateData);
                                              } else {
                                                final usersUpdateData =
                                                    createUsersRecordData(
                                                  notiffAll: false,
                                                );
                                                await columnUsersRecord
                                                    .reference
                                                    .update(usersUpdateData);
                                              }
                                            },
                                            activeColor: Color(0xFF27AE60),
                                            activeTrackColor: Color(0xFFA0E0BC),
                                            dense: false,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 16),
                      child: Text(
                        'Notify me when:',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    if (false)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  alignment: AlignmentDirectional(0, 0),
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 54,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Receive all notifications',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2,
                                            ),
                                            Expanded(
                                              child: SwitchListTile(
                                                value:
                                                    switchAllNotificationsValue2 ??=
                                                        columnUsersRecord
                                                            .notiffAll!,
                                                onChanged: (newValue) async {
                                                  setState(() =>
                                                      switchAllNotificationsValue2 =
                                                          newValue!);
                                                  if (newValue!) {
                                                    final usersUpdateData =
                                                        createUsersRecordData(
                                                      notiffAll: true,
                                                    );
                                                    await columnUsersRecord
                                                        .reference
                                                        .update(
                                                            usersUpdateData);
                                                  } else {
                                                    final usersUpdateData =
                                                        createUsersRecordData(
                                                      notiffAll: false,
                                                    );
                                                    await columnUsersRecord
                                                        .reference
                                                        .update(
                                                            usersUpdateData);
                                                  }
                                                },
                                                activeColor: Color(0xFF27AE60),
                                                activeTrackColor:
                                                    Color(0xFFA0E0BC),
                                                dense: false,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Received like',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2,
                                          ),
                                          Expanded(
                                            child: SwitchListTile(
                                              value:
                                                  switchReceivedLikeNotificationsValue ??=
                                                      columnUsersRecord
                                                          .notiffLikes!,
                                              onChanged: (newValue) async {
                                                setState(() =>
                                                    switchReceivedLikeNotificationsValue =
                                                        newValue!);
                                                if (newValue!) {
                                                  final usersUpdateData =
                                                      createUsersRecordData(
                                                    notiffLikes: true,
                                                  );
                                                  await columnUsersRecord
                                                      .reference
                                                      .update(usersUpdateData);
                                                } else {
                                                  final usersUpdateData =
                                                      createUsersRecordData(
                                                    notiffLikes: false,
                                                  );
                                                  await columnUsersRecord
                                                      .reference
                                                      .update(usersUpdateData);
                                                }
                                              },
                                              activeColor: Color(0xFF27AE60),
                                              activeTrackColor:
                                                  Color(0xFFA0E0BC),
                                              dense: false,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Match',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2,
                                          ),
                                          Expanded(
                                            child: SwitchListTile(
                                              value:
                                                  switchMatchNotificationsValue ??=
                                                      columnUsersRecord
                                                          .nofittMatches!,
                                              onChanged: (newValue) async {
                                                setState(() =>
                                                    switchMatchNotificationsValue =
                                                        newValue!);
                                                if (newValue!) {
                                                  final usersUpdateData =
                                                      createUsersRecordData(
                                                    nofittMatches: true,
                                                  );
                                                  await columnUsersRecord
                                                      .reference
                                                      .update(usersUpdateData);
                                                } else {
                                                  final usersUpdateData =
                                                      createUsersRecordData(
                                                    nofittMatches: false,
                                                  );
                                                  await columnUsersRecord
                                                      .reference
                                                      .update(usersUpdateData);
                                                }
                                              },
                                              activeColor: Color(0xFF27AE60),
                                              activeTrackColor:
                                                  Color(0xFFA0E0BC),
                                              dense: false,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (false)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Messages',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2,
                                          ),
                                          Expanded(
                                            child: SwitchListTile(
                                              value:
                                                  switchMessagesNotificationsValue ??=
                                                      columnUsersRecord
                                                          .notiffMsgs!,
                                              onChanged: (newValue) async {
                                                setState(() =>
                                                    switchMessagesNotificationsValue =
                                                        newValue!);
                                                if (newValue!) {
                                                  final usersUpdateData =
                                                      createUsersRecordData(
                                                    notiffMsgs: true,
                                                  );
                                                  await columnUsersRecord
                                                      .reference
                                                      .update(usersUpdateData);
                                                } else {
                                                  final usersUpdateData =
                                                      createUsersRecordData(
                                                    notiffMsgs: false,
                                                  );
                                                  await columnUsersRecord
                                                      .reference
                                                      .update(usersUpdateData);
                                                }
                                              },
                                              activeColor: Color(0xFF27AE60),
                                              activeTrackColor:
                                                  Color(0xFFA0E0BC),
                                              dense: false,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
