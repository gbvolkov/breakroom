import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/gender_icon_widget.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDetailsViewWidget extends StatefulWidget {
  const HomeDetailsViewWidget({
    Key? key,
    this.userProfile,
    this.mode,
    this.backPage,
  }) : super(key: key);

  final UsersRecord? userProfile;
  final String? mode;
  final String? backPage;

  @override
  _HomeDetailsViewWidgetState createState() => _HomeDetailsViewWidgetState();
}

class _HomeDetailsViewWidgetState extends State<HomeDetailsViewWidget> {
  ChatsRecord? groupChat;
  int? clikesState;
  PageController? pageViewController;
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            if (Navigator.of(context).canPop()) {
              context.pop();
            }
            context.pushNamed('HomeView');
          },
        ),
        title: Text(
          widget.userProfile!.firstName!,
          style: FlutterFlowTheme.of(context).subtitle1,
        ),
        actions: [],
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
              final columnUsersRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: custom_widgets.ImageSlider(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        images: widget.userProfile!.photos!
                            .toList()
                            .map((e) => e.image!)
                            .toList(),
                        emptyListImage:
                            'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                      ),
                    ),
                  ),
                  if (FFAppState().tmpInteger == 8576)
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, -1),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: Stack(
                                  children: [
                                    PageView(
                                      controller: pageViewController ??=
                                          PageController(initialPage: 0),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  functions.getPhotosListValue(
                                                      widget
                                                          .userProfile!.photos!
                                                          .toList(),
                                                      0),
                                                  'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                                ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, -1),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.transparent,
                                                      Color(0x4E000000)
                                                    ],
                                                    stops: [0, 1],
                                                    begin: AlignmentDirectional(
                                                        0, -1),
                                                    end: AlignmentDirectional(
                                                        0, 1),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Image.network(
                                          valueOrDefault<String>(
                                            functions.getPhotosListValue(
                                                widget.userProfile!.photos!
                                                    .toList(),
                                                1),
                                            'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                          ),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                        Image.network(
                                          valueOrDefault<String>(
                                            functions.getPhotosListValue(
                                                widget.userProfile!.photos!
                                                    .toList(),
                                                2),
                                            'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                          ),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: smooth_page_indicator
                                            .SmoothPageIndicator(
                                          controller: pageViewController ??=
                                              PageController(initialPage: 0),
                                          count: 3,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) {
                                            pageViewController!.animateToPage(
                                              i,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          },
                                          effect: smooth_page_indicator
                                              .ExpandingDotsEffect(
                                            expansionFactor: 2,
                                            spacing: 8,
                                            radius: 16,
                                            dotWidth: 8,
                                            dotHeight: 8,
                                            dotColor: Color(0xFF9E9E9E),
                                            activeDotColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                            paintStyle: PaintingStyle.fill,
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
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Stack(
                        alignment: AlignmentDirectional(0, 1),
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 64,
                                            height: 64,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                widget.userProfile!.photoUrl,
                                                'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 4),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${widget.userProfile!.firstName}, ${functions.getAge(widget.userProfile!.birthDay).toString()}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: GenderIconWidget(
                                                          gender: widget
                                                              .userProfile!
                                                              .gender,
                                                          maleIcon: Icon(
                                                            FFIcons.kmale,
                                                            color: Colors.black,
                                                            size: 24,
                                                          ),
                                                          femaleIcon: Icon(
                                                            FFIcons.kfemale,
                                                            color: Colors.black,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${widget.userProfile!.industry}, ${widget.userProfile!.occupation}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .subtitle2
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (columnUsersRecord.isPremium! ||
                                              !getRemoteConfigBool(
                                                  'check_premium')) {
                                            context.pushNamed(
                                              'Chat',
                                              queryParams: {
                                                'chatUser': serializeParam(
                                                  widget.userProfile,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'chatUser': widget.userProfile,
                                              },
                                            );
                                          } else {
                                            context.pushNamed('GetPremiumView');
                                          }
                                        },
                                        text: 'Chat',
                                        options: FFButtonOptions(
                                          width: 90,
                                          height: 35,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 24,
                                      ),
                                      Text(
                                        '${functions.geoDistance(widget.userProfile!.geoposition, currentUserLocationValue).toString()} miles from you',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Bio',
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  widget.userProfile!.bio!.maybeHandleOverflow(
                                    maxChars: 50,
                                    replacement: '…',
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                                Divider(
                                  thickness: 1,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 8),
                                  child: Text(
                                    'About me',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: widget.userProfile!.height!
                                            .toString(),
                                        icon: Icon(
                                          Icons.height,
                                          size: 16,
                                        ),
                                        options: FFButtonOptions(
                                          height: 32,
                                          color: FlutterFlowTheme.of(context)
                                              .backgroundGrey,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text:
                                            widget.userProfile!.drinkingStatus!,
                                        icon: Icon(
                                          Icons.wine_bar_outlined,
                                          size: 16,
                                        ),
                                        options: FFButtonOptions(
                                          height: 32,
                                          color: FlutterFlowTheme.of(context)
                                              .backgroundGrey,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text:
                                            widget.userProfile!.smokingStatus!,
                                        icon: Icon(
                                          Icons.smoking_rooms,
                                          size: 16,
                                        ),
                                        options: FFButtonOptions(
                                          height: 32,
                                          color: FlutterFlowTheme.of(context)
                                              .backgroundGrey,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: widget.userProfile!.intention!,
                                        icon: Icon(
                                          Icons.search_outlined,
                                          size: 16,
                                        ),
                                        options: FFButtonOptions(
                                          height: 32,
                                          color: FlutterFlowTheme.of(context)
                                              .backgroundGrey,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 8),
                                  child: Text(
                                    'Interests',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final interests = widget
                                          .userProfile!.interests!
                                          .toList();
                                      return Wrap(
                                        spacing: 0,
                                        runSpacing: 0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: List.generate(
                                            interests.length, (interestsIndex) {
                                          final interestsItem =
                                              interests[interestsIndex];
                                          return FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: interestsItem,
                                            options: FFButtonOptions(
                                              height: 32,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .backgroundGrey,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (!columnUsersRecord.liked!
                                  .toList()
                                  .contains(widget.userProfile!.uid) &&
                              !columnUsersRecord.disliked!
                                  .toList()
                                  .contains(widget.userProfile!.uid))
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  shape: BoxShape.circle,
                                                ),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 60,
                                                  icon: Icon(
                                                    Icons.thumb_down_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 30,
                                                  ),
                                                  onPressed: () async {
                                                    final usersUpdateData = {
                                                      'disliked': FieldValue
                                                          .arrayUnion([
                                                        widget.userProfile!.uid
                                                      ]),
                                                    };
                                                    await currentUserReference!
                                                        .update(
                                                            usersUpdateData);
                                                    setState(() => FFAppState()
                                                        .swipeAction = 'left');
                                                    setState(() => FFAppState()
                                                        .dislikedUsers
                                                        .add(widget.userProfile!
                                                            .uid!));
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
                                                              milliseconds:
                                                                  300),
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Container(
                                                width: 64,
                                                height: 64,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF27AE60),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  shape: BoxShape.circle,
                                                ),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 60,
                                                  icon: Icon(
                                                    Icons.thumb_up_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 30,
                                                  ),
                                                  onPressed: () async {
                                                    var _shouldSetState = false;
                                                    clikesState = await actions
                                                        .canProcessLikeAction(
                                                      columnUsersRecord
                                                          .likesCount,
                                                      columnUsersRecord
                                                          .lastLikeTime,
                                                      columnUsersRecord
                                                          .isPremium,
                                                      getRemoteConfigBool(
                                                          'check_premium'),
                                                    );
                                                    _shouldSetState = true;
                                                    if (clikesState == 0) {
                                                      context.pushNamed(
                                                          'GetPremiumView');

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    } else {
                                                      if (clikesState == -1) {
                                                        // addToLikedList

                                                        final usersUpdateData =
                                                            {
                                                          ...createUsersRecordData(
                                                            likesCount: 1,
                                                            lastLikeTime:
                                                                getCurrentTimestamp,
                                                          ),
                                                          'liked': FieldValue
                                                              .arrayUnion([
                                                            widget.userProfile!
                                                                .uid
                                                          ]),
                                                          'touched': FieldValue
                                                              .arrayUnion([
                                                            widget.userProfile!
                                                                .uid
                                                          ]),
                                                        };
                                                        await currentUserReference!
                                                            .update(
                                                                usersUpdateData);
                                                      } else {
                                                        // addToLikedList

                                                        final usersUpdateData =
                                                            {
                                                          'liked': FieldValue
                                                              .arrayUnion([
                                                            widget.userProfile!
                                                                .uid
                                                          ]),
                                                          'touched': FieldValue
                                                              .arrayUnion([
                                                            widget.userProfile!
                                                                .uid
                                                          ]),
                                                          'likesCount':
                                                              FieldValue
                                                                  .increment(1),
                                                        };
                                                        await currentUserReference!
                                                            .update(
                                                                usersUpdateData);
                                                      }
                                                    }

                                                    if (widget
                                                        .userProfile!.liked!
                                                        .toList()
                                                        .contains(
                                                            currentUserUid)) {
                                                      groupChat =
                                                          await FFChatManager
                                                              .instance
                                                              .createChat(
                                                        [
                                                          widget.userProfile!
                                                              .reference
                                                        ],
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
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '###',
                                                          locale: '',
                                                        )}!',
                                                        notificationImageUrl:
                                                            currentUserPhoto,
                                                        userRefs: [
                                                          widget.userProfile!
                                                              .reference
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
                                                        receiver: widget
                                                            .userProfile!
                                                            .reference,
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

                                                      context.goNamed(
                                                        'NewMatchView',
                                                        queryParams: {
                                                          'me': serializeParam(
                                                            columnUsersRecord,
                                                            ParamType.Document,
                                                          ),
                                                          'match':
                                                              serializeParam(
                                                            widget.userProfile,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'me':
                                                              columnUsersRecord,
                                                          'match': widget
                                                              .userProfile,
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
                                                          widget.userProfile!
                                                              .reference
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
                                                        receiver: widget
                                                            .userProfile!
                                                            .reference,
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
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    }

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
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
