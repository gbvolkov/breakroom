import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/allow_location_notiff_window_widget.dart';
import '../components/empty_candidates_list_widget_widget.dart';
import '../components/gender_icon_widget.dart';
import '../components/likes_limit_exceed_widget_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/permissions_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import '../flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class HomeViewWidget extends StatefulWidget {
  const HomeViewWidget({Key? key}) : super(key: key);

  @override
  _HomeViewWidgetState createState() => _HomeViewWidgetState();
}

class _HomeViewWidgetState extends State<HomeViewWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 2000.ms,
          begin: 0,
          end: 10,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1.ms,
          duration: 1000.ms,
          begin: 10,
          end: 0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 2000.ms,
          begin: 0,
          end: 10,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1.ms,
          duration: 1000.ms,
          begin: 10,
          end: 0,
        ),
      ],
    ),
  };
  ChatsRecord? groupChat;
  bool? didPurchase;
  int? clikesState;
  late SwipeableCardSectionController swipeableStackController;
  String? uid;
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  UsersRecord? userDoc;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      if ((isAndroid && getRemoteConfigBool('isDroidSub')) ||
          (isiOS && getRemoteConfigBool('isiOSSub'))) {
        final isEntitled = await revenue_cat.isEntitled('premium');
        if (isEntitled == null) {
          return;
        } else if (!isEntitled) {
          await revenue_cat.loadOfferings();
        }

        if (isEntitled) {
          if (FFAppState().cHomeVisits == 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Congrats, you are on Premium!',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).alternate,
                    fontSize: 14,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              ),
            );
          }
        } else {
          if (FFAppState().cHomeVisits == 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Subscribe to Premium to unlock full features!',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryColor,
                    fontSize: 14,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).alternate,
              ),
            );
          }
        }
      }
      setState(() => FFAppState().cHomeVisits = FFAppState().cHomeVisits + 1);
      userDoc = await actions.getUserDocument(
        currentUserReference!,
      );
      if (userDoc != null) {
        if (userDoc!.isComplete!) {
          setState(() => FFAppState().tmpIntention = userDoc!.intention!);
          if ((await getPermissionStatus(locationPermission)) &&
              functions.isLocationSet(currentUserLocationValue)) {
            setState(() => FFAppState().isFirstAtHome = true);
          } else {
            if (functions.isLocationSet(userDoc!.geoposition)) {
              if (FFAppState().isFirstAtHome) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: AllowLocationNotiffWindowWidget(),
                    );
                  },
                ).then((value) => setState(() {}));
              }
              setState(() => FFAppState().isFirstAtHome = false);
            } else {
              context.pushNamed('SetYourLocationView');
            }
          }

          final usersUpdateData = createUsersRecordData(
            geoposition: functions.getUserLocation(
                userDoc!.geoposition, currentUserLocationValue),
          );
          await currentUserReference!.update(usersUpdateData);
          if (!FFAppState().whoViewedIntro.contains(currentUserUid)) {
            setState(() => FFAppState().addToWhoViewedIntro(currentUserUid));

            context.goNamed('IntroductionView');
          }
        } else {
          await actions.initializeUserDataState(
            userDoc!.bodyType,
            userDoc!.childfreeStatus,
            userDoc!.drinkingStatus,
            userDoc!.education,
            userDoc!.gender,
            userDoc!.genderPreference,
            userDoc!.height,
            userDoc!.weight,
            userDoc!.intention,
            userDoc!.lookingFor!.toList().toList(),
            userDoc!.religion,
            userDoc!.smokingStatus,
            userDoc!.spiritualStatus,
            userDoc!.workoutStatus,
            userDoc!.firstName,
            userDoc!.lastName,
            userDoc!.birthDay,
            userDoc!.bio,
            userDoc!.industry,
            userDoc!.occupation,
            userDoc!.interests!.toList().toList(),
          );

          context.goNamed('CreateProfileView');

          return;
        }
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    swipeableStackController = SwipeableCardSectionController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: FutureBuilder<UsersRecord>(
              future: UsersRecord.getDocumentOnce(currentUserReference!),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'BreakRoom',
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 38,
                                ),
                          ),
                          InkWell(
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
                              width: 25,
                              height: 25,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Stack(
                        children: [
                          if (FFAppState().tmpIntention == 'Dating')
                            Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('btnDating pressed ...');
                                        },
                                        text: 'Dating',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: double.infinity,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 4, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          setState(() => FFAppState()
                                              .tmpIntention = 'Social');

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
                                          context.pushNamed(
                                            'HomeView',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        text: 'Social',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40,
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                              height: 40,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          setState(() => FFAppState()
                                              .tmpIntention = 'Dating');

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
                                          context.pushNamed(
                                            'HomeView',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        text: 'Dating',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: double.infinity,
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 4, 0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('btnSocial pressed ...');
                                        },
                                        text: 'Social',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                      isEqualTo: FFAppState().tmpIntention != ''
                                          ? FFAppState().tmpIntention
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
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
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
                                            .toList()
                                            .take(1)
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
                                      botttomCardHeightFraction: 0.75,
                                      topCardWidthFraction: 0.9,
                                      middleCardWidthFraction: 0.85,
                                      botttomCardWidthFraction: 0.8,
                                      onSwipeFn: (index) {},
                                      onLeftSwipe: (index) async {
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation1'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation1']!
                                              .controller
                                              .forward();
                                        }
                                        // addToDislikedLike

                                        final usersUpdateData = {
                                          'disliked': FieldValue.arrayUnion(
                                              [matchedUsers[index]!.uid]),
                                          'touched': FieldValue.arrayUnion(
                                              [matchedUsers[index]!.uid]),
                                        };
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                        setState(() => FFAppState()
                                            .dislikedUsers
                                            .add(matchedUsers[index]!.uid!));
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed(
                                          'HomeView',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      onRightSwipe: (index) async {
                                        var _shouldSetState = false;
                                        clikesState =
                                            await actions.canProcessLikeAction(
                                          columnUsersRecord.likesCount,
                                          columnUsersRecord.lastLikeTime,
                                          columnUsersRecord.isPremium! ||
                                              revenue_cat.activeEntitlementIds
                                                  .contains(FFAppState()
                                                      .entUnlimLikes),
                                          getRemoteConfigBool('check_premium'),
                                        );
                                        _shouldSetState = true;
                                        if (clikesState == 0) {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child:
                                                    LikesLimitExceedWidgetWidget(
                                                  user: columnUsersRecord,
                                                  showTime: true,
                                                  back: 'HomeView',
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(
                                              () => didPurchase = value));

                                          _shouldSetState = true;
                                          if ((didPurchase != null) &&
                                              didPurchase!) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'You\'ve unlocked unlimited likes!',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                            );
                                          }
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            'HomeView',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          if (animationsMap[
                                                  'containerOnActionTriggerAnimation2'] !=
                                              null) {
                                            await animationsMap[
                                                    'containerOnActionTriggerAnimation2']!
                                                .controller
                                                .forward();
                                          }
                                          if (clikesState == -1) {
                                            // addToLikedList

                                            final usersUpdateData = {
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
                                                .update(usersUpdateData);
                                          } else {
                                            // addToLikedList

                                            final usersUpdateData = {
                                              'liked': FieldValue.arrayUnion(
                                                  [matchedUsers[index]!.uid]),
                                              'touched': FieldValue.arrayUnion(
                                                  [matchedUsers[index]!.uid]),
                                              'likesCount':
                                                  FieldValue.increment(1),
                                            };
                                            await currentUserReference!
                                                .update(usersUpdateData);
                                          }
                                        }

                                        if (matchedUsers[index]!
                                            .liked!
                                            .toList()
                                            .contains(columnUsersRecord.uid)) {
                                          groupChat = await FFChatManager
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
                                              'backPage': 'push',
                                            },
                                          );

                                          final notificationsCreateData =
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
                                              .set(notificationsCreateData);

                                          context.goNamed(
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
                                              'backPage': 'push',
                                            },
                                          );

                                          final notificationsCreateData =
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
                                              .set(notificationsCreateData);
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            'HomeView',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        }

                                        if (_shouldSetState) setState(() {});
                                      },
                                      onUpSwipe: (index) {},
                                      onDownSwipe: (index) async {
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed('HomeView');
                                      },
                                      itemBuilder:
                                          (context, matchedUsersIndex) {
                                        final matchedUsersItem =
                                            matchedUsers[matchedUsersIndex];
                                        return Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Colors.transparent,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 64),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      functions
                                                          .getPhotosListValue(
                                                              matchedUsersItem
                                                                  .photos!
                                                                  .toList(),
                                                              random_data
                                                                  .randomInteger(
                                                                      0, 10)),
                                                      'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.8,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, -1),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 64),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'HomeDetailsView',
                                                        queryParams: {
                                                          'userProfile':
                                                              serializeParam(
                                                            matchedUsersItem,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'userProfile':
                                                              matchedUsersItem,
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
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
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.8,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Colors.transparent,
                                                            Color(0xB1000000)
                                                          ],
                                                          stops: [0, 1],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0, -1),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, -1),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 0),
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
                                                                .fromSTEB(16, 0,
                                                                    0, 0),
                                                        child: Container(
                                                          width: 90,
                                                          height: 35,
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            32),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      size: 24,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        '${valueOrDefault<String>(
                                                                          functions
                                                                              .geoDistance(matchedUsersItem.geoposition, functions.getUserLocation(columnUsersRecord.geoposition, currentUserLocationValue))
                                                                              .toString(),
                                                                          '?',
                                                                        )} miles',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
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
                                                                .fromSTEB(0, 0,
                                                                    16, 0),
                                                        child: Container(
                                                          width: 90,
                                                          height: 35,
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            32),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 24,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        matchedUsersItem
                                                                            .photos!
                                                                            .toList()
                                                                            .length
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
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
                                                alignment: AlignmentDirectional(
                                                    -1, 0.45),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 8, 0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.19,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00777777),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4, 0, 0, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, -1),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          8),
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
                                                                    width: 80,
                                                                    height: 25,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100,
                                                                            height:
                                                                                100,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              borderRadius: BorderRadius.circular(32),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              matchedUsersItem.intention!,
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
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
                                                                      gender: matchedUsersItem
                                                                          .gender,
                                                                      maleIcon:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kmale,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            24,
                                                                      ),
                                                                      femaleIcon:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kfemale,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            24,
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
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        6),
                                                            child: Text(
                                                              '${matchedUsersItem.firstName}, ${functions.getAge(matchedUsersItem.birthDay).toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        8),
                                                            child: Text(
                                                              '${matchedUsersItem.industry}, ${matchedUsersItem.occupation}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            matchedUsersItem
                                                                .bio!
                                                                .maybeHandleOverflow(
                                                              maxChars: 50,
                                                              replacement: '…',
                                                            ),
                                                            maxLines: 3,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  fontSize: 12,
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
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      1,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Icon(
                                                    FFIcons.kicDislike,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 100,
                                                  ),
                                                ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'containerOnActionTriggerAnimation1']!,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      1,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .systemSuccess,
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Icon(
                                                    FFIcons.kicLike,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 100,
                                                  ),
                                                ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'containerOnActionTriggerAnimation2']!,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      itemCount: matchedUsers.length,
                                      controller: swipeableStackController,
                                      enableSwipeUp: false,
                                      enableSwipeDown: true,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          if (!(columnUsersRecord.isPremium! ||
                                  !getRemoteConfigBool('check_premium') ||
                                  revenue_cat.activeEntitlementIds
                                      .contains(FFAppState().entRewindDisliked))
                              ? false
                              : (FFAppState().dislikedUsers.length > 0))
                            Align(
                              alignment: AlignmentDirectional(0.88, 0.72),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20,
                                borderWidth: 1,
                                buttonSize: 40,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                icon: Icon(
                                  Icons.settings_backup_restore,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 20,
                                ),
                                onPressed: () async {
                                  uid = await actions.getLastString(
                                    FFAppState().dislikedUsers.toList(),
                                  );

                                  final usersUpdateData = {
                                    'disliked': FieldValue.arrayRemove([uid]),
                                    'touched': FieldValue.arrayRemove([uid]),
                                  };
                                  await columnUsersRecord.reference
                                      .update(usersUpdateData);
                                  setState(() =>
                                      FFAppState().dislikedUsers.remove(uid!));
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamed(
                                    'HomeView',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );

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
