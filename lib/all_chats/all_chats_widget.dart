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
import 'package:cached_network_image/cached_network_image.dart';
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
              final colCurrentUserUsersRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: Container(
                                  width: double.infinity,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final companions =
                                          contAllChatsChatsRecordList
                                              .where((e) =>
                                                  functions.chekChatRecord(
                                                      e,
                                                      txtSearchController!.text,
                                                      currentUserUid))
                                              .toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: companions.length,
                                        itemBuilder:
                                            (context, companionsIndex) {
                                          final companionsItem =
                                              companions[companionsIndex];
                                          return StreamBuilder<UsersRecord>(
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
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final contCompanionUsersRecord =
                                                  snapshot.data!;
                                              return Container(
                                                width: 80,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                ),
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        StreamBuilder<
                                                            List<
                                                                ChatMessagesRecord>>(
                                                          stream:
                                                              queryChatMessagesRecord(
                                                            queryBuilder: (chatMessagesRecord) =>
                                                                chatMessagesRecord.where(
                                                                    'chat',
                                                                    isEqualTo:
                                                                        companionsItem
                                                                            .reference),
                                                            limit: 100,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<ChatMessagesRecord>
                                                                contMessagesChatMessagesRecordList =
                                                                snapshot.data!;
                                                            return Container(
                                                              width: 100,
                                                              height: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  ClipOval(
                                                                    child:
                                                                        Container(
                                                                      width: 80,
                                                                      height:
                                                                          80,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        imageUrl:
                                                                            contCompanionUsersRecord.photoUrl!,
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            80,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (contMessagesChatMessagesRecordList
                                                                          .length >
                                                                      0)
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.7,
                                                                              -0.9),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            32,
                                                                        height:
                                                                            16,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          borderRadius:
                                                                              BorderRadius.circular(16),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          contMessagesChatMessagesRecordList.length >= 99
                                                                              ? '99+'
                                                                              : contMessagesChatMessagesRecordList.length.toString(),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      8, 0, 0),
                                                          child: Text(
                                                            contCompanionUsersRecord
                                                                .displayName!,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
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
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Builder(
                                      builder: (context) {
                                        final chats =
                                            contAllChatsChatsRecordList
                                                .where((e) =>
                                                    functions.chekChatRecord(
                                                        e,
                                                        txtSearchController!
                                                            .text,
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
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
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
                                                      height: 80,
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
                                                            onTap: () => context
                                                                .pushNamed(
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
                                                            lastChatTime: chatsItem
                                                                .lastMessageTime,
                                                            seen: chatsItem
                                                                .lastMessageSeenBy!
                                                                .contains(
                                                                    currentUserReference),
                                                            title: chatInfo
                                                                .chatPreviewTitle(),
                                                            userProfilePic: chatInfo
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14,
                                                            ),
                                                            dateTextStyle:
                                                                GoogleFonts
                                                                    .getFont(
                                                              'Roboto',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 14,
                                                            ),
                                                            previewTextStyle:
                                                                GoogleFonts
                                                                    .getFont(
                                                              'Roboto',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 14,
                                                            ),
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        3,
                                                                        3,
                                                                        3,
                                                                        3),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0),
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
                                                        width: double.infinity,
                                                        height: 80,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.84, 0),
                                                          child: Icon(
                                                            Icons
                                                                .lock_outline_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            size: 24,
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
                                                        width: double.infinity,
                                                        height: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x7FF5F5F5),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.84, 0),
                                                          child: Icon(
                                                            Icons
                                                                .speaker_notes_off_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ),
                                                    StreamBuilder<UsersRecord>(
                                                      stream: UsersRecord
                                                          .getDocument(
                                                              chatsItem.userA!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final contuserAUsersRecord =
                                                            snapshot.data!;
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          height: 80,
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
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final contUserBUsersRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return InkWell(
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
                                                                          colCurrentUserUsersRecord
                                                                              .uid)) {
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
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'User ${stkCompanionUsersRecord.displayName} has been blocked.',
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
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
                                                                  height: 80,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Slidable(
                                                                    actionPane:
                                                                        const SlidableScrollActionPane(),
                                                                    secondaryActions: [
                                                                      IconSlideAction(
                                                                        caption:
                                                                            '...',
                                                                        color: Colors
                                                                            .blue,
                                                                        icon: FontAwesomeIcons
                                                                            .ban,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return Padding(
                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                child: MenuReportUserWidget(
                                                                                  isBlocked: colCurrentUserUsersRecord.blocked!.toList().contains(stkCompanionUsersRecord.uid),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() => choice = value));

                                                                          if (choice ==
                                                                              'unmatch') {
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
                                                                              final usersUpdateData = {
                                                                                'liked': FieldValue.arrayRemove([
                                                                                  stkCompanionUsersRecord.uid
                                                                                ]),
                                                                              };
                                                                              await currentUserReference!.update(usersUpdateData);
                                                                            }
                                                                          } else {
                                                                            if (choice ==
                                                                                'report') {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: ReportUserDialogWidget(),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() => report = value));

                                                                              if (report != null && report != '') {
                                                                                final complaintsCreateData = createComplaintsRecordData(
                                                                                  reporter: currentUserReference,
                                                                                  referredUser: stkCompanionUsersRecord.reference,
                                                                                  report: report,
                                                                                  complaintTS: getCurrentTimestamp,
                                                                                );
                                                                                var complaintsRecordReference = ComplaintsRecord.collection.doc();
                                                                                await complaintsRecordReference.set(complaintsCreateData);
                                                                                reportDoc = ComplaintsRecord.getDocumentFromData(complaintsCreateData, complaintsRecordReference);
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Your report has been sent. Our support service will get back soon.',
                                                                                      style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                            fontFamily: 'Roboto',
                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                            fontSize: 18,
                                                                                          ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 4000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                );
                                                                              }
                                                                            } else {
                                                                              if (choice == 'block') {
                                                                                final usersUpdateData = {
                                                                                  'blocked': FieldValue.arrayUnion([
                                                                                    stkCompanionUsersRecord.uid
                                                                                  ]),
                                                                                };
                                                                                await currentUserReference!.update(usersUpdateData);
                                                                              } else {
                                                                                if (choice == 'unblock') {
                                                                                  final usersUpdateData = {
                                                                                    'blocked': FieldValue.arrayRemove([
                                                                                      stkCompanionUsersRecord.uid
                                                                                    ]),
                                                                                  };
                                                                                  await currentUserReference!.update(usersUpdateData);
                                                                                }
                                                                              }
                                                                            }
                                                                          }

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                      IconSlideAction(
                                                                        caption:
                                                                            'Delete',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .systemError,
                                                                        icon: Icons
                                                                            .delete_forever_outlined,
                                                                        onTap:
                                                                            () async {
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
                                                                    child:
                                                                        ListTile(
                                                                      tileColor:
                                                                          Color(
                                                                              0xFFF5F5F5),
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
