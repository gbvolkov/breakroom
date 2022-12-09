import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class IntroductionViewWidget extends StatefulWidget {
  const IntroductionViewWidget({Key? key}) : super(key: key);

  @override
  _IntroductionViewWidgetState createState() => _IntroductionViewWidgetState();
}

class _IntroductionViewWidgetState extends State<IntroductionViewWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'stackOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 1000.ms,
          begin: Offset(0, 0),
          end: Offset(30, 0),
        ),
      ],
    ),
    'stackOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 1000.ms,
          begin: Offset(0, 0),
          end: Offset(-30, 0),
        ),
      ],
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SwipeableCardSectionController swipeableStackController;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().tmpInteger = 2;
      });
      if (animationsMap['stackOnActionTriggerAnimation1'] != null) {
        await animationsMap['stackOnActionTriggerAnimation1']!.controller
          ..reset()
          ..repeat();
      }
      if (animationsMap['stackOnActionTriggerAnimation2'] != null) {
        await animationsMap['stackOnActionTriggerAnimation2']!.controller
          ..reset()
          ..repeat();
      }
    });

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
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Break Room',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: FlutterFlowSwipeableStack(
                  topCardHeightFraction: 0.78,
                  middleCardHeightFraction: 0.68,
                  bottomCardHeightFraction: 0.75,
                  topCardWidthFraction: 0.9,
                  middleCardWidthFraction: 0.85,
                  bottomCardWidthFraction: 0.8,
                  onSwipeFn: (index) async {
                    setState(() {
                      FFAppState().tmpInteger = FFAppState().tmpInteger + -1;
                    });
                    if (FFAppState().tmpInteger == 0) {
                      context.goNamed('HomeView');
                    } else {
                      return;
                    }
                  },
                  onLeftSwipe: (index) {},
                  onRightSwipe: (index) {},
                  onUpSwipe: (index) async {
                    setState(() {
                      FFAppState().tmpInteger = FFAppState().tmpInteger + -1;
                    });
                    if (FFAppState().tmpInteger == 0) {
                      context.goNamed('HomeView');
                    } else {
                      return;
                    }
                  },
                  onDownSwipe: (index) {},
                  itemBuilder: (context, index) {
                    return [
                      () => Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: Image.asset(
                                      'assets/images/pexels-italo-melo-2379004_1.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x8E000000),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Text(
                                          'Slide to right to pass',
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                      Divider(
                                        height: 1,
                                        thickness: 2,
                                        indent: 40,
                                        endIndent: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .systemSuccess,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32, 8, 32, 8),
                                        child: Text(
                                          'If the picture we found does not match you slide right',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0.4, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Image.asset(
                                                    'assets/images/FingerSwipe.png',
                                                    width: 32,
                                                    height: 32,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.7, -0.5),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .angleDoubleRight,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 28,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'stackOnActionTriggerAnimation1']!,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, 1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 16, 16),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 60,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      icon: Icon(
                                        FFIcons.kicLike,
                                        color: FlutterFlowTheme.of(context)
                                            .systemSuccess,
                                        size: 26,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      () => Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: Image.asset(
                                      'assets/images/pexels-daniel-xavier-1239291_1.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, -1),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x8E000000),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 16),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 60,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      icon: Icon(
                                        FFIcons.kicDislike,
                                        color: FlutterFlowTheme.of(context)
                                            .systemError,
                                        size: 26,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 8),
                                        child: Text(
                                          'Slide to left to pass',
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                      Divider(
                                        height: 1,
                                        thickness: 2,
                                        indent: 40,
                                        endIndent: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .systemError,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32, 8, 32, 8),
                                        child: Text(
                                          'If the picture we found does not match you slide right',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.2, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Image.asset(
                                                    'assets/images/FingerSwipeLeft.png',
                                                    width: 32,
                                                    height: 32,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.8, -0.5),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .angleDoubleLeft,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 28,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'stackOnActionTriggerAnimation2']!,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ][index]();
                  },
                  itemCount: 2,
                  controller: swipeableStackController,
                  enableSwipeUp: true,
                  enableSwipeDown: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
