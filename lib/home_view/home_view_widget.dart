import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/profile_bottom_sheet_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class HomeViewWidget extends StatefulWidget {
  const HomeViewWidget({Key? key}) : super(key: key);

  @override
  _HomeViewWidgetState createState() => _HomeViewWidgetState();
}

class _HomeViewWidgetState extends State<HomeViewWidget> {
  ChatsRecord? groupChat;
  UsersRecord? matchedUser;
  late SwipeableCardSectionController swipeableStackController;
  String? choiceChipsValue;
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  UsersRecord? userDoc;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!FFAppState().whoViewedIntro.contains(currentUserUid)) {
        setState(() => FFAppState().addToWhoViewedIntro(currentUserUid));

        context.pushNamed('IntroductionView');

        return;
      } else {
        userDoc = await actions.getUserDocument(
          currentUserReference!,
        );
        if (userDoc != null) {
          if (!userDoc!.isComplete!) {
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

            context.pushNamed('CreateProfileView');

            return;
          }
        }
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    swipeableStackController = SwipeableCardSectionController();
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
    return StreamBuilder<UsersRecord>(
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
        final homeViewUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                context.pushNamed('IntroductionView');
                              },
                              child: Text(
                                'BreakRoom',
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 38,
                                    ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                currentUserLocationValue =
                                    await getCurrentUserLocation(
                                        defaultLocation: LatLng(0.0, 0.0));
                                await actions.initializeFilterState(
                                  currentUserDocument!.filter,
                                  currentUserLocationValue,
                                );

                                context.pushNamed('FiltersView');
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: FlutterFlowChoiceChips(
                                    initiallySelected: [
                                      columnUsersRecord.intention!
                                    ],
                                    options: FFAppState()
                                        .intentions
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: (val) async {
                                      setState(
                                          () => choiceChipsValue = val?.first);
                                      if (choiceChipsValue !=
                                          valueOrDefault(
                                              currentUserDocument?.intention,
                                              '')) {
                                        final usersUpdateData =
                                            createUsersRecordData(
                                          intention: choiceChipsValue,
                                        );
                                        await currentUserReference!
                                            .update(usersUpdateData);

                                        context.pushNamed('HomeView');
                                      }
                                    },
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                      iconColor: Colors.white,
                                      iconSize: 18,
                                      elevation: 0,
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                      iconColor: Color(0xFF323B45),
                                      iconSize: 18,
                                      elevation: 0,
                                    ),
                                    chipSpacing: 4,
                                    multiselect: false,
                                    initialized: choiceChipsValue != null,
                                    alignment: WrapAlignment.spaceBetween,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              StreamBuilder<List<UsersRecord>>(
                                stream: queryUsersRecord(
                                  queryBuilder: (usersRecord) => usersRecord
                                      .where('gender',
                                          isEqualTo: columnUsersRecord
                                                      .genderPreference !=
                                                  ''
                                              ? columnUsersRecord
                                                  .genderPreference
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
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<UsersRecord> containerUsersRecordList =
                                      snapshot.data!
                                          .where((u) => u.uid != currentUserUid)
                                          .toList();
                                  return Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: AuthUserStreamWidget(
                                      child: Builder(
                                        builder: (context) {
                                          final matchedUsers = functions
                                              .cleanUpFilteredProfiles(
                                                  containerUsersRecordList
                                                      .toList(),
                                                  columnUsersRecord.liked!
                                                      .toList(),
                                                  columnUsersRecord.disliked!
                                                      .toList(),
                                                  currentUserDocument!.filter,
                                                  currentUserLocationValue!)
                                              .map((e) => e)
                                              .toList()
                                              .take(1)
                                              .toList();
                                          if (matchedUsers.isEmpty) {
                                            return Image.asset(
                                              'assets/images/UnknownSurgeon.png',
                                            );
                                          }
                                          return FlutterFlowSwipeableStack(
                                            topCardHeightFraction: 0.72,
                                            middleCardHeightFraction: 0.68,
                                            botttomCardHeightFraction: 0.75,
                                            topCardWidthFraction: 0.9,
                                            middleCardWidthFraction: 0.85,
                                            botttomCardWidthFraction: 0.8,
                                            onSwipeFn: (index) {},
                                            onLeftSwipe: (index) async {
                                              // addToDislikedLike

                                              final usersUpdateData = {
                                                'disliked':
                                                    FieldValue.arrayUnion([
                                                  functions.getFirstUID(
                                                      matchedUsers.toList())
                                                ]),
                                                'touched':
                                                    FieldValue.arrayUnion([
                                                  functions.getFirstUID(
                                                      matchedUsers.toList())
                                                ]),
                                              };
                                              await currentUserReference!
                                                  .update(usersUpdateData);
                                              if (Navigator.of(context)
                                                  .canPop()) {
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
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            },
                                            onRightSwipe: (index) async {
                                              matchedUser = await actions
                                                  .getUsersListElement(
                                                matchedUsers.toList(),
                                                0,
                                              );
                                              // addToLikedList

                                              final usersUpdateData = {
                                                'liked': FieldValue.arrayUnion(
                                                    [matchedUser!.uid]),
                                                'touched':
                                                    FieldValue.arrayUnion(
                                                        [matchedUser!.uid]),
                                              };
                                              await currentUserReference!
                                                  .update(usersUpdateData);
                                              if (functions
                                                  .getFirstLiked(
                                                      matchedUsers.toList())
                                                  .contains(currentUserUid)) {
                                                groupChat = await FFChatManager
                                                    .instance
                                                    .createChat(
                                                  [matchedUser!.reference],
                                                );
                                                triggerPushNotification(
                                                  notificationTitle:
                                                      'You have match!',
                                                  notificationText:
                                                      'Congrats! You have match with ${valueOrDefault(currentUserDocument?.firstName, '')}, ${formatNumber(
                                                    functions.getAge(
                                                        currentUserDocument!
                                                            .birthDay),
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '###',
                                                    locale: '',
                                                  )}!',
                                                  notificationImageUrl:
                                                      currentUserPhoto,
                                                  userRefs: [
                                                    matchedUser!.reference
                                                  ],
                                                  initialPageName:
                                                      'HomeDetailsView',
                                                  parameterData: {
                                                    'userProfile':
                                                        currentUserReference,
                                                    'mode': 'Match',
                                                  },
                                                );

                                                final notificationsCreateData =
                                                    createNotificationsRecordData(
                                                  receiver:
                                                      matchedUser!.reference,
                                                  type: 'match',
                                                  content:
                                                      'Congrats! You have match with ${valueOrDefault(currentUserDocument?.firstName, '')}, ${formatNumber(
                                                    functions.getAge(
                                                        currentUserDocument!
                                                            .birthDay),
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '###',
                                                    locale: '',
                                                  )}!',
                                                  referredUser:
                                                      currentUserReference,
                                                  timestamp:
                                                      getCurrentTimestamp,
                                                  isRead: false,
                                                );
                                                await NotificationsRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        notificationsCreateData);

                                                context.pushNamed(
                                                  'NewMatchView',
                                                  queryParams: {
                                                    'me': serializeParam(
                                                      columnUsersRecord,
                                                      ParamType.Document,
                                                    ),
                                                    'match': serializeParam(
                                                      matchedUser,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'me': columnUsersRecord,
                                                    'match': matchedUser,
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
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '###',
                                                    locale: '',
                                                  )} likes you!',
                                                  notificationImageUrl:
                                                      currentUserPhoto,
                                                  userRefs: [
                                                    matchedUser!.reference
                                                  ],
                                                  initialPageName:
                                                      'HomeDetailsView',
                                                  parameterData: {
                                                    'userProfile':
                                                        currentUserReference,
                                                  },
                                                );

                                                final notificationsCreateData =
                                                    createNotificationsRecordData(
                                                  receiver:
                                                      matchedUser!.reference,
                                                  type: 'like',
                                                  content:
                                                      'Congrats! ${valueOrDefault(currentUserDocument?.firstName, '')}, ${formatNumber(
                                                    functions.getAge(
                                                        currentUserDocument!
                                                            .birthDay),
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '###',
                                                    locale: '',
                                                  )} likes you!',
                                                  referredUser:
                                                      currentUserReference,
                                                  timestamp:
                                                      getCurrentTimestamp,
                                                  isRead: false,
                                                );
                                                await NotificationsRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        notificationsCreateData);
                                                if (Navigator.of(context)
                                                    .canPop()) {
                                                  context.pop();
                                                }
                                                context.pushNamed(
                                                  'HomeView',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              }

                                              setState(() {});
                                            },
                                            onUpSwipe: (index) {},
                                            onDownSwipe: (index) async {
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed('HomeView');
                                            },
                                            itemBuilder:
                                                (context, matchedUsersIndex) {
                                              final matchedUsersItem =
                                                  matchedUsers[
                                                      matchedUsersIndex];
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 64),
                                                      child: InkWell(
                                                        onTap: () async {
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
                                                                    ProfileBottomSheetWidget(),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(24),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                valueOrDefault<
                                                                    String>(
                                                              functions.getPhotosListValue(
                                                                  matchedUsersItem
                                                                      .photos!
                                                                      .toList(),
                                                                  random_data
                                                                      .randomInteger(
                                                                          0,
                                                                          10)),
                                                              'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                                            ),
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.8,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, -1),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 64),
                                                        child: InkWell(
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
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomCenter,
                                                                ),
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
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
                                                                      .circular(
                                                                          16),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, -1),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 16,
                                                                    0, 0),
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
                                                                          16,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Container(
                                                                width: 90,
                                                                height: 35,
                                                                child: Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(32),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.location_on,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            size:
                                                                                24,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              '${functions.geoDistance(matchedUsersItem.geoposition, columnUsersRecord.geoposition).toString()} miles',
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
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
                                                                          0,
                                                                          0,
                                                                          16,
                                                                          0),
                                                              child: Container(
                                                                width: 90,
                                                                height: 35,
                                                                child: Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          borderRadius:
                                                                              BorderRadius.circular(32),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.photo_camera_outlined,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                24,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              matchedUsersItem.photos!.toList().length.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
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
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1, 0.45),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 0, 8, 0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.19,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00777777),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        0,
                                                                        0,
                                                                        0),
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
                                                                          0,
                                                                          -1),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
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
                                                                          width:
                                                                              80,
                                                                          height:
                                                                              25,
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: Container(
                                                                                  width: 100,
                                                                                  height: 100,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    borderRadius: BorderRadius.circular(32),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                  child: Text(
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
                                                                        if (matchedUsersItem.gender ==
                                                                            'Male')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Icon(
                                                                              FFIcons.kmale,
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 24,
                                                                            ),
                                                                          ),
                                                                        if (matchedUsersItem.gender !=
                                                                            'Male')
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                4,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Icon(
                                                                              FFIcons.kfemale,
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 24,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          6),
                                                                  child: Text(
                                                                    '${matchedUsersItem.firstName}, ${functions.getAge(matchedUsersItem.birthDay).toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .title2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          8),
                                                                  child: Text(
                                                                    '${matchedUsersItem.industry}, ${matchedUsersItem.occupation}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  matchedUsersItem
                                                                      .bio!
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        50,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  maxLines: 3,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w300,
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
                                            itemCount: matchedUsers.length,
                                            controller:
                                                swipeableStackController,
                                            enableSwipeUp: false,
                                            enableSwipeDown: true,
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Container(
                                  width: 115,
                                  height: 115,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Container(
                                          width: 110,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Container(
                                          width: 84,
                                          height: 84,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            shape: BoxShape.circle,
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: Icon(
                                              Icons.favorite_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 35,
                                            ),
                                            onPressed: () async {
                                              swipeableStackController
                                                  .triggerSwipeUp();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
      },
    );
  }
}
