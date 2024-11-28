import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list_widget_widget.dart';
import '/components/notification_message_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_view_model.dart';
export 'notifications_view_model.dart';

class NotificationsViewWidget extends StatefulWidget {
  const NotificationsViewWidget({Key? key}) : super(key: key);

  @override
  _NotificationsViewWidgetState createState() =>
      _NotificationsViewWidgetState();
}

class _NotificationsViewWidgetState extends State<NotificationsViewWidget> {
  late NotificationsViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsViewModel());
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
          leading: Visibility(
            visible: false,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.chevron_left,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
          ),
          title: Text(
            'Notifications',
            style: FlutterFlowTheme.of(context).titleSmall,
          ),
          actions: [
            FFButtonWidget(
              onPressed: () async {
                final usersUpdateData = createUsersRecordData(
                  notiffReadTS: getCurrentTimestamp,
                );
                await currentUserReference!.update(usersUpdateData);
              },
              text: 'Mark as read',
              options: FFButtonOptions(
                width: 130.0,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: StreamBuilder<List<NotificationsRecord>>(
            stream: queryNotificationsRecord(
              queryBuilder: (notificationsRecord) => notificationsRecord
                  .where('receiver', isEqualTo: currentUserReference),
              limit: 1,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                );
              }
              List<NotificationsRecord> containerNotificationsRecordList =
                  snapshot.data!;
              return Container(
                decoration: BoxDecoration(),
                child: StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(currentUserReference!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      );
                    }
                    final columnUsersRecord = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: StreamBuilder<List<NotificationsRecord>>(
                              stream: queryNotificationsRecord(
                                queryBuilder: (notificationsRecord) =>
                                    notificationsRecord
                                        .where('receiver',
                                            isEqualTo: currentUserReference)
                                        .where('timestamp',
                                            isGreaterThanOrEqualTo: functions
                                                .getToday(getCurrentTimestamp))
                                        .where('timestamp',
                                            isLessThan: functions.getTomorrow(
                                                getCurrentTimestamp))
                                        .orderBy('timestamp', descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                List<NotificationsRecord>
                                    contTodayNotificationsRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (contTodayNotificationsRecordList
                                              .length >
                                          0)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Container(
                                            width: 80.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 4.0, 0.0),
                                              child: SelectionArea(
                                                  child: AutoSizeText(
                                                'Today',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              )),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final todayMsgs =
                                                contTodayNotificationsRecordList
                                                    .toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: todayMsgs.length,
                                              itemBuilder:
                                                  (context, todayMsgsIndex) {
                                                final todayMsgsItem =
                                                    todayMsgs[todayMsgsIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child:
                                                        NotificationMessageComponentWidget(
                                                      key: Key(
                                                          'Keyokj_${todayMsgsIndex}_of_${todayMsgs.length}'),
                                                      notification:
                                                          todayMsgsItem,
                                                      noriffTS:
                                                          columnUsersRecord
                                                              .notiffReadTS,
                                                      isPremium: columnUsersRecord
                                                              .isPremium! ||
                                                          !getRemoteConfigBool(
                                                              'check_premium') ||
                                                          revenue_cat
                                                              .activeEntitlementIds
                                                              .contains(FFAppState()
                                                                  .entSeeNotiff),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Divider(),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: StreamBuilder<List<NotificationsRecord>>(
                              stream: queryNotificationsRecord(
                                queryBuilder: (notificationsRecord) =>
                                    notificationsRecord
                                        .where('receiver',
                                            isEqualTo: currentUserReference)
                                        .where('timestamp',
                                            isGreaterThanOrEqualTo:
                                                functions.getEarlierDate(
                                                    getCurrentTimestamp, 1))
                                        .where('timestamp',
                                            isLessThan: functions
                                                .getToday(getCurrentTimestamp))
                                        .orderBy('timestamp', descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                List<NotificationsRecord>
                                    contYesterdayNotificationsRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (contYesterdayNotificationsRecordList
                                              .length >
                                          0)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Container(
                                            width: 80.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 4.0, 0.0),
                                              child: SelectionArea(
                                                  child: AutoSizeText(
                                                'Yesterday',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              )),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final yesterdayMsgs =
                                                contYesterdayNotificationsRecordList
                                                    .toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: yesterdayMsgs.length,
                                              itemBuilder: (context,
                                                  yesterdayMsgsIndex) {
                                                final yesterdayMsgsItem =
                                                    yesterdayMsgs[
                                                        yesterdayMsgsIndex];
                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child:
                                                      NotificationMessageComponentWidget(
                                                    key: Key(
                                                        'Keyukw_${yesterdayMsgsIndex}_of_${yesterdayMsgs.length}'),
                                                    notification:
                                                        yesterdayMsgsItem,
                                                    noriffTS: columnUsersRecord
                                                        .notiffReadTS,
                                                    isPremium: columnUsersRecord
                                                            .isPremium! ||
                                                        !getRemoteConfigBool(
                                                            'check_premium') ||
                                                        revenue_cat
                                                            .activeEntitlementIds
                                                            .contains(FFAppState()
                                                                .entSeeNotiff),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: StreamBuilder<List<NotificationsRecord>>(
                              stream: queryNotificationsRecord(
                                queryBuilder: (notificationsRecord) =>
                                    notificationsRecord
                                        .where('receiver',
                                            isEqualTo: currentUserReference)
                                        .where('timestamp',
                                            isLessThan:
                                                functions.getEarlierDate(
                                                    getCurrentTimestamp, 1))
                                        .orderBy('timestamp', descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                List<NotificationsRecord>
                                    contEarlierNotificationsRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (contEarlierNotificationsRecordList
                                              .length >
                                          0)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Container(
                                            width: 80.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 4.0, 0.0),
                                              child: SelectionArea(
                                                  child: AutoSizeText(
                                                'Earlier',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
                                              )),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final earlierMsgs =
                                                contEarlierNotificationsRecordList
                                                    .toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: earlierMsgs.length,
                                              itemBuilder:
                                                  (context, earlierMsgsIndex) {
                                                final earlierMsgsItem =
                                                    earlierMsgs[
                                                        earlierMsgsIndex];
                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child:
                                                      NotificationMessageComponentWidget(
                                                    key: Key(
                                                        'Keyl9i_${earlierMsgsIndex}_of_${earlierMsgs.length}'),
                                                    notification:
                                                        earlierMsgsItem,
                                                    noriffTS: columnUsersRecord
                                                        .notiffReadTS,
                                                    isPremium: columnUsersRecord
                                                            .isPremium! ||
                                                        !getRemoteConfigBool(
                                                            'check_premium') ||
                                                        revenue_cat
                                                            .activeEntitlementIds
                                                            .contains(FFAppState()
                                                                .entSeeNotiff),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          if (containerNotificationsRecordList.length == 0)
                            Container(
                              decoration: BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.emptyListWidgetModel,
                                updateCallback: () => setState(() {}),
                                child: EmptyListWidgetWidget(),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
