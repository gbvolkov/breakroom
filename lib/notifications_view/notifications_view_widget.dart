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
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NotificationsViewWidget extends StatefulWidget {
  const NotificationsViewWidget({Key? key}) : super(key: key);

  @override
  _NotificationsViewWidgetState createState() =>
      _NotificationsViewWidgetState();
}

class _NotificationsViewWidgetState extends State<NotificationsViewWidget> {
  PagingController<DocumentSnapshot?, NotificationsRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

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
                Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: SelectionArea(
                      child: AutoSizeText(
                    'Today',
                    style: FlutterFlowTheme.of(context).bodyText2,
                  )),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: PagedListView<DocumentSnapshot<Object?>?,
                      NotificationsRecord>(
                    pagingController: () {
                      final Query<Object?> Function(Query<Object?>)
                          queryBuilder =
                          (notificationsRecord) => notificationsRecord
                              .where('receiver',
                                  isEqualTo: currentUserReference)
                              .where('timestamp',
                                  isGreaterThanOrEqualTo:
                                      functions.getToday(getCurrentTimestamp))
                              .where('timestamp',
                                  isLessThan: functions
                                      .getTomorrow(getCurrentTimestamp))
                              .orderBy('timestamp', descending: true);
                      if (_pagingController != null) {
                        final query =
                            queryBuilder(NotificationsRecord.collection);
                        if (query != _pagingQuery) {
                          // The query has changed
                          _pagingQuery = query;
                          _streamSubscriptions.forEach((s) => s?.cancel());
                          _streamSubscriptions.clear();
                          _pagingController!.refresh();
                        }
                        return _pagingController!;
                      }

                      _pagingController = PagingController(firstPageKey: null);
                      _pagingQuery =
                          queryBuilder(NotificationsRecord.collection);
                      _pagingController!
                          .addPageRequestListener((nextPageMarker) {
                        queryNotificationsRecordPage(
                          queryBuilder:
                              (notificationsRecord) =>
                                  notificationsRecord
                                      .where('receiver',
                                          isEqualTo: currentUserReference)
                                      .where('timestamp',
                                          isGreaterThanOrEqualTo: functions
                                              .getToday(getCurrentTimestamp))
                                      .where('timestamp',
                                          isLessThan: functions
                                              .getTomorrow(getCurrentTimestamp))
                                      .orderBy('timestamp', descending: true),
                          nextPageMarker: nextPageMarker,
                          pageSize: 25,
                          isStream: true,
                        ).then((page) {
                          _pagingController!.appendPage(
                            page.data,
                            page.nextPageMarker,
                          );
                          final streamSubscription =
                              page.dataStream?.listen((data) {
                            final itemIndexes = _pagingController!.itemList!
                                .asMap()
                                .map((k, v) => MapEntry(v.reference.id, k));
                            data.forEach((item) {
                              final index = itemIndexes[item.reference.id];
                              final items = _pagingController!.itemList!;
                              if (index != null) {
                                items.replaceRange(index, index + 1, [item]);
                                _pagingController!.itemList = {
                                  for (var item in items) item.reference: item
                                }.values.toList();
                              }
                            });
                            setState(() {});
                          });
                          _streamSubscriptions.add(streamSubscription);
                        });
                      });
                      return _pagingController!;
                    }(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    builderDelegate:
                        PagedChildBuilderDelegate<NotificationsRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      noItemsFoundIndicatorBuilder: (_) => Center(
                        child: EmptyListWidgetWidget(),
                      ),
                      itemBuilder: (context, _, listViewIndex) {
                        final listViewNotificationsRecord =
                            _pagingController!.itemList![listViewIndex];
                        return Container(
                          decoration: BoxDecoration(),
                          child: NotificationMessageComponentWidget(
                            notification: listViewNotificationsRecord,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                      child: SelectionArea(
                          child: AutoSizeText(
                        'Yesterday',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      )),
                    ),
                  ),
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
                    List<NotificationsRecord> listViewNotificationsRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewNotificationsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewNotificationsRecord =
                            listViewNotificationsRecordList[listViewIndex];
                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: NotificationMessageComponentWidget(
                            notification: listViewNotificationsRecord,
                          ),
                        );
                      },
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                      child: SelectionArea(
                          child: AutoSizeText(
                        'Older',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      )),
                    ),
                  ),
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
                    List<NotificationsRecord> listViewNotificationsRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewNotificationsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewNotificationsRecord =
                            listViewNotificationsRecordList[listViewIndex];
                        return Container(
                          decoration: BoxDecoration(),
                          child: NotificationMessageComponentWidget(
                            notification: listViewNotificationsRecord,
                          ),
                        );
                      },
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
