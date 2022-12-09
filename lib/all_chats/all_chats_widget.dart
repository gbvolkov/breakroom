import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_list_widget_widget.dart';
import '../components/menu_report_user_widget.dart';
import '../components/report_user_dialog_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllChatsWidget extends StatefulWidget {
  const AllChatsWidget({Key? key}) : super(key: key);

  @override
  _AllChatsWidgetState createState() => _AllChatsWidgetState();
}

class _AllChatsWidgetState extends State<AllChatsWidget> {
  ComplaintsRecord? reportDoc;
  String? choice;
  String? report;
  TextEditingController? txtSearchController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    txtSearchController = TextEditingController();
  }

  @override
  void dispose() {
    txtSearchController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Chats',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Roboto',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          Visibility(
            visible: false,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.person_add_alt,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                context.pushNamed('InviteUser');
              },
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
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
              children: [
                if (false)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: TextFormField(
                      controller: txtSearchController,
                      onChanged: (_) => EasyDebounce.debounce(
                        'txtSearchController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        prefixIcon: Icon(
                          Icons.search,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 18,
                        ),
                        suffixIcon: txtSearchController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  txtSearchController?.clear();
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF757575),
                                  size: 22,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                  ),
                Expanded(
                  child: StreamBuilder<List<ChatsRecord>>(
                    stream: queryChatsRecord(
                      queryBuilder: (chatsRecord) => chatsRecord
                          .where('users', arrayContains: currentUserReference)
                          .orderBy('last_message_time', descending: true),
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
                      List<ChatsRecord> containerChatsRecordList =
                          snapshot.data!;
                      return Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                          child: Builder(
                            builder: (context) {
                              final chats = containerChatsRecordList
                                  .where((e) => !e.isDeleted!)
                                  .toList();
                              if (chats.isEmpty) {
                                return EmptyListWidgetWidget();
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: chats.length,
                                itemBuilder: (context, chatsIndex) {
                                  final chatsItem = chats[chatsIndex];
                                  return StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        functions.getChatUser(
                                            chatsItem.userA,
                                            chatsItem.userB,
                                            currentUserReference!)!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      final stackUsersRecord = snapshot.data!;
                                      return Stack(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 80,
                                            decoration: BoxDecoration(),
                                            child: StreamBuilder<FFChatInfo>(
                                              stream: FFChatManager.instance
                                                  .getChatInfo(
                                                      chatRecord: chatsItem),
                                              builder: (context, snapshot) {
                                                final chatInfo =
                                                    snapshot.data ??
                                                        FFChatInfo(chatsItem);
                                                return FFChatPreview(
                                                  onTap: () =>
                                                      context.pushNamed(
                                                    'Chat',
                                                    queryParams: {
                                                      'chatUser':
                                                          serializeParam(
                                                        chatInfo.otherUsers
                                                                    .length ==
                                                                1
                                                            ? chatInfo
                                                                .otherUsersList
                                                                .first
                                                            : null,
                                                        ParamType.Document,
                                                      ),
                                                      'chatRef': serializeParam(
                                                        chatInfo.chatRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'chatUser': chatInfo
                                                                  .otherUsers
                                                                  .length ==
                                                              1
                                                          ? chatInfo
                                                              .otherUsersList
                                                              .first
                                                          : null,
                                                    },
                                                  ),
                                                  lastChatText: chatInfo
                                                      .chatPreviewMessage(),
                                                  lastChatTime:
                                                      chatsItem.lastMessageTime,
                                                  seen: chatsItem
                                                      .lastMessageSeenBy!
                                                      .contains(
                                                          currentUserReference),
                                                  title: chatInfo
                                                      .chatPreviewTitle(),
                                                  userProfilePic:
                                                      chatInfo.chatPreviewPic(),
                                                  color: Color(0x00000000),
                                                  unreadColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  titleTextStyle:
                                                      GoogleFonts.getFont(
                                                    'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                  dateTextStyle:
                                                      GoogleFonts.getFont(
                                                    'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14,
                                                  ),
                                                  previewTextStyle:
                                                      GoogleFonts.getFont(
                                                    'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(3, 3, 3, 3),
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                );
                                              },
                                            ),
                                          ),
                                          if (!stackUsersRecord.blocked!
                                                  .toList()
                                                  .contains(
                                                      columnUsersRecord.uid) &&
                                              columnUsersRecord.blocked!
                                                  .toList()
                                                  .contains(
                                                      stackUsersRecord.uid))
                                            Container(
                                              width: double.infinity,
                                              height: 80,
                                              decoration: BoxDecoration(),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -0.84, 0),
                                                child: Icon(
                                                  Icons.lock_outline_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          if (stackUsersRecord.blocked!
                                              .toList()
                                              .contains(columnUsersRecord.uid))
                                            Container(
                                              width: double.infinity,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: Color(0x7FF5F5F5),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -0.84, 0),
                                                child: Icon(
                                                  Icons
                                                      .speaker_notes_off_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          InkWell(
                                            onTap: () async {
                                              if (!stackUsersRecord.blocked!
                                                  .toList()
                                                  .contains(
                                                      columnUsersRecord.uid)) {
                                                if (!columnUsersRecord.blocked!
                                                    .toList()
                                                    .contains(
                                                        stackUsersRecord.uid)) {
                                                  context.pushNamed(
                                                    'Chat',
                                                    queryParams: {
                                                      'chatRef': serializeParam(
                                                        chatsItem.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'chatUser':
                                                          serializeParam(
                                                        stackUsersRecord,
                                                        ParamType.Document,
                                                      ),
                                                      'route': serializeParam(
                                                        'allchats',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'chatUser':
                                                          stackUsersRecord,
                                                    },
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'User ${stackUsersRecord.displayName} has been blocked.',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          Color(0x00000000),
                                                    ),
                                                  );
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'User ${stackUsersRecord.displayName} has blocked you.',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        Color(0x00000000),
                                                  ),
                                                );
                                              }
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 80,
                                              decoration: BoxDecoration(),
                                              child: Slidable(
                                                actionPane:
                                                    const SlidableScrollActionPane(),
                                                secondaryActions: [
                                                  IconSlideAction(
                                                    caption: '...',
                                                    color: Colors.blue,
                                                    icon: FontAwesomeIcons.ban,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child:
                                                                MenuReportUserWidget(
                                                              isBlocked: columnUsersRecord
                                                                  .blocked!
                                                                  .toList()
                                                                  .contains(
                                                                      stackUsersRecord
                                                                          .uid),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() =>
                                                              choice = value));

                                                      if (choice == 'unmatch') {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Confirm unmatch'),
                                                                      content: Text(
                                                                          'Are you sure you want to unmatch ${stackUsersRecord.displayName}?'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('Cancel'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('Confirm'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          final usersUpdateData =
                                                              {
                                                            'liked': FieldValue
                                                                .arrayRemove([
                                                              stackUsersRecord
                                                                  .uid
                                                            ]),
                                                          };
                                                          await currentUserReference!
                                                              .update(
                                                                  usersUpdateData);
                                                        }
                                                      } else {
                                                        if (choice ==
                                                            'report') {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    ReportUserDialogWidget(),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() =>
                                                                  report =
                                                                      value));

                                                          if (report != null &&
                                                              report != '') {
                                                            final complaintsCreateData =
                                                                createComplaintsRecordData(
                                                              reporter:
                                                                  currentUserReference,
                                                              referredUser:
                                                                  stackUsersRecord
                                                                      .reference,
                                                              report: report,
                                                              complaintTS:
                                                                  getCurrentTimestamp,
                                                            );
                                                            var complaintsRecordReference =
                                                                ComplaintsRecord
                                                                    .collection
                                                                    .doc();
                                                            await complaintsRecordReference
                                                                .set(
                                                                    complaintsCreateData);
                                                            reportDoc = ComplaintsRecord
                                                                .getDocumentFromData(
                                                                    complaintsCreateData,
                                                                    complaintsRecordReference);
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Your report has been sent. Our support service will get back soon.',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        fontSize:
                                                                            18,
                                                                      ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                              ),
                                                            );
                                                          }
                                                        } else {
                                                          if (choice ==
                                                              'block') {
                                                            final usersUpdateData =
                                                                {
                                                              'blocked': FieldValue
                                                                  .arrayUnion([
                                                                stackUsersRecord
                                                                    .uid
                                                              ]),
                                                            };
                                                            await currentUserReference!
                                                                .update(
                                                                    usersUpdateData);
                                                          } else {
                                                            if (choice ==
                                                                'unblock') {
                                                              final usersUpdateData =
                                                                  {
                                                                'blocked':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  stackUsersRecord
                                                                      .uid
                                                                ]),
                                                              };
                                                              await currentUserReference!
                                                                  .update(
                                                                      usersUpdateData);
                                                            }
                                                          }
                                                        }
                                                      }

                                                      setState(() {});
                                                    },
                                                  ),
                                                  IconSlideAction(
                                                    caption: 'Delete',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .systemError,
                                                    icon: Icons
                                                        .delete_forever_outlined,
                                                    onTap: () async {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Delete chat'),
                                                                    content: Text(
                                                                        'The chat will be removed completely. Please confirm'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'Cancel'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Confirm'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        await chatsItem
                                                            .reference
                                                            .delete();
                                                      }
                                                    },
                                                  ),
                                                ],
                                                child: ListTile(
                                                  tileColor: Color(0xFFF5F5F5),
                                                  dense: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
