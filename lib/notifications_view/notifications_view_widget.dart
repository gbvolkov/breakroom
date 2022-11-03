import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        title: Text(
          'Notifications',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              PagedListView<DocumentSnapshot<Object?>?, NotificationsRecord>(
                pagingController: () {
                  final Query<Object?> Function(Query<Object?>) queryBuilder =
                      (notificationsRecord) => notificationsRecord
                          .where('receiver', isEqualTo: currentUserReference)
                          .orderBy('timestamp', descending: true);
                  if (_pagingController != null) {
                    final query = queryBuilder(NotificationsRecord.collection);
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
                  _pagingQuery = queryBuilder(NotificationsRecord.collection);
                  _pagingController!.addPageRequestListener((nextPageMarker) {
                    queryNotificationsRecordPage(
                      queryBuilder: (notificationsRecord) => notificationsRecord
                          .where('receiver', isEqualTo: currentUserReference)
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
                builderDelegate: PagedChildBuilderDelegate<NotificationsRecord>(
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

                  itemBuilder: (context, _, listViewIndex) {
                    final listViewNotificationsRecord =
                        _pagingController!.itemList![listViewIndex];
                    return StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(
                          listViewNotificationsRecord.referredUser!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final columnUsersRecord = snapshot.data!;
                        return InkWell(
                          onTap: () async {
                            final notificationsUpdateData =
                                createNotificationsRecordData(
                              isRead: true,
                            );
                            await listViewNotificationsRecord.reference
                                .update(notificationsUpdateData);
                            if (listViewNotificationsRecord.type == 'match') {
                              context.pushNamed(
                                'HomeDetailsView',
                                queryParams: {
                                  'userProfile': serializeParam(
                                    columnUsersRecord,
                                    ParamType.Document,
                                  ),
                                  'mode': serializeParam(
                                    listViewNotificationsRecord.type,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'userProfile': columnUsersRecord,
                                },
                              );
                            } else {
                              if (listViewNotificationsRecord.type == 'like') {
                                context.pushNamed(
                                  'HomeDetailsView',
                                  queryParams: {
                                    'userProfile': serializeParam(
                                      columnUsersRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'userProfile': columnUsersRecord,
                                  },
                                );
                              }
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (!listViewNotificationsRecord.isRead!)
                                InkWell(
                                  onTap: () async {
                                    final notificationsUpdateData =
                                        createNotificationsRecordData(
                                      isRead: true,
                                    );
                                    await listViewNotificationsRecord.reference
                                        .update(notificationsUpdateData);
                                    if (listViewNotificationsRecord.type ==
                                        'match') {
                                      context.pushNamed(
                                        'HomeDetailsView',
                                        queryParams: {
                                          'userProfile': serializeParam(
                                            columnUsersRecord,
                                            ParamType.Document,
                                          ),
                                          'mode': serializeParam(
                                            listViewNotificationsRecord.type,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'userProfile': columnUsersRecord,
                                        },
                                      );
                                    } else {
                                      if (listViewNotificationsRecord.type ==
                                          'like') {
                                        context.pushNamed(
                                          'HomeDetailsView',
                                          queryParams: {
                                            'userProfile': serializeParam(
                                              columnUsersRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'userProfile': columnUsersRecord,
                                          },
                                        );
                                      }
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: SelectionArea(
                                            child: Text(
                                          dateTimeFormat(
                                              'M/d h:mm a',
                                              listViewNotificationsRecord
                                                  .timestamp!),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 12,
                                              ),
                                        )),
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: InkWell(
                                          onTap: () async {
                                            final notificationsUpdateData =
                                                createNotificationsRecordData(
                                              isRead: true,
                                            );
                                            await listViewNotificationsRecord
                                                .reference
                                                .update(
                                                    notificationsUpdateData);
                                            if (listViewNotificationsRecord
                                                    .type ==
                                                'match') {
                                              context.pushNamed(
                                                'HomeDetailsView',
                                                queryParams: {
                                                  'userProfile': serializeParam(
                                                    columnUsersRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'mode': serializeParam(
                                                    listViewNotificationsRecord
                                                        .type,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'userProfile':
                                                      columnUsersRecord,
                                                },
                                              );
                                            } else {
                                              if (listViewNotificationsRecord
                                                      .type ==
                                                  'like') {
                                                context.pushNamed(
                                                  'HomeDetailsView',
                                                  queryParams: {
                                                    'userProfile':
                                                        serializeParam(
                                                      columnUsersRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'userProfile':
                                                        columnUsersRecord,
                                                  },
                                                );
                                              }
                                            }
                                          },
                                          child: SelectionArea(
                                              child: Text(
                                            listViewNotificationsRecord.content!
                                                .maybeHandleOverflow(
                                              maxChars: 32,
                                              replacement: '…',
                                            ),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2,
                                          )),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderWidth: 1,
                                          buttonSize: 48,
                                          icon: Icon(
                                            Icons.assignment_ind,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            size: 24,
                                          ),
                                          onPressed: () async {
                                            final notificationsUpdateData =
                                                createNotificationsRecordData(
                                              isRead: true,
                                            );
                                            await listViewNotificationsRecord
                                                .reference
                                                .update(
                                                    notificationsUpdateData);
                                            if (listViewNotificationsRecord
                                                    .type ==
                                                'match') {
                                              context.pushNamed(
                                                'HomeDetailsView',
                                                queryParams: {
                                                  'userProfile': serializeParam(
                                                    columnUsersRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'mode': serializeParam(
                                                    listViewNotificationsRecord
                                                        .type,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'userProfile':
                                                      columnUsersRecord,
                                                },
                                              );
                                            } else {
                                              if (listViewNotificationsRecord
                                                      .type ==
                                                  'like') {
                                                context.pushNamed(
                                                  'HomeDetailsView',
                                                  queryParams: {
                                                    'userProfile':
                                                        serializeParam(
                                                      columnUsersRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'userProfile':
                                                        columnUsersRecord,
                                                  },
                                                );
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (listViewNotificationsRecord.isRead ?? true)
                                InkWell(
                                  onTap: () async {
                                    final notificationsUpdateData =
                                        createNotificationsRecordData(
                                      isRead: true,
                                    );
                                    await listViewNotificationsRecord.reference
                                        .update(notificationsUpdateData);
                                    if (listViewNotificationsRecord.type ==
                                        'match') {
                                      context.pushNamed(
                                        'HomeDetailsView',
                                        queryParams: {
                                          'userProfile': serializeParam(
                                            columnUsersRecord,
                                            ParamType.Document,
                                          ),
                                          'mode': serializeParam(
                                            listViewNotificationsRecord.type,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'userProfile': columnUsersRecord,
                                        },
                                      );
                                    } else {
                                      if (listViewNotificationsRecord.type ==
                                          'like') {
                                        context.pushNamed(
                                          'HomeDetailsView',
                                          queryParams: {
                                            'userProfile': serializeParam(
                                              columnUsersRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'userProfile': columnUsersRecord,
                                          },
                                        );
                                      }
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: SelectionArea(
                                            child: Text(
                                          dateTimeFormat(
                                              'M/d h:mm a',
                                              listViewNotificationsRecord
                                                  .timestamp!),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                        )),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: InkWell(
                                          onTap: () async {
                                            final notificationsUpdateData =
                                                createNotificationsRecordData(
                                              isRead: true,
                                            );
                                            await listViewNotificationsRecord
                                                .reference
                                                .update(
                                                    notificationsUpdateData);
                                            if (listViewNotificationsRecord
                                                    .type ==
                                                'match') {
                                              context.pushNamed(
                                                'HomeDetailsView',
                                                queryParams: {
                                                  'userProfile': serializeParam(
                                                    columnUsersRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'mode': serializeParam(
                                                    listViewNotificationsRecord
                                                        .type,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'userProfile':
                                                      columnUsersRecord,
                                                },
                                              );
                                            } else {
                                              if (listViewNotificationsRecord
                                                      .type ==
                                                  'like') {
                                                context.pushNamed(
                                                  'HomeDetailsView',
                                                  queryParams: {
                                                    'userProfile':
                                                        serializeParam(
                                                      columnUsersRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'userProfile':
                                                        columnUsersRecord,
                                                  },
                                                );
                                              }
                                            }
                                          },
                                          child: SelectionArea(
                                              child: Text(
                                            listViewNotificationsRecord.content!
                                                .maybeHandleOverflow(
                                              maxChars: 32,
                                              replacement: '…',
                                            ),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                          )),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 48,
                                          icon: Icon(
                                            Icons.assignment_ind,
                                            color: Color(0xA5F95A82),
                                            size: 24,
                                          ),
                                          onPressed: () async {
                                            final notificationsUpdateData =
                                                createNotificationsRecordData(
                                              isRead: true,
                                            );
                                            await listViewNotificationsRecord
                                                .reference
                                                .update(
                                                    notificationsUpdateData);
                                            if (listViewNotificationsRecord
                                                    .type ==
                                                'match') {
                                              context.pushNamed(
                                                'HomeDetailsView',
                                                queryParams: {
                                                  'userProfile': serializeParam(
                                                    columnUsersRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'mode': serializeParam(
                                                    listViewNotificationsRecord
                                                        .type,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'userProfile':
                                                      columnUsersRecord,
                                                },
                                              );
                                            } else {
                                              if (listViewNotificationsRecord
                                                      .type ==
                                                  'like') {
                                                context.pushNamed(
                                                  'HomeDetailsView',
                                                  queryParams: {
                                                    'userProfile':
                                                        serializeParam(
                                                      columnUsersRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'userProfile':
                                                        columnUsersRecord,
                                                  },
                                                );
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                    ],
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
            ],
          ),
        ),
      ),
    );
  }
}
