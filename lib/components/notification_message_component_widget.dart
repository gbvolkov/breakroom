import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationMessageComponentWidget extends StatefulWidget {
  const NotificationMessageComponentWidget({
    Key? key,
    this.notification,
    this.noriffTS,
  }) : super(key: key);

  final NotificationsRecord? notification;
  final DateTime? noriffTS;

  @override
  _NotificationMessageComponentWidgetState createState() =>
      _NotificationMessageComponentWidgetState();
}

class _NotificationMessageComponentWidgetState
    extends State<NotificationMessageComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.notification!.referredUser!),
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
        return InkWell(
          onTap: () async {
            final notificationsUpdateData = createNotificationsRecordData(
              isRead: true,
            );
            await widget.notification!.reference
                .update(notificationsUpdateData);
            if (widget.notification!.type == 'match') {
              context.pushNamed(
                'HomeDetailsView',
                queryParams: {
                  'userProfile': serializeParam(
                    columnUsersRecord,
                    ParamType.Document,
                  ),
                  'mode': serializeParam(
                    widget.notification!.type,
                    ParamType.String,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'userProfile': columnUsersRecord,
                },
              );
            } else {
              if (widget.notification!.type == 'like') {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!widget.notification!.isRead!)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (widget.notification!.type == 'like')
                        Container(
                          width: 48,
                          height: 48,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/notification-like.png',
                          ),
                        ),
                      if (widget.notification!.type == 'match')
                        Container(
                          width: 48,
                          height: 48,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/notification-match.png',
                          ),
                        ),
                      if ((widget.notification!.type != 'like') &&
                          (widget.notification!.type != 'match'))
                        Container(
                          width: 48,
                          height: 48,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/notification-message.png',
                          ),
                        ),
                      Expanded(
                        flex: 14,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                valueOrDefault<String>(
                                  () {
                                    if (widget.notification!.type == 'like') {
                                      return 'Wow, people seem to like you';
                                    } else if (widget.notification!.type ==
                                        'match') {
                                      return 'It\'s a match';
                                    } else {
                                      return widget.notification!.content;
                                    }
                                  }(),
                                  'Message',
                                ).maybeHandleOverflow(
                                  maxChars: 32,
                                  replacement: '…',
                                ),
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(90),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        columnUsersRecord.photoUrl,
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
                                  columnUsersRecord.displayName!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 12,
                                      ),
                                )),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: SelectionArea(
                                      child: Text(
                                    valueOrDefault<String>(
                                      () {
                                        if (widget.notification!.type ==
                                            'like') {
                                          return 'liked you';
                                        } else if (widget.notification!.type ==
                                            'match') {
                                          return 'liked you back';
                                        } else {
                                          return 'sent you a message';
                                        }
                                      }(),
                                      'sent you a message',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
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
                        flex: 8,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: !widget.notification!.isRead! &&
                                      (widget.noriffTS == null
                                          ? true
                                          : (widget.notification!.timestamp! >=
                                              widget.noriffTS!)),
                                  child: Icon(
                                    Icons.brightness_1,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 8,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Text(
                                functions.formatDateTime(
                                    widget.notification!.timestamp!),
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 10,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              if (widget.notification!.isRead ?? true)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (widget.notification!.type == 'like')
                        Container(
                          width: 48,
                          height: 48,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/notification-like.png',
                          ),
                        ),
                      if (widget.notification!.type == 'match')
                        Container(
                          width: 48,
                          height: 48,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/notification-match.png',
                          ),
                        ),
                      if ((widget.notification!.type != 'like') &&
                          (widget.notification!.type != 'match'))
                        Container(
                          width: 48,
                          height: 48,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/notification-message.png',
                          ),
                        ),
                      Expanded(
                        flex: 14,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                valueOrDefault<String>(
                                  () {
                                    if (widget.notification!.type == 'like') {
                                      return 'Wow, people seem to like you';
                                    } else if (widget.notification!.type ==
                                        'match') {
                                      return 'It\'s a match';
                                    } else {
                                      return widget.notification!.content;
                                    }
                                  }(),
                                  'Message',
                                ).maybeHandleOverflow(
                                  maxChars: 32,
                                  replacement: '…',
                                ),
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xA5050A41),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(90),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        columnUsersRecord.photoUrl,
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
                                  columnUsersRecord.displayName!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xA5F95A82),
                                        fontSize: 12,
                                      ),
                                )),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: SelectionArea(
                                      child: Text(
                                    valueOrDefault<String>(
                                      () {
                                        if (widget.notification!.type ==
                                            'like') {
                                          return 'liked you';
                                        } else if (widget.notification!.type ==
                                            'match') {
                                          return 'liked you back';
                                        } else {
                                          return 'sent you a message';
                                        }
                                      }(),
                                      'sent you a message',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Color(0xA5000000),
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
                        flex: 8,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: !widget.notification!.isRead! &&
                                      (widget.noriffTS == null
                                          ? true
                                          : (widget.notification!.timestamp! >=
                                              widget.noriffTS!)),
                                  child: Icon(
                                    Icons.brightness_1,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 8,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Text(
                                functions.formatDateTime(
                                    widget.notification!.timestamp!),
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xA5050A41),
                                      fontSize: 10,
                                    ),
                              ),
                            ),
                          ],
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
  }
}
