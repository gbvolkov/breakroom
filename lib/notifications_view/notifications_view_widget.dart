import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_list_widget_widget.dart';
import '../components/notification_message_component_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsViewWidget extends StatefulWidget {
  const NotificationsViewWidget({Key? key}) : super(key: key);

  @override
  _NotificationsViewWidgetState createState() =>
      _NotificationsViewWidgetState();
}

class _NotificationsViewWidgetState extends State<NotificationsViewWidget> {
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
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Notifications',
          style: FlutterFlowTheme.of(context).subtitle2,
        ),
        actions: [
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Mark as read',
            options: FFButtonOptions(
              width: 130,
              height: 40,
              color: FlutterFlowTheme.of(context).primaryColor,
              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
              elevation: 0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
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
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
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
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
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
                                                  0, 0, 0, 16),
                                          child: Container(
                                            width: 80,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 4, 0),
                                              child: SelectionArea(
                                                  child: AutoSizeText(
                                                'Today',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                              )),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
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
                                                      .fromSTEB(0, 0, 0, 8),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child:
                                                        NotificationMessageComponentWidget(
                                                      notification:
                                                          todayMsgsItem,
                                                      noriffTS:
                                                          columnUsersRecord
                                                              .notiffReadTS,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
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
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
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
                                                  0, 0, 0, 16),
                                          child: Container(
                                            width: 80,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 4, 0),
                                              child: SelectionArea(
                                                  child: AutoSizeText(
                                                'Yesterday',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                              )),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
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
                                                    notification:
                                                        yesterdayMsgsItem,
                                                    noriffTS: columnUsersRecord
                                                        .notiffReadTS,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
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
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
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
                                                  0, 0, 0, 16),
                                          child: Container(
                                            width: 80,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 4, 0),
                                              child: SelectionArea(
                                                  child: AutoSizeText(
                                                'Earlier',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                              )),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
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
                                                    notification:
                                                        earlierMsgsItem,
                                                    noriffTS: columnUsersRecord
                                                        .notiffReadTS,
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
                              child: EmptyListWidgetWidget(),
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
