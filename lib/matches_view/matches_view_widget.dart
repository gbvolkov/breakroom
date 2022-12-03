import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_matches_widget_widget.dart';
import '../components/gender_icon_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchesViewWidget extends StatefulWidget {
  const MatchesViewWidget({Key? key}) : super(key: key);

  @override
  _MatchesViewWidgetState createState() => _MatchesViewWidgetState();
}

class _MatchesViewWidgetState extends State<MatchesViewWidget> {
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Matches',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
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
                    TextFormField(
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
                    Expanded(
                      child: StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord.where(
                              'liked',
                              arrayContains:
                                  currentUserUid != '' ? currentUserUid : null),
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
                          List<UsersRecord> containerUsersRecordList = snapshot
                              .data!
                              .where((u) => u.uid != currentUserUid)
                              .toList();
                          return Material(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Builder(
                                  builder: (context) {
                                    final matches = containerUsersRecordList
                                        .where((e) => functions.checkMatches(
                                            e,
                                            columnUsersRecord.liked!.toList(),
                                            txtSearchController!.text))
                                        .toList();
                                    if (matches.isEmpty) {
                                      return Center(
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: EmptyMatchesWidgetWidget(
                                            search: txtSearchController!.text,
                                          ),
                                        ),
                                      );
                                    }
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 4,
                                        mainAxisSpacing: 4,
                                        childAspectRatio: 0.75,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: matches.length,
                                      itemBuilder: (context, matchesIndex) {
                                        final matchesItem =
                                            matches[matchesIndex];
                                        return InkWell(
                                          onTap: () async {
                                            if (columnUsersRecord.liked!
                                                    .toList()
                                                    .contains(
                                                        matchesItem.uid) ||
                                                columnUsersRecord.isPremium! ||
                                                !getRemoteConfigBool(
                                                    'check_premium')) {
                                              context.pushNamed(
                                                'HomeDetailsView',
                                                queryParams: {
                                                  'userProfile': serializeParam(
                                                    matchesItem,
                                                    ParamType.Document,
                                                  ),
                                                  'mode': serializeParam(
                                                    columnUsersRecord.liked!
                                                            .toList()
                                                            .contains(
                                                                matchesItem.uid)
                                                        ? 'match'
                                                        : 'like',
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'userProfile': matchesItem,
                                                },
                                              );
                                            } else {
                                              context
                                                  .pushNamed('GetPremiumView');
                                            }
                                          },
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0xFFF5F5F5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Builder(builder: (_) {
                                              final child = Stack(
                                                children: [
                                                  Image.network(
                                                    valueOrDefault<String>(
                                                      matchesItem.photoUrl,
                                                      'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                                    ),
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.network(
                                                          '',
                                                        ).image,
                                                      ),
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0x00C4C4C4),
                                                          Color(0xC9000000)
                                                        ],
                                                        stops: [0, 1],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0, -1),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 0, 8, 8),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            GenderIconWidget(
                                                              gender:
                                                                  matchesItem
                                                                      .gender,
                                                              maleIcon: Icon(
                                                                FFIcons.kmale,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 16,
                                                              ),
                                                              femaleIcon: Icon(
                                                                FFIcons.kfemale,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 16,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                '${matchesItem.firstName}, ${functions.getAge(matchesItem.birthDay).toString()}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              matchesItem
                                                                  .education!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              matchesItem.bio!,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (!matchesItem.blocked!
                                                      .toList()
                                                      .contains(
                                                          columnUsersRecord
                                                              .uid))
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.1, 0.95),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30,
                                                        borderWidth: 1,
                                                        buttonSize: 60,
                                                        icon: Icon(
                                                          Icons.chat,
                                                          color:
                                                              Color(0xA3F5F5F5),
                                                          size: 30,
                                                        ),
                                                        onPressed: () async {
                                                          if (columnUsersRecord
                                                                  .isPremium! ||
                                                              !getRemoteConfigBool(
                                                                  'check_premium') ||
                                                              columnUsersRecord
                                                                  .liked!
                                                                  .toList()
                                                                  .contains(
                                                                      matchesItem
                                                                          .uid)) {
                                                            context.pushNamed(
                                                              'Chat',
                                                              queryParams: {
                                                                'chatUser':
                                                                    serializeParam(
                                                                  matchesItem,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                                'route':
                                                                    serializeParam(
                                                                  'matchesview',
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'chatUser':
                                                                    matchesItem,
                                                              },
                                                            );
                                                          } else {
                                                            context.pushNamed(
                                                                'GetPremiumView');
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  if (matchesItem.blocked!
                                                      .toList()
                                                      .contains(
                                                          columnUsersRecord
                                                              .uid))
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.1, 0.95),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30,
                                                        borderWidth: 1,
                                                        buttonSize: 60,
                                                        icon: Icon(
                                                          Icons
                                                              .speaker_notes_off_outlined,
                                                          color:
                                                              Color(0xA3F5F5F5),
                                                          size: 30,
                                                        ),
                                                        onPressed: () async {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'User ${matchesItem.displayName} has blocked you.',
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
                                                        },
                                                      ),
                                                    ),
                                                  if (columnUsersRecord.liked!
                                                      .toList()
                                                      .contains(
                                                          matchesItem.uid))
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.9, -0.97),
                                                      child: Icon(
                                                        FFIcons.kheartsIcons,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 24,
                                                      ),
                                                    ),
                                                ],
                                              );
                                              if (!(columnUsersRecord.liked!
                                                      .toList()
                                                      .contains(
                                                          matchesItem.uid) ||
                                                  columnUsersRecord
                                                      .isPremium! ||
                                                  !getRemoteConfigBool(
                                                      'check_premium'))) {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                      sigmaX: 8,
                                                      sigmaY: 8,
                                                    ),
                                                    child: child,
                                                  ),
                                                );
                                              }
                                              return child;
                                            }),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
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
        ),
      ),
    );
  }
}
