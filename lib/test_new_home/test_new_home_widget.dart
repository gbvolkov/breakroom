import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/empty_candidates_list_widget_widget.dart';
import '/components/gender_icon_widget.dart';
import '/components/notifications_bell_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'test_new_home_model.dart';
export 'test_new_home_model.dart';

class TestNewHomeWidget extends StatefulWidget {
  const TestNewHomeWidget({Key? key}) : super(key: key);

  @override
  _TestNewHomeWidgetState createState() => _TestNewHomeWidgetState();
}

class _TestNewHomeWidgetState extends State<TestNewHomeWidget> {
  late TestNewHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestNewHomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      _model.userDoc = await actions.getUserDocument(
        currentUserReference!,
      );
      if (_model.userDoc != null) {
        if (_model.userDoc!.isComplete!) {
          FFAppState().update(() {
            FFAppState().tmpIntention = _model.userDoc!.intention!;
          });
          if (!(await getPermissionStatus(locationPermission)) ||
              !functions.isLocationSet(_model.userDoc!.geoposition)) {
            context.pushNamed('SetYourLocationView');
          }

          final usersUpdateData = createUsersRecordData(
            geoposition: functions.getUserLocation(
                _model.userDoc!.geoposition, currentUserLocationValue),
          );
          await currentUserReference!.update(usersUpdateData);
          if (!FFAppState().whoViewedIntro.contains(currentUserUid)) {
            FFAppState().update(() {
              FFAppState().addToWhoViewedIntro(currentUserUid);
            });

            context.goNamed('IntroductionView');
          }
        } else {
          await actions.initializeUserDataState(
            _model.userDoc!.bodyType,
            _model.userDoc!.childfreeStatus,
            _model.userDoc!.drinkingStatus,
            _model.userDoc!.education,
            _model.userDoc!.gender,
            _model.userDoc!.genderPreference,
            _model.userDoc!.height,
            _model.userDoc!.weight,
            _model.userDoc!.intention,
            _model.userDoc!.lookingFor!.toList().toList(),
            _model.userDoc!.religion,
            _model.userDoc!.smokingStatus,
            _model.userDoc!.spiritualStatus,
            _model.userDoc!.workoutStatus,
            _model.userDoc!.firstName,
            _model.userDoc!.lastName,
            _model.userDoc!.birthDay,
            _model.userDoc!.bio,
            _model.userDoc!.industry,
            _model.userDoc!.occupation,
            _model.userDoc!.interests!.toList().toList(),
          );

          context.goNamed('CreateProfileView');

          return;
        }
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
            child: FutureBuilder<UsersRecord>(
              future: UsersRecord.getDocumentOnce(currentUserReference!),
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TESTRoom',
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 38.0,
                                ),
                          ),
                          if (columnUsersRecord.isPremium ?? true)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed('NotificationsView');
                              },
                              child: wrapWithModel(
                                model: _model.notificationsBellModel,
                                updateCallback: () => setState(() {}),
                                child: NotificationsBellWidget(
                                  notiffTS: columnUsersRecord.notiffReadTS,
                                ),
                              ),
                            ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              currentUserLocationValue =
                                  await getCurrentUserLocation(
                                      defaultLocation: LatLng(0.0, 0.0));
                              await actions.initializeFilterState(
                                columnUsersRecord.filter,
                                currentUserLocationValue,
                              );

                              context.pushNamed(
                                'FiltersView',
                                queryParams: {
                                  'user': serializeParam(
                                    columnUsersRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'user': columnUsersRecord,
                                },
                              );
                            },
                            child: Image.asset(
                              'assets/images/imgFilter.png',
                              width: 25.0,
                              height: 25.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Stack(
                        children: [
                          if (FFAppState().tmpIntention == 'Dating')
                            Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 34.0,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('btnDating pressed ...');
                                        },
                                        text: 'Dating',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: double.infinity,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 34.0,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().update(() {
                                            FFAppState().tmpIntention =
                                                'Social';
                                          });

                                          final usersUpdateData =
                                              createUsersRecordData(
                                            intention:
                                                FFAppState().tmpIntention,
                                          );
                                          await columnUsersRecord.reference
                                              .update(usersUpdateData);
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed('testNewHome');
                                        },
                                        text: 'Social',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (FFAppState().tmpIntention == 'Social')
                            Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 34.0,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().update(() {
                                            FFAppState().tmpIntention =
                                                'Dating';
                                          });

                                          final usersUpdateData =
                                              createUsersRecordData(
                                            intention:
                                                FFAppState().tmpIntention,
                                          );
                                          await columnUsersRecord.reference
                                              .update(usersUpdateData);
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed('testNewHome');
                                        },
                                        text: 'Dating',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: double.infinity,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 34.0,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('btnSocial pressed ...');
                                        },
                                        text: 'Social',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          FutureBuilder<List<UsersRecord>>(
                            future: queryUsersRecordOnce(
                              queryBuilder: (usersRecord) => usersRecord
                                  .whereIn(
                                      'gender',
                                      functions.getGenderFilter(
                                                  valueOrDefault<String>(
                                                columnUsersRecord.filter.gender,
                                                'Everyone',
                                              )) !=
                                              ''
                                          ? functions.getGenderFilter(
                                              valueOrDefault<String>(
                                              columnUsersRecord.filter.gender,
                                              'Everyone',
                                            ))
                                          : null)
                                  .where('intention',
                                      isEqualTo:
                                          columnUsersRecord.intention != ''
                                              ? columnUsersRecord.intention
                                              : null)
                                  .where('birthDay',
                                      isLessThanOrEqualTo:
                                          functions.addYearsToDate(
                                              getCurrentTimestamp,
                                              valueOrDefault<int>(
                                                columnUsersRecord
                                                    .filter.ageRange?.min,
                                                18,
                                              ),
                                              -1,
                                              0))
                                  .where('birthDay',
                                      isGreaterThanOrEqualTo:
                                          functions.addYearsToDate(
                                              getCurrentTimestamp,
                                              valueOrDefault<int>(
                                                columnUsersRecord
                                                    .filter.ageRange?.max,
                                                150,
                                              ),
                                              -1,
                                              -1)),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              List<UsersRecord> conCandidatesUsersRecordList =
                                  snapshot.data!
                                      .where((u) => u.uid != currentUserUid)
                                      .toList();
                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final matchedUsers =
                                        conCandidatesUsersRecordList
                                            .where((e) =>
                                                functions.checkProfileRecord(
                                                    e,
                                                    columnUsersRecord,
                                                    currentUserLocationValue!))
                                            .toList();
                                    if (matchedUsers.isEmpty) {
                                      return Center(
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child:
                                              EmptyCandidatesListWidgetWidget(
                                            user: columnUsersRecord,
                                          ),
                                        ),
                                      );
                                    }
                                    return FlutterFlowSwipeableStack(
                                      topCardHeightFraction: 0.78,
                                      middleCardHeightFraction: 0.68,
                                      bottomCardHeightFraction: 0.75,
                                      topCardWidthFraction: 0.9,
                                      middleCardWidthFraction: 0.85,
                                      bottomCardWidthFraction: 0.8,
                                      onSwipeFn: (index) {},
                                      onLeftSwipe: (index) async {
                                        // addToDislikedLike

                                        final usersUpdateData = {
                                          'disliked': FieldValue.arrayUnion(
                                              [matchedUsers[index]!.uid]),
                                          'touched': FieldValue.arrayUnion(
                                              [matchedUsers[index]!.uid]),
                                        };
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                        FFAppState().update(() {
                                          FFAppState().addToDislikedUsers(
                                              matchedUsers[index]!.uid!);
                                        });
                                      },
                                      onRightSwipe: (index) async {
                                        var _shouldSetState = false;
                                        _model.clikesState =
                                            await actions.canProcessLikeAction(
                                          columnUsersRecord.likesCount,
                                          columnUsersRecord.lastLikeTime,
                                          columnUsersRecord.isPremium,
                                          getRemoteConfigBool('check_premium'),
                                        );
                                        _shouldSetState = true;
                                        if (_model.clikesState == 0) {
                                          context.pushNamed('GetPremiumView');

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          if (_model.clikesState == -1) {
                                            // addToLikedList

                                            final usersUpdateData1 = {
                                              ...createUsersRecordData(
                                                likesCount: 1,
                                                lastLikeTime:
                                                    getCurrentTimestamp,
                                              ),
                                              'liked': FieldValue.arrayUnion(
                                                  [matchedUsers[index]!.uid]),
                                              'touched': FieldValue.arrayUnion(
                                                  [matchedUsers[index]!.uid]),
                                            };
                                            await currentUserReference!
                                                .update(usersUpdateData1);
                                          } else {
                                            // addToLikedList

                                            final usersUpdateData2 = {
                                              'liked': FieldValue.arrayUnion(
                                                  [matchedUsers[index]!.uid]),
                                              'touched': FieldValue.arrayUnion(
                                                  [matchedUsers[index]!.uid]),
                                              'likesCount':
                                                  FieldValue.increment(1),
                                            };
                                            await currentUserReference!
                                                .update(usersUpdateData2);
                                          }
                                        }

                                        if (matchedUsers[index]!
                                            .liked!
                                            .toList()
                                            .contains(columnUsersRecord.uid)) {
                                          _model.groupChat = await FFChatManager
                                              .instance
                                              .createChat(
                                            [matchedUsers[index]!.reference],
                                          );
                                          _shouldSetState = true;
                                          triggerPushNotification(
                                            notificationTitle:
                                                'You have match!',
                                            notificationText:
                                                'Congrats! You have match with ${valueOrDefault(currentUserDocument?.firstName, '')}, ${formatNumber(
                                              functions.getAge(
                                                  currentUserDocument!
                                                      .birthDay),
                                              formatType: FormatType.custom,
                                              format: '###',
                                              locale: '',
                                            )}!',
                                            notificationImageUrl:
                                                currentUserPhoto,
                                            userRefs: [
                                              matchedUsers[index]!.reference
                                            ],
                                            initialPageName: 'HomeDetailsView',
                                            parameterData: {
                                              'userProfile':
                                                  currentUserReference,
                                              'mode': 'Match',
                                            },
                                          );

                                          final notificationsCreateData1 =
                                              createNotificationsRecordData(
                                            receiver:
                                                matchedUsers[index]!.reference,
                                            type: 'match',
                                            content:
                                                'Congrats! You have match with ${valueOrDefault(currentUserDocument?.firstName, '')}, ${formatNumber(
                                              functions.getAge(
                                                  currentUserDocument!
                                                      .birthDay),
                                              formatType: FormatType.custom,
                                              format: '###',
                                              locale: '',
                                            )}!',
                                            referredUser: currentUserReference,
                                            timestamp: getCurrentTimestamp,
                                            isRead: false,
                                          );
                                          await NotificationsRecord.collection
                                              .doc()
                                              .set(notificationsCreateData1);

                                          context.pushNamed(
                                            'NewMatchView',
                                            queryParams: {
                                              'me': serializeParam(
                                                columnUsersRecord,
                                                ParamType.Document,
                                              ),
                                              'match': serializeParam(
                                                matchedUsers[index],
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'me': columnUsersRecord,
                                              'match': matchedUsers[index],
                                            },
                                          );
                                        } else {
                                          triggerPushNotification(
                                            notificationTitle:
                                                'Somebody likes you!',
                                            notificationText:
                                                'Congrats! ${valueOrDefault(currentUserDocument?.firstName, '')}, ${formatNumber(
                                              functions.getAge(
                                                  currentUserDocument!
                                                      .birthDay),
                                              formatType: FormatType.custom,
                                              format: '###',
                                              locale: '',
                                            )} likes you!',
                                            notificationImageUrl:
                                                currentUserPhoto,
                                            userRefs: [
                                              matchedUsers[index]!.reference
                                            ],
                                            initialPageName: 'HomeDetailsView',
                                            parameterData: {
                                              'userProfile':
                                                  currentUserReference,
                                            },
                                          );

                                          final notificationsCreateData2 =
                                              createNotificationsRecordData(
                                            receiver:
                                                matchedUsers[index]!.reference,
                                            type: 'like',
                                            content:
                                                'Congrats! ${valueOrDefault(currentUserDocument?.firstName, '')}, ${formatNumber(
                                              functions.getAge(
                                                  currentUserDocument!
                                                      .birthDay),
                                              formatType: FormatType.custom,
                                              format: '###',
                                              locale: '',
                                            )} likes you!',
                                            referredUser: currentUserReference,
                                            timestamp: getCurrentTimestamp,
                                            isRead: false,
                                          );
                                          await NotificationsRecord.collection
                                              .doc()
                                              .set(notificationsCreateData2);
                                        }

                                        if (_shouldSetState) setState(() {});
                                      },
                                      onUpSwipe: (index) {},
                                      onDownSwipe: (index) async {
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed('testNewHome');
                                      },
                                      itemBuilder:
                                          (context, matchedUsersIndex) {
                                        final matchedUsersItem =
                                            matchedUsers[matchedUsersIndex];
                                        return StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              matchedUsersItem.reference),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
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
                                            final cardUsersRecord =
                                                snapshot.data!;
                                            return Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color: Colors.transparent,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 64.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            valueOrDefault<
                                                                String>(
                                                          functions.getPhotosListValue(
                                                              cardUsersRecord
                                                                  .photos!
                                                                  .toList(),
                                                              random_data
                                                                  .randomInteger(
                                                                      0, 10)),
                                                          'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                                        ),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.8,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  64.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'HomeDetailsView',
                                                            queryParams: {
                                                              'userProfile':
                                                                  serializeParam(
                                                                matchedUsersItem,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'userProfile':
                                                                  matchedUsersItem,
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .scale,
                                                                alignment: Alignment
                                                                    .bottomCenter,
                                                              ),
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.8,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                Colors
                                                                    .transparent,
                                                                Color(
                                                                    0xB1000000)
                                                              ],
                                                              stops: [0.0, 1.0],
                                                              begin:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              end:
                                                                  AlignmentDirectional(
                                                                      0, 1.0),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.08),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 90.0,
                                                              height: 35.0,
                                                              child: Stack(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(32.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .location_on,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${valueOrDefault<String>(
                                                                              functions.geoDistance(cardUsersRecord.geoposition, functions.getUserLocation(columnUsersRecord.geoposition, currentUserLocationValue)).toString(),
                                                                              '?',
                                                                            )} miles',
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 90.0,
                                                              height: 35.0,
                                                              child: Stack(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        borderRadius:
                                                                            BorderRadius.circular(32.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .photo_camera_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            cardUsersRecord.photos!.toList().length.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Roboto',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.45),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.19,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00777777),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            80.0,
                                                                        height:
                                                                            25.0,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 100.0,
                                                                                height: 100.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  borderRadius: BorderRadius.circular(32.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  cardUsersRecord.intention!,
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: 'Roboto',
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            GenderIconWidget(
                                                                          key: Key(
                                                                              'Keyc1k_${matchedUsersIndex}_of_${matchedUsers.length}'),
                                                                          gender:
                                                                              cardUsersRecord.gender,
                                                                          maleIcon:
                                                                              Icon(
                                                                            FFIcons.kmale,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          femaleIcon:
                                                                              Icon(
                                                                            FFIcons.kfemale,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            6.0),
                                                                child: Text(
                                                                  '${cardUsersRecord.firstName}, ${functions.getAge(cardUsersRecord.birthDay).toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: Text(
                                                                  '${cardUsersRecord.industry}, ${cardUsersRecord.occupation}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                cardUsersRecord
                                                                    .bio!
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 50,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                maxLines: 3,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      itemCount: matchedUsers.length,
                                      controller:
                                          _model.swipeableStackController,
                                      enableSwipeUp: false,
                                      enableSwipeDown: true,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          if (!(columnUsersRecord.isPremium! ||
                                  !getRemoteConfigBool('check_premium'))
                              ? false
                              : (FFAppState().dislikedUsers.length > 0))
                            Align(
                              alignment: AlignmentDirectional(0.88, 0.72),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                icon: Icon(
                                  Icons.settings_backup_restore,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  _model.uid = await actions.getLastString(
                                    FFAppState().dislikedUsers.toList(),
                                  );

                                  final usersUpdateData = {
                                    'disliked':
                                        FieldValue.arrayRemove([_model.uid]),
                                    'touched':
                                        FieldValue.arrayRemove([_model.uid]),
                                  };
                                  await columnUsersRecord.reference
                                      .update(usersUpdateData);
                                  FFAppState().update(() {
                                    FFAppState()
                                        .removeFromDislikedUsers(_model.uid!);
                                  });
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamed('testNewHome');

                                  setState(() {});
                                },
                              ),
                            ),
                        ],
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
