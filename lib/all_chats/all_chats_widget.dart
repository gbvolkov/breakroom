import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_companions_list_widget_widget.dart';
import '/components/empty_list_widget_widget.dart';
import '/components/menu_report_user_widget.dart';
import '/components/report_user_dialog_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_chats_model.dart';
export 'all_chats_model.dart';

class AllChatsWidget extends StatefulWidget {
  const AllChatsWidget({Key? key}) : super(key: key);

  @override
  _AllChatsWidgetState createState() => _AllChatsWidgetState();
}

class _AllChatsWidgetState extends State<AllChatsWidget> {
  late AllChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllChatsModel());

    _model.txtSearchController ??= TextEditingController();
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            'Chats',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [
            Visibility(
              visible: false,
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.person_add_alt,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pushNamed('InviteUser');
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
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
              final colCurrentUserUsersRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: TextFormField(
                      controller: _model.txtSearchController,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.txtSearchController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: FlutterFlowTheme.of(context).bodySmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        prefixIcon: Icon(
                          Icons.search,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 18.0,
                        ),
                        suffixIcon: _model.txtSearchController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.txtSearchController?.clear();
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: Color(0xFF757575),
                                  size: 22.0,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall,
                      validator: _model.txtSearchControllerValidator
                          .asValidator(context),
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
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          );
                        }
                        List<ChatsRecord> contAllChatsChatsRecordList =
                            snapshot.data!;
                        return Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (_model.txtSearchController.text != null &&
                                  _model.txtSearchController.text != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 8.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final companions =
                                              contAllChatsChatsRecordList
                                                  .where((e) =>
                                                      functions.chekChatRecord(
                                                          e,
                                                          _model
                                                              .txtSearchController
                                                              .text,
                                                          currentUserUid))
                                                  .toList();
                                          if (companions.isEmpty) {
                                            return Center(
                                              child:
                                                  EmptyCompanionsListWidgetWidget(),
                                            );
                                          }
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: companions.length,
                                            itemBuilder:
                                                (context, companionsIndex) {
                                              final companionsItem =
                                                  companions[companionsIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child:
                                                    StreamBuilder<UsersRecord>(
                                                  stream: UsersRecord.getDocument(
                                                      functions.getChatUser(
                                                          companionsItem.userA,
                                                          companionsItem.userB,
                                                          currentUserReference!)!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final contCompanionUsersRecord =
                                                        snapshot.data!;
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (!FFAppState()
                                                            .recentChats
                                                            .contains(
                                                                companionsItem
                                                                    .reference)) {
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                .addToRecentChats(
                                                                    companionsItem
                                                                        .reference);
                                                          });
                                                        }
                                                        if (!contCompanionUsersRecord
                                                            .blocked!
                                                            .toList()
                                                            .contains(
                                                                colCurrentUserUsersRecord
                                                                    .uid)) {
                                                          if (!colCurrentUserUsersRecord
                                                              .blocked!
                                                              .toList()
                                                              .contains(
                                                                  contCompanionUsersRecord
                                                                      .uid)) {
                                                            context.pushNamed(
                                                              'Chat',
                                                              queryParams: {
                                                                'chatRef':
                                                                    serializeParam(
                                                                  companionsItem
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'chatUser':
                                                                    serializeParam(
                                                                  contCompanionUsersRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                                'route':
                                                                    serializeParam(
                                                                  'allchats',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'chatUser':
                                                                    contCompanionUsersRecord,
                                                              },
                                                            );
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'User ${contCompanionUsersRecord.displayName} has been blocked.',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    Color(
                                                                        0x00000000),
                                                              ),
                                                            );
                                                          }
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'User ${contCompanionUsersRecord.displayName} has blocked you.',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0x00000000),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 120.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                StreamBuilder<
                                                                    List<
                                                                        ChatMessagesRecord>>(
                                                                  stream:
                                                                      queryChatMessagesRecord(
                                                                    queryBuilder: (chatMessagesRecord) => chatMessagesRecord.where(
                                                                        'chat',
                                                                        isEqualTo:
                                                                            companionsItem.reference),
                                                                    limit: 100,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ChatMessagesRecord>
                                                                        contMessagesChatMessagesRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return Container(
                                                                      width:
                                                                          80.0,
                                                                      height:
                                                                          80.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            80.0,
                                                                        height:
                                                                            80.0,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            ClipOval(
                                                                              child: Container(
                                                                                width: 80.0,
                                                                                height: 80.0,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(90.0),
                                                                                  child: CachedNetworkImage(
                                                                                    imageUrl: valueOrDefault<String>(
                                                                                      contCompanionUsersRecord.photoUrl,
                                                                                      'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                                                                    ),
                                                                                    width: 80.0,
                                                                                    height: 80.0,
                                                                                    fit: BoxFit.contain,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (contMessagesChatMessagesRecordList.length >
                                                                                0)
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.7, -0.9),
                                                                                child: Container(
                                                                                  width: 32.0,
                                                                                  height: 16.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                  child: Text(
                                                                                    contMessagesChatMessagesRecordList.length >= 99 ? '99+' : contMessagesChatMessagesRecordList.length.toString(),
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Roboto',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    contCompanionUsersRecord
                                                                        .displayName!,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              if (_model.txtSearchController.text == null ||
                                  _model.txtSearchController.text == '')
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final chats =
                                              contAllChatsChatsRecordList
                                                  .where((e) =>
                                                      functions.chekChatRecord(
                                                          e,
                                                          FFAppState()
                                                              .chatSearchStr,
                                                          currentUserUid))
                                                  .toList();
                                          if (chats.isEmpty) {
                                            return EmptyListWidgetWidget();
                                          }
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: chats.length,
                                            itemBuilder: (context, chatsIndex) {
                                              final chatsItem =
                                                  chats[chatsIndex];
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
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final stkCompanionUsersRecord =
                                                      snapshot.data!;
                                                  return Stack(
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 80.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            FFChatInfo>(
                                                          stream: FFChatManager
                                                              .instance
                                                              .getChatInfo(
                                                                  chatRecord:
                                                                      chatsItem),
                                                          builder: (context,
                                                              snapshot) {
                                                            final chatInfo =
                                                                snapshot.data ??
                                                                    FFChatInfo(
                                                                        chatsItem);
                                                            return FFChatPreview(
                                                              onTap: () =>
                                                                  context
                                                                      .pushNamed(
                                                                'Chat',
                                                                queryParams: {
                                                                  'chatUser':
                                                                      serializeParam(
                                                                    chatInfo.otherUsers.length ==
                                                                            1
                                                                        ? chatInfo
                                                                            .otherUsersList
                                                                            .first
                                                                        : null,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                  'chatRef':
                                                                      serializeParam(
                                                                    chatInfo
                                                                        .chatRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
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
                                                                  chatsItem
                                                                      .lastMessageTime,
                                                              seen: chatsItem
                                                                  .lastMessageSeenBy!
                                                                  .contains(
                                                                      currentUserReference),
                                                              title: chatInfo
                                                                  .chatPreviewTitle(),
                                                              userProfilePic:
                                                                  chatInfo
                                                                      .chatPreviewPic(),
                                                              color: Color(
                                                                  0x00000000),
                                                              unreadColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              titleTextStyle:
                                                                  GoogleFonts
                                                                      .getFont(
                                                                'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14.0,
                                                              ),
                                                              dateTextStyle:
                                                                  GoogleFonts
                                                                      .getFont(
                                                                'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 14.0,
                                                              ),
                                                              previewTextStyle:
                                                                  GoogleFonts
                                                                      .getFont(
                                                                'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 14.0,
                                                              ),
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          3.0,
                                                                          3.0,
                                                                          3.0),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      if (!stkCompanionUsersRecord
                                                              .blocked!
                                                              .toList()
                                                              .contains(
                                                                  colCurrentUserUsersRecord
                                                                      .uid) &&
                                                          colCurrentUserUsersRecord
                                                              .blocked!
                                                              .toList()
                                                              .contains(
                                                                  stkCompanionUsersRecord
                                                                      .uid))
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 80.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.84, 0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .lock_outline_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      if (stkCompanionUsersRecord
                                                          .blocked!
                                                          .toList()
                                                          .contains(
                                                              colCurrentUserUsersRecord
                                                                  .uid))
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 80.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x7FF5F5F5),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.84, 0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .speaker_notes_off_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      StreamBuilder<
                                                          UsersRecord>(
                                                        stream: UsersRecord
                                                            .getDocument(
                                                                chatsItem
                                                                    .userA!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final contuserAUsersRecord =
                                                              snapshot.data!;
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            height: 80.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: StreamBuilder<
                                                                UsersRecord>(
                                                              stream: UsersRecord
                                                                  .getDocument(
                                                                      chatsItem
                                                                          .userB!),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final contUserBUsersRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    final chatsUpdateData =
                                                                        createChatsRecordData(
                                                                      userNameA:
                                                                          contuserAUsersRecord
                                                                              .displayName,
                                                                      userNameB:
                                                                          contUserBUsersRecord
                                                                              .displayName,
                                                                    );
                                                                    await chatsItem
                                                                        .reference
                                                                        .update(
                                                                            chatsUpdateData);
                                                                    if (!stkCompanionUsersRecord
                                                                        .blocked!
                                                                        .toList()
                                                                        .contains(
                                                                            colCurrentUserUsersRecord.uid)) {
                                                                      if (!colCurrentUserUsersRecord
                                                                          .blocked!
                                                                          .toList()
                                                                          .contains(
                                                                              stkCompanionUsersRecord.uid)) {
                                                                        context
                                                                            .pushNamed(
                                                                          'Chat',
                                                                          queryParams:
                                                                              {
                                                                            'chatRef':
                                                                                serializeParam(
                                                                              chatsItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                            'chatUser':
                                                                                serializeParam(
                                                                              stkCompanionUsersRecord,
                                                                              ParamType.Document,
                                                                            ),
                                                                            'route':
                                                                                serializeParam(
                                                                              'allchats',
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                          extra: <
                                                                              String,
                                                                              dynamic>{
                                                                            'chatUser':
                                                                                stkCompanionUsersRecord,
                                                                          },
                                                                        );
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'User ${stkCompanionUsersRecord.displayName} has been blocked.',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                Color(0x00000000),
                                                                          ),
                                                                        );
                                                                      }
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'User ${stkCompanionUsersRecord.displayName} has blocked you.',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              Color(0x00000000),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        80.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Slidable(
                                                                      endActionPane:
                                                                          ActionPane(
                                                                        motion:
                                                                            const ScrollMotion(),
                                                                        extentRatio:
                                                                            0.5,
                                                                        children: [
                                                                          SlidableAction(
                                                                            label:
                                                                                '...',
                                                                            backgroundColor:
                                                                                Colors.blue,
                                                                            icon:
                                                                                FontAwesomeIcons.ban,
                                                                            onPressed:
                                                                                (_) async {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                barrierColor: Color(0x00000000),
                                                                                context: context,
                                                                                builder: (bottomSheetContext) {
                                                                                  return GestureDetector(
                                                                                    onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                      child: MenuReportUserWidget(
                                                                                        isBlocked: colCurrentUserUsersRecord.blocked!.toList().contains(stkCompanionUsersRecord.uid),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() => _model.choice = value));

                                                                              if (_model.choice == 'unmatch') {
                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: Text('Confirm unmatch'),
                                                                                          content: Text('Are you sure you want to unmatch ${stkCompanionUsersRecord.displayName}?'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                              child: Text('Cancel'),
                                                                                            ),
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                              child: Text('Confirm'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    ) ??
                                                                                    false;
                                                                                if (confirmDialogResponse) {
                                                                                  final usersUpdateData1 = {
                                                                                    'liked': FieldValue.arrayRemove([
                                                                                      stkCompanionUsersRecord.uid
                                                                                    ]),
                                                                                  };
                                                                                  await currentUserReference!.update(usersUpdateData1);
                                                                                }
                                                                              } else {
                                                                                if (_model.choice == 'report') {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    context: context,
                                                                                    builder: (bottomSheetContext) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                          child: ReportUserDialogWidget(),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() => _model.report = value));

                                                                                  if (_model.report != null && _model.report != '') {
                                                                                    final complaintsCreateData = createComplaintsRecordData(
                                                                                      reporter: currentUserReference,
                                                                                      referredUser: stkCompanionUsersRecord.reference,
                                                                                      report: _model.report,
                                                                                      complaintTS: getCurrentTimestamp,
                                                                                    );
                                                                                    var complaintsRecordReference = ComplaintsRecord.collection.doc();
                                                                                    await complaintsRecordReference.set(complaintsCreateData);
                                                                                    _model.reportDoc = ComplaintsRecord.getDocumentFromData(complaintsCreateData, complaintsRecordReference);
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'Your report has been sent. Our support service will get back soon.',
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: 'Roboto',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                fontSize: 18.0,
                                                                                              ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 4000),
                                                                                        backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                } else {
                                                                                  if (_model.choice == 'block') {
                                                                                    final usersUpdateData2 = {
                                                                                      'blocked': FieldValue.arrayUnion([
                                                                                        stkCompanionUsersRecord.uid
                                                                                      ]),
                                                                                    };
                                                                                    await currentUserReference!.update(usersUpdateData2);
                                                                                  } else {
                                                                                    if (_model.choice == 'unblock') {
                                                                                      final usersUpdateData3 = {
                                                                                        'blocked': FieldValue.arrayRemove([
                                                                                          stkCompanionUsersRecord.uid
                                                                                        ]),
                                                                                      };
                                                                                      await currentUserReference!.update(usersUpdateData3);
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }

                                                                              setState(() {});
                                                                            },
                                                                          ),
                                                                          SlidableAction(
                                                                            label:
                                                                                'Delete',
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).systemError,
                                                                            icon:
                                                                                Icons.delete_forever_outlined,
                                                                            onPressed:
                                                                                (_) async {
                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: Text('Delete chat'),
                                                                                        content: Text('The chat will be removed completely. Please confirm'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                            child: Text('Cancel'),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                            child: Text('Confirm'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ) ??
                                                                                  false;
                                                                              if (confirmDialogResponse) {
                                                                                await chatsItem.reference.delete();
                                                                              }
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      child:
                                                                          ListTile(
                                                                        tileColor:
                                                                            Color(0xFFF5F5F5),
                                                                        dense:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
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
                                  ),
                                ),
                              if (_model.txtSearchController.text != null &&
                                  _model.txtSearchController.text != '')
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Recent search',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState().update(() {
                                                    FFAppState().recentChats =
                                                        [];
                                                  });
                                                },
                                                child: Container(
                                                  width: 48.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Text(
                                                    'Clear',
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final chatsRefs = FFAppState()
                                                      .recentChats
                                                      .toList();
                                                  if (chatsRefs.isEmpty) {
                                                    return EmptyListWidgetWidget();
                                                  }
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: chatsRefs.length,
                                                    itemBuilder: (context,
                                                        chatsRefsIndex) {
                                                      final chatsRefsItem =
                                                          chatsRefs[
                                                              chatsRefsIndex];
                                                      return StreamBuilder<
                                                          ChatsRecord>(
                                                        stream: ChatsRecord
                                                            .getDocument(
                                                                chatsRefsItem),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final contRecentChatChatsRecord =
                                                              snapshot.data!;
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: StreamBuilder<
                                                                UsersRecord>(
                                                              stream: UsersRecord.getDocument(functions.getChatUser(
                                                                  contRecentChatChatsRecord
                                                                      .userA,
                                                                  contRecentChatChatsRecord
                                                                      .userB,
                                                                  currentUserReference!)!),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final stkCompanionUsersRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return Stack(
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          80.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child: StreamBuilder<
                                                                          FFChatInfo>(
                                                                        stream: FFChatManager
                                                                            .instance
                                                                            .getChatInfo(chatRecord: contRecentChatChatsRecord),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          final chatInfo =
                                                                              snapshot.data ?? FFChatInfo(contRecentChatChatsRecord);
                                                                          return FFChatPreview(
                                                                            onTap: () =>
                                                                                context.pushNamed(
                                                                              'Chat',
                                                                              queryParams: {
                                                                                'chatUser': serializeParam(
                                                                                  chatInfo.otherUsers.length == 1 ? chatInfo.otherUsersList.first : null,
                                                                                  ParamType.Document,
                                                                                ),
                                                                                'chatRef': serializeParam(
                                                                                  chatInfo.chatRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'chatUser': chatInfo.otherUsers.length == 1 ? chatInfo.otherUsersList.first : null,
                                                                              },
                                                                            ),
                                                                            lastChatText:
                                                                                chatInfo.chatPreviewMessage(),
                                                                            lastChatTime:
                                                                                contRecentChatChatsRecord.lastMessageTime,
                                                                            seen:
                                                                                contRecentChatChatsRecord.lastMessageSeenBy!.contains(currentUserReference),
                                                                            title:
                                                                                chatInfo.chatPreviewTitle(),
                                                                            userProfilePic:
                                                                                chatInfo.chatPreviewPic(),
                                                                            color:
                                                                                Color(0x00000000),
                                                                            unreadColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            titleTextStyle:
                                                                                GoogleFonts.getFont(
                                                                              'Roboto',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                            dateTextStyle:
                                                                                GoogleFonts.getFont(
                                                                              'Roboto',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                            previewTextStyle:
                                                                                GoogleFonts.getFont(
                                                                              'Roboto',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                3.0,
                                                                                3.0,
                                                                                3.0,
                                                                                3.0),
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    if (!stkCompanionUsersRecord
                                                                            .blocked!
                                                                            .toList()
                                                                            .contains(colCurrentUserUsersRecord
                                                                                .uid) &&
                                                                        colCurrentUserUsersRecord
                                                                            .blocked!
                                                                            .toList()
                                                                            .contains(stkCompanionUsersRecord.uid))
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            80.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -0.84,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.lock_outline_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (stkCompanionUsersRecord
                                                                        .blocked!
                                                                        .toList()
                                                                        .contains(
                                                                            colCurrentUserUsersRecord.uid))
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            80.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x7FF5F5F5),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -0.84,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.speaker_notes_off_outlined,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    StreamBuilder<
                                                                        UsersRecord>(
                                                                      stream: UsersRecord.getDocument(
                                                                          contRecentChatChatsRecord
                                                                              .userA!),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final contuserAUsersRecord =
                                                                            snapshot.data!;
                                                                        return Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              80.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              StreamBuilder<UsersRecord>(
                                                                            stream:
                                                                                UsersRecord.getDocument(contRecentChatChatsRecord.userB!),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              final contUserBUsersRecord = snapshot.data!;
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  final chatsUpdateData = createChatsRecordData(
                                                                                    userNameA: contuserAUsersRecord.displayName,
                                                                                    userNameB: contUserBUsersRecord.displayName,
                                                                                  );
                                                                                  await chatsRefsItem.update(chatsUpdateData);
                                                                                  if (!stkCompanionUsersRecord.blocked!.toList().contains(colCurrentUserUsersRecord.uid)) {
                                                                                    if (!colCurrentUserUsersRecord.blocked!.toList().contains(stkCompanionUsersRecord.uid)) {
                                                                                      context.pushNamed(
                                                                                        'Chat',
                                                                                        queryParams: {
                                                                                          'chatRef': serializeParam(
                                                                                            chatsRefsItem,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                          'chatUser': serializeParam(
                                                                                            stkCompanionUsersRecord,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                          'route': serializeParam(
                                                                                            'allchats',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'chatUser': stkCompanionUsersRecord,
                                                                                        },
                                                                                      );
                                                                                    } else {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'User ${stkCompanionUsersRecord.displayName} has been blocked.',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: Color(0x00000000),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  } else {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'User ${stkCompanionUsersRecord.displayName} has blocked you.',
                                                                                          style: TextStyle(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                          ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 4000),
                                                                                        backgroundColor: Color(0x00000000),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                },
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 80.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Slidable(
                                                                                    endActionPane: ActionPane(
                                                                                      motion: const ScrollMotion(),
                                                                                      extentRatio: 0.5,
                                                                                      children: [
                                                                                        SlidableAction(
                                                                                          label: '...',
                                                                                          backgroundColor: Colors.blue,
                                                                                          icon: FontAwesomeIcons.ban,
                                                                                          onPressed: (_) async {
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              barrierColor: Color(0x00000000),
                                                                                              context: context,
                                                                                              builder: (bottomSheetContext) {
                                                                                                return GestureDetector(
                                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                    child: MenuReportUserWidget(
                                                                                                      isBlocked: colCurrentUserUsersRecord.blocked!.toList().contains(stkCompanionUsersRecord.uid),
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => setState(() => _model.choiceRecent = value));

                                                                                            if (_model.choiceRecent == 'unmatch') {
                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                    context: context,
                                                                                                    builder: (alertDialogContext) {
                                                                                                      return AlertDialog(
                                                                                                        title: Text('Confirm unmatch'),
                                                                                                        content: Text('Are you sure you want to unmatch ${stkCompanionUsersRecord.displayName}?'),
                                                                                                        actions: [
                                                                                                          TextButton(
                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                            child: Text('Cancel'),
                                                                                                          ),
                                                                                                          TextButton(
                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                            child: Text('Confirm'),
                                                                                                          ),
                                                                                                        ],
                                                                                                      );
                                                                                                    },
                                                                                                  ) ??
                                                                                                  false;
                                                                                              if (confirmDialogResponse) {
                                                                                                final usersUpdateData1 = {
                                                                                                  'liked': FieldValue.arrayRemove([
                                                                                                    stkCompanionUsersRecord.uid
                                                                                                  ]),
                                                                                                };
                                                                                                await currentUserReference!.update(usersUpdateData1);
                                                                                              }
                                                                                            } else {
                                                                                              if (_model.choiceRecent == 'report') {
                                                                                                await showModalBottomSheet(
                                                                                                  isScrollControlled: true,
                                                                                                  backgroundColor: Colors.transparent,
                                                                                                  barrierColor: Color(0x00000000),
                                                                                                  context: context,
                                                                                                  builder: (bottomSheetContext) {
                                                                                                    return GestureDetector(
                                                                                                      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                      child: Padding(
                                                                                                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                        child: ReportUserDialogWidget(),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => setState(() => _model.reportRecent = value));

                                                                                                if (_model.reportRecent != null && _model.reportRecent != '') {
                                                                                                  final complaintsCreateData = createComplaintsRecordData(
                                                                                                    reporter: currentUserReference,
                                                                                                    referredUser: stkCompanionUsersRecord.reference,
                                                                                                    report: _model.reportRecent,
                                                                                                    complaintTS: getCurrentTimestamp,
                                                                                                  );
                                                                                                  var complaintsRecordReference = ComplaintsRecord.collection.doc();
                                                                                                  await complaintsRecordReference.set(complaintsCreateData);
                                                                                                  _model.reportDocRecent = ComplaintsRecord.getDocumentFromData(complaintsCreateData, complaintsRecordReference);
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                    SnackBar(
                                                                                                      content: Text(
                                                                                                        'Your report has been sent. Our support service will get back soon.',
                                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                              fontFamily: 'Roboto',
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              fontSize: 18.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                      duration: Duration(milliseconds: 4000),
                                                                                                      backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                              } else {
                                                                                                if (_model.choiceRecent == 'block') {
                                                                                                  final usersUpdateData2 = {
                                                                                                    'blocked': FieldValue.arrayUnion([
                                                                                                      stkCompanionUsersRecord.uid
                                                                                                    ]),
                                                                                                  };
                                                                                                  await currentUserReference!.update(usersUpdateData2);
                                                                                                } else {
                                                                                                  if (_model.choiceRecent == 'unblock') {
                                                                                                    final usersUpdateData3 = {
                                                                                                      'blocked': FieldValue.arrayRemove([
                                                                                                        stkCompanionUsersRecord.uid
                                                                                                      ]),
                                                                                                    };
                                                                                                    await currentUserReference!.update(usersUpdateData3);
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }

                                                                                            setState(() {});
                                                                                          },
                                                                                        ),
                                                                                        SlidableAction(
                                                                                          label: 'Delete',
                                                                                          backgroundColor: FlutterFlowTheme.of(context).systemError,
                                                                                          icon: Icons.delete_forever_outlined,
                                                                                          onPressed: (_) async {
                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                  context: context,
                                                                                                  builder: (alertDialogContext) {
                                                                                                    return AlertDialog(
                                                                                                      title: Text('Delete chat'),
                                                                                                      content: Text('The chat will be removed completely. Please confirm'),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                          child: Text('Cancel'),
                                                                                                        ),
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                          child: Text('Confirm'),
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  },
                                                                                                ) ??
                                                                                                false;
                                                                                            if (confirmDialogResponse) {
                                                                                              await chatsRefsItem.delete();
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().removeFromRecentChats(chatsRefsItem);
                                                                                              });
                                                                                            }
                                                                                          },
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    child: ListTile(
                                                                                      tileColor: Color(0xFFF5F5F5),
                                                                                      dense: false,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
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
      ),
    );
  }
}
