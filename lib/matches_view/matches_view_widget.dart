import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_matches_widget_widget.dart';
import '/components/gender_icon_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'matches_view_model.dart';
export 'matches_view_model.dart';

class MatchesViewWidget extends StatefulWidget {
  const MatchesViewWidget({Key? key}) : super(key: key);

  @override
  _MatchesViewWidgetState createState() => _MatchesViewWidgetState();
}

class _MatchesViewWidgetState extends State<MatchesViewWidget> {
  late MatchesViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchesViewModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Matches',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
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
                final columnUsersRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextFormField(
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
                                  size: 24.0,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                          ),
                      validator: _model.txtSearchControllerValidator
                          .asValidator(context),
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
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
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
                            elevation: 0.0,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final matches = containerUsersRecordList
                                        .where((e) => functions.checkMatches(
                                            e,
                                            columnUsersRecord.liked!.toList(),
                                            _model.txtSearchController.text))
                                        .toList();
                                    if (matches.isEmpty) {
                                      return Center(
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: EmptyMatchesWidgetWidget(
                                            search:
                                                _model.txtSearchController.text,
                                          ),
                                        ),
                                      );
                                    }
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 4.0,
                                        mainAxisSpacing: 4.0,
                                        childAspectRatio: 0.75,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: matches.length,
                                      itemBuilder: (context, matchesIndex) {
                                        final matchesItem =
                                            matches[matchesIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (columnUsersRecord.liked!
                                                    .toList()
                                                    .contains(
                                                        matchesItem.uid) ||
                                                columnUsersRecord.isPremium! ||
                                                !getRemoteConfigBool(
                                                    'check_premium') ||
                                                revenue_cat.activeEntitlementIds
                                                    .contains(FFAppState()
                                                        .entSeeWhoLikes)) {
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
                                              context.pushNamed(
                                                'GetPremiumView',
                                                queryParams: {
                                                  'back': serializeParam(
                                                    'MatchesView',
                                                    ParamType.String,
                                                  ),
                                                  'user': serializeParam(
                                                    columnUsersRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'user': columnUsersRecord,
                                                },
                                              );
                                            }
                                          },
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0xFFF5F5F5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
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
                                                        stops: [0.0, 1.0],
                                                        begin:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        end:
                                                            AlignmentDirectional(
                                                                0, 1.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 8.0),
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
                                                              key: Key(
                                                                  'Key6u4_${matchesIndex}_of_${matches.length}'),
                                                              gender:
                                                                  matchesItem
                                                                      .gender,
                                                              maleIcon: Icon(
                                                                FFIcons.kmale,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 16.0,
                                                              ),
                                                              femaleIcon: Icon(
                                                                FFIcons.kfemale,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 16.0,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                '${matchesItem.firstName}, ${functions.getAge(matchesItem.birthDay).toString()}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          14.0,
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
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              matchesItem
                                                                  .education!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              matchesItem.bio!,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        8.0,
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
                                                  if (!(matchesItem.blocked!
                                                          .toList()
                                                          .contains(
                                                              columnUsersRecord
                                                                  .uid) ||
                                                      columnUsersRecord.blocked!
                                                          .toList()
                                                          .contains(
                                                              matchesItem.uid)))
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.1, 0.95),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: Icon(
                                                          Icons.chat,
                                                          color:
                                                              Color(0xA3F5F5F5),
                                                          size: 30.0,
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
                                                                          .uid) ||
                                                              revenue_cat
                                                                  .activeEntitlementIds
                                                                  .contains(
                                                                      FFAppState()
                                                                          .entChatToNotMatched)) {
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
                                                              'GetPremiumView',
                                                              queryParams: {
                                                                'user':
                                                                    serializeParam(
                                                                  columnUsersRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'user':
                                                                    columnUsersRecord,
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  if (matchesItem.blocked!
                                                          .toList()
                                                          .contains(
                                                              columnUsersRecord
                                                                  .uid) ||
                                                      columnUsersRecord.blocked!
                                                          .toList()
                                                          .contains(
                                                              matchesItem.uid))
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.1, 0.95),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: Icon(
                                                          Icons
                                                              .speaker_notes_off_outlined,
                                                          color:
                                                              Color(0xA3F5F5F5),
                                                          size: 30.0,
                                                        ),
                                                        onPressed: () async {
                                                          if (columnUsersRecord
                                                              .blocked!
                                                              .toList()
                                                              .contains(
                                                                  matchesItem
                                                                      .uid)) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'User ${matchesItem.displayName} has been blocked.',
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
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
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
                                                          }
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
                                                        size: 24.0,
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
                                                      'check_premium') ||
                                                  revenue_cat
                                                      .activeEntitlementIds
                                                      .contains(FFAppState()
                                                          .entSeeWhoLikes))) {
                                                return ClipRect(
                                                  child: ImageFiltered(
                                                    imageFilter:
                                                        ImageFilter.blur(
                                                      sigmaX: 8.0,
                                                      sigmaY: 8.0,
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
