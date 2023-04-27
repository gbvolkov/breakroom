import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_match_view_model.dart';
export 'new_match_view_model.dart';

class NewMatchViewWidget extends StatefulWidget {
  const NewMatchViewWidget({
    Key? key,
    this.me,
    this.match,
  }) : super(key: key);

  final UsersRecord? me;
  final UsersRecord? match;

  @override
  _NewMatchViewWidgetState createState() => _NewMatchViewWidgetState();
}

class _NewMatchViewWidgetState extends State<NewMatchViewWidget>
    with TickerProviderStateMixin {
  late NewMatchViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'imageOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: -0.2,
          end: 0.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.2,
          end: 0.04,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(100.0, 85.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(2.0, 2.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: -0.2,
          end: -0.04,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-100.0, 85.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(2.0, 2.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.2,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(3.0, 3.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewMatchViewModel());
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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              if (Navigator.of(context).canPop()) {
                context.pop();
              }
              context.pushNamed('HomeView');
            },
          ),
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Image.asset(
                          'assets/images/m12_Artboard_1.png',
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height * 0.9,
                          fit: BoxFit.cover,
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation1']!),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'It\'s a match!',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 34.0,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 16.0, 32.0, 0.0),
                              child: Text(
                                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. ',
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 64.0, 0.0, 64.0),
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 32.0, 32.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'HomeDetailsView',
                                            queryParams: {
                                              'userProfile': serializeParam(
                                                widget.match,
                                                ParamType.Document,
                                              ),
                                              'mode': serializeParam(
                                                'match',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'userProfile': widget.match,
                                            },
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              widget.match!.photoUrl,
                                              'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                            ),
                                            width: 150.0,
                                            height: 250.0,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'imageOnPageLoadAnimation2']!),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          32.0, 0.0, 0.0, 32.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            widget.me!.photoUrl,
                                            'https://firebasestorage.googleapis.com/v0/b/breakroom-7465c.appspot.com/o/Logo.png?alt=media&token=aa7ebe1a-8303-4ac2-b764-923a54ca2d76',
                                          ),
                                          width: 150.0,
                                          height: 250.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'imageOnPageLoadAnimation3']!),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 84.0,
                                      height: 84.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        shape: BoxShape.circle,
                                      ),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        icon: Icon(
                                          Icons.favorite_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 35.0,
                                        ),
                                        onPressed: () {
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation']!),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (!(widget.me!.blocked!.toList().contains(widget.match!.uid) ||
                  widget.match!.blocked!.toList().contains(widget.me!.uid)))
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 32.0),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFEE837B),
                              Color(0xFFF95A82),
                              Color(0xFFEA3C7D)
                            ],
                            stops: [0.0, 0.6, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (widget.me!.isPremium! ||
                                !getRemoteConfigBool('check_premium') ||
                                revenue_cat.activeEntitlementIds.contains(
                                    FFAppState().entChatToNotMatched)) {
                              context.pushNamed(
                                'Chat',
                                queryParams: {
                                  'chatUser': serializeParam(
                                    widget.match,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'chatUser': widget.match,
                                },
                              );
                            } else {
                              context.pushNamed(
                                'GetPremiumView',
                                queryParams: {
                                  'user': serializeParam(
                                    widget.me,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'user': widget.me,
                                },
                              );
                            }
                          },
                          text: 'Start chat',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (widget.me!.blocked!.toList().contains(widget.match!.uid) ||
                  widget.match!.blocked!.toList().contains(widget.me!.uid))
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 32.0),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0x80EE837B),
                              Color(0x7FF95A82),
                              Color(0x7FEA3C7D)
                            ],
                            stops: [0.0, 0.6, 1.0],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (widget.me!.blocked!
                                .toList()
                                .contains(widget.match!.uid)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'User ${widget.match!.displayName}is blocked by you.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0x00000000),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'User ${widget.match!.uid} has blocked you.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0x00000000),
                                ),
                              );
                            }
                          },
                          text: 'Start chat',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
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
    );
  }
}
