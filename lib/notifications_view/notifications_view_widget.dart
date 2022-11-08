import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_list_widget_widget.dart';
import '../components/notification_message_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
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
        title: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'Notifications',
            style: FlutterFlowTheme.of(context).title1.override(
                  fontFamily: 'Roboto',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<List<NotificationsRecord>>(
                  stream: queryNotificationsRecord(
                    queryBuilder: (notificationsRecord) => notificationsRecord
                        .where('receiver', isEqualTo: currentUserReference)
                        .where('timestamp',
                            isGreaterThanOrEqualTo:
                                functions.getToday(getCurrentTimestamp))
                        .where('timestamp',
                            isLessThan:
                                functions.getTomorrow(getCurrentTimestamp))
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
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<NotificationsRecord> contTodayNotificationsRecordList =
                        snapshot.data!;
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (contTodayNotificationsRecordList.length > 0)
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                                child: SelectionArea(
                                    child: AutoSizeText(
                                  'Today',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                )),
                              ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Builder(
                              builder: (context) {
                                final todayMsgs =
                                    contTodayNotificationsRecordList.toList();
                                if (todayMsgs.isEmpty) {
                                  return Center(
                                    child: EmptyListWidgetWidget(),
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: todayMsgs.length,
                                  itemBuilder: (context, todayMsgsIndex) {
                                    final todayMsgsItem =
                                        todayMsgs[todayMsgsIndex];
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: NotificationMessageComponentWidget(
                                        notification: todayMsgsItem,
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
                StreamBuilder<List<NotificationsRecord>>(
                  stream: queryNotificationsRecord(
                    queryBuilder: (notificationsRecord) => notificationsRecord
                        .where('receiver', isEqualTo: currentUserReference)
                        .where('timestamp',
                            isGreaterThanOrEqualTo: functions.getEarlierDate(
                                getCurrentTimestamp, 1))
                        .where('timestamp',
                            isLessThan: functions.getToday(getCurrentTimestamp))
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
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<NotificationsRecord>
                        contYesterdayNotificationsRecordList = snapshot.data!;
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (contYesterdayNotificationsRecordList.length > 0)
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                                child: SelectionArea(
                                    child: AutoSizeText(
                                  'Yesterday',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                )),
                              ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Builder(
                              builder: (context) {
                                final yesterdayMsgs =
                                    contYesterdayNotificationsRecordList
                                        .toList();
                                if (yesterdayMsgs.isEmpty) {
                                  return Center(
                                    child: EmptyListWidgetWidget(),
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: yesterdayMsgs.length,
                                  itemBuilder: (context, yesterdayMsgsIndex) {
                                    final yesterdayMsgsItem =
                                        yesterdayMsgs[yesterdayMsgsIndex];
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: NotificationMessageComponentWidget(
                                        notification: yesterdayMsgsItem,
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
                StreamBuilder<List<NotificationsRecord>>(
                  stream: queryNotificationsRecord(
                    queryBuilder: (notificationsRecord) => notificationsRecord
                        .where('receiver', isEqualTo: currentUserReference)
                        .where('timestamp',
                            isLessThan: functions.getEarlierDate(
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
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<NotificationsRecord>
                        contEarlierNotificationsRecordList = snapshot.data!;
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (contEarlierNotificationsRecordList.length > 0)
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                                child: SelectionArea(
                                    child: AutoSizeText(
                                  'Earlier',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                )),
                              ),
                            ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Builder(
                              builder: (context) {
                                final earlierMsgs =
                                    contEarlierNotificationsRecordList.toList();
                                if (earlierMsgs.isEmpty) {
                                  return Center(
                                    child: EmptyListWidgetWidget(),
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: earlierMsgs.length,
                                  itemBuilder: (context, earlierMsgsIndex) {
                                    final earlierMsgsItem =
                                        earlierMsgs[earlierMsgsIndex];
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: NotificationMessageComponentWidget(
                                        notification: earlierMsgsItem,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
