import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_list_widget_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                PagedListView<DocumentSnapshot<Object?>?, NotificationsRecord>(
                  pagingController: () {
                    final Query<Object?> Function(Query<Object?>) queryBuilder =
                        (notificationsRecord) => notificationsRecord
                            .where('receiver', isEqualTo: currentUserReference)
                            .where('timestamp',
                                isGreaterThanOrEqualTo:
                                    functions.getToday(getCurrentTimestamp))
                            .where('timestamp',
                                isLessThan:
                                    functions.getTomorrow(getCurrentTimestamp))
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
                    _pagingQuery = queryBuilder(NotificationsRecord.collection);
                    _pagingController!.addPageRequestListener((nextPageMarker) {
                      queryNotificationsRecordPage(
                        queryBuilder: (notificationsRecord) =>
                            notificationsRecord
                                .where('receiver',
                                    isEqualTo: currentUserReference)
                                .where('timestamp',
                                    isGreaterThanOrEqualTo:
                                        functions.getToday(getCurrentTimestamp))
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
                                      await listViewNotificationsRecord
                                          .reference
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
                                        if (listViewNotificationsRecord.type ==
                                            'like')
                                          Expanded(
                                            flex: 2,
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderWidth: 1,
                                              buttonSize: 48,
                                              icon: Icon(
                                                Icons.favorite,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                      'userProfile':
                                                          serializeParam(
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
                                        if (listViewNotificationsRecord.type ==
                                            'match')
                                          Expanded(
                                            flex: 2,
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 48,
                                              icon: FaIcon(
                                                FontAwesomeIcons
                                                    .handHoldingHeart,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                      'userProfile':
                                                          serializeParam(
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
                                        if ((listViewNotificationsRecord.type !=
                                                'like') &&
                                            (listViewNotificationsRecord.type !=
                                                'match'))
                                          Expanded(
                                            flex: 2,
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 48,
                                              icon: Icon(
                                                FFIcons.kicChat,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                      'userProfile':
                                                          serializeParam(
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
                                        Expanded(
                                          flex: 14,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
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
                                                          'userProfile':
                                                              serializeParam(
                                                            columnUsersRecord,
                                                            ParamType.Document,
                                                          ),
                                                          'mode':
                                                              serializeParam(
                                                            listViewNotificationsRecord
                                                                .type,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
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
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'userProfile':
                                                                columnUsersRecord,
                                                          },
                                                        );
                                                      }
                                                    }
                                                  },
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      () {
                                                        if (listViewNotificationsRecord
                                                                .type ==
                                                            'like') {
                                                          return 'Wow, people seem to like you';
                                                        } else if (listViewNotificationsRecord
                                                                .type ==
                                                            'match') {
                                                          return 'It\'s a match';
                                                        } else {
                                                          return listViewNotificationsRecord
                                                              .content;
                                                        }
                                                      }(),
                                                      'Message',
                                                    ).maybeHandleOverflow(
                                                      maxChars: 32,
                                                      replacement: '…',
                                                    ),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 0, 8, 0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          columnUsersRecord
                                                              .photoUrl,
                                                          'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                                        ),
                                                        width: 24,
                                                        height: 24,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  SelectionArea(
                                                      child: Text(
                                                    columnUsersRecord
                                                        .displayName!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 12,
                                                        ),
                                                  )),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 0, 0, 0),
                                                    child: SelectionArea(
                                                        child: Text(
                                                      valueOrDefault<String>(
                                                        () {
                                                          if (listViewNotificationsRecord
                                                                  .type ==
                                                              'like') {
                                                            return 'liked you';
                                                          } else if (listViewNotificationsRecord
                                                                  .type ==
                                                              'match') {
                                                            return 'liked you back';
                                                          } else {
                                                            return 'sent you a message';
                                                          }
                                                        }(),
                                                        'sent you a message',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize: 12,
                                                              ),
                                                    )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 8, 0),
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
                                                      'userProfile':
                                                          serializeParam(
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
                                              child: Text(
                                                dateTimeFormat(
                                                    'jm',
                                                    listViewNotificationsRecord
                                                        .timestamp!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 10,
                                                        ),
                                              ),
                                            ),
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
                                      await listViewNotificationsRecord
                                          .reference
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
                                        if (listViewNotificationsRecord.type ==
                                            'like')
                                          Expanded(
                                            flex: 2,
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 48,
                                              icon: Icon(
                                                Icons.favorite,
                                                color: Color(0x99F95A82),
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
                                                      'userProfile':
                                                          serializeParam(
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
                                        if (listViewNotificationsRecord.type ==
                                            'match')
                                          Expanded(
                                            flex: 2,
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 48,
                                              icon: FaIcon(
                                                FontAwesomeIcons
                                                    .handHoldingHeart,
                                                color: Color(0x9AF95A82),
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
                                                      'userProfile':
                                                          serializeParam(
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
                                        if ((listViewNotificationsRecord.type !=
                                                'like') &&
                                            (listViewNotificationsRecord.type !=
                                                'match'))
                                          Expanded(
                                            flex: 2,
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 48,
                                              icon: Icon(
                                                FFIcons.kicChat,
                                                color: Color(0x98F95A82),
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
                                                      'userProfile':
                                                          serializeParam(
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
                                        Expanded(
                                          flex: 14,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
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
                                                          'userProfile':
                                                              serializeParam(
                                                            columnUsersRecord,
                                                            ParamType.Document,
                                                          ),
                                                          'mode':
                                                              serializeParam(
                                                            listViewNotificationsRecord
                                                                .type,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
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
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'userProfile':
                                                                columnUsersRecord,
                                                          },
                                                        );
                                                      }
                                                    }
                                                  },
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      () {
                                                        if (listViewNotificationsRecord
                                                                .type ==
                                                            'like') {
                                                          return 'Wow, people seem to like you';
                                                        } else if (listViewNotificationsRecord
                                                                .type ==
                                                            'match') {
                                                          return 'It\'s a match';
                                                        } else {
                                                          return listViewNotificationsRecord
                                                              .content;
                                                        }
                                                      }(),
                                                      'Message',
                                                    ).maybeHandleOverflow(
                                                      maxChars: 32,
                                                      replacement: '…',
                                                    ),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 0, 8, 0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          columnUsersRecord
                                                              .photoUrl,
                                                          'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                                        ),
                                                        width: 24,
                                                        height: 24,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  SelectionArea(
                                                      child: Text(
                                                    columnUsersRecord
                                                        .displayName!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0x99F95A82),
                                                          fontSize: 12,
                                                        ),
                                                  )),
                                                  SelectionArea(
                                                      child: Text(
                                                    valueOrDefault<String>(
                                                      () {
                                                        if (listViewNotificationsRecord
                                                                .type ==
                                                            'like') {
                                                          return 'liked you';
                                                        } else if (listViewNotificationsRecord
                                                                .type ==
                                                            'match') {
                                                          return 'liked you back';
                                                        } else {
                                                          return 'sent you a message';
                                                        }
                                                      }(),
                                                      'sent you a message',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12,
                                                        ),
                                                  )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 8, 0),
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
                                                      'userProfile':
                                                          serializeParam(
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
                                              child: Text(
                                                dateTimeFormat(
                                                    'jm',
                                                    listViewNotificationsRecord
                                                        .timestamp!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12,
                                                        ),
                                              ),
                                            ),
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
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewNotificationsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewNotificationsRecord =
                            listViewNotificationsRecordList[listViewIndex];
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
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
                                        await listViewNotificationsRecord
                                            .reference
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
                                                listViewNotificationsRecord
                                                    .type,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'userProfile': columnUsersRecord,
                                            },
                                          );
                                        } else {
                                          if (listViewNotificationsRecord
                                                  .type ==
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
                                                'userProfile':
                                                    columnUsersRecord,
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
                                                      'userProfile':
                                                          serializeParam(
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
                                              child: Text(
                                                dateTimeFormat(
                                                    'M/d h:mm a',
                                                    listViewNotificationsRecord
                                                        .timestamp!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 12,
                                                        ),
                                              ),
                                            ),
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
                                                      'userProfile':
                                                          serializeParam(
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
                                              child: Text(
                                                listViewNotificationsRecord
                                                    .content!
                                                    .maybeHandleOverflow(
                                                  maxChars: 32,
                                                  replacement: '…',
                                                ),
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                              ),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                      'userProfile':
                                                          serializeParam(
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
                                  if (listViewNotificationsRecord.isRead ??
                                      true)
                                    InkWell(
                                      onTap: () async {
                                        final notificationsUpdateData =
                                            createNotificationsRecordData(
                                          isRead: true,
                                        );
                                        await listViewNotificationsRecord
                                            .reference
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
                                                listViewNotificationsRecord
                                                    .type,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'userProfile': columnUsersRecord,
                                            },
                                          );
                                        } else {
                                          if (listViewNotificationsRecord
                                                  .type ==
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
                                                'userProfile':
                                                    columnUsersRecord,
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
                                                      'userProfile':
                                                          serializeParam(
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
                                              child: Text(
                                                dateTimeFormat(
                                                    'M/d h:mm a',
                                                    listViewNotificationsRecord
                                                        .timestamp!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12,
                                                        ),
                                              ),
                                            ),
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
                                                      'userProfile':
                                                          serializeParam(
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
                                              child: Text(
                                                listViewNotificationsRecord
                                                    .content!
                                                    .maybeHandleOverflow(
                                                  maxChars: 32,
                                                  replacement: '…',
                                                ),
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                              ),
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
                                                      'userProfile':
                                                          serializeParam(
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
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewNotificationsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewNotificationsRecord =
                            listViewNotificationsRecordList[listViewIndex];
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
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
                                        await listViewNotificationsRecord
                                            .reference
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
                                                listViewNotificationsRecord
                                                    .type,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'userProfile': columnUsersRecord,
                                            },
                                          );
                                        } else {
                                          if (listViewNotificationsRecord
                                                  .type ==
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
                                                'userProfile':
                                                    columnUsersRecord,
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
                                                      'userProfile':
                                                          serializeParam(
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
                                              child: Text(
                                                dateTimeFormat(
                                                    'M/d h:mm a',
                                                    listViewNotificationsRecord
                                                        .timestamp!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 12,
                                                        ),
                                              ),
                                            ),
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
                                                      'userProfile':
                                                          serializeParam(
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
                                              child: Text(
                                                listViewNotificationsRecord
                                                    .content!
                                                    .maybeHandleOverflow(
                                                  maxChars: 32,
                                                  replacement: '…',
                                                ),
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                              ),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                      'userProfile':
                                                          serializeParam(
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
                                  if (listViewNotificationsRecord.isRead ??
                                      true)
                                    InkWell(
                                      onTap: () async {
                                        final notificationsUpdateData =
                                            createNotificationsRecordData(
                                          isRead: true,
                                        );
                                        await listViewNotificationsRecord
                                            .reference
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
                                                listViewNotificationsRecord
                                                    .type,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'userProfile': columnUsersRecord,
                                            },
                                          );
                                        } else {
                                          if (listViewNotificationsRecord
                                                  .type ==
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
                                                'userProfile':
                                                    columnUsersRecord,
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
                                                      'userProfile':
                                                          serializeParam(
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
                                              child: Text(
                                                dateTimeFormat(
                                                    'M/d h:mm a',
                                                    listViewNotificationsRecord
                                                        .timestamp!),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12,
                                                        ),
                                              ),
                                            ),
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
                                                      'userProfile':
                                                          serializeParam(
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
                                              child: Text(
                                                listViewNotificationsRecord
                                                    .content!
                                                    .maybeHandleOverflow(
                                                  maxChars: 32,
                                                  replacement: '…',
                                                ),
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                              ),
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
                                                      'userProfile':
                                                          serializeParam(
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
