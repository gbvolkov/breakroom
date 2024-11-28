import '/auth/firebase_auth/auth_util.dart';
import '/components/dialog_signup_complete_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verify_email_view_model.dart';
export 'verify_email_view_model.dart';

class VerifyEmailViewWidget extends StatefulWidget {
  const VerifyEmailViewWidget({
    Key? key,
    this.email,
  }) : super(key: key);

  final String? email;

  @override
  _VerifyEmailViewWidgetState createState() => _VerifyEmailViewWidgetState();
}

class _VerifyEmailViewWidgetState extends State<VerifyEmailViewWidget> {
  late VerifyEmailViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyEmailViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 3000),
        callback: (timer) async {
          if (currentUserEmailVerified) {
            _model.instantTimer?.cancel();
            await actions.initializeUserDataState(
              valueOrDefault(currentUserDocument?.bodyType, ''),
              valueOrDefault(currentUserDocument?.childfreeStatus, ''),
              valueOrDefault(currentUserDocument?.drinkingStatus, ''),
              valueOrDefault(currentUserDocument?.education, ''),
              valueOrDefault(currentUserDocument?.gender, ''),
              valueOrDefault(currentUserDocument?.genderPreference, ''),
              valueOrDefault(currentUserDocument?.height, 0),
              valueOrDefault(currentUserDocument?.weight, 0),
              valueOrDefault(currentUserDocument?.intention, ''),
              (currentUserDocument?.lookingFor?.toList() ?? []).toList(),
              valueOrDefault(currentUserDocument?.religion, ''),
              valueOrDefault(currentUserDocument?.smokingStatus, ''),
              valueOrDefault(currentUserDocument?.spiritualStatus, ''),
              valueOrDefault(currentUserDocument?.workoutStatus, ''),
              valueOrDefault(currentUserDocument?.firstName, ''),
              valueOrDefault(currentUserDocument?.lastName, ''),
              currentUserDocument!.birthDay,
              valueOrDefault(currentUserDocument?.bio, ''),
              valueOrDefault(currentUserDocument?.industry, ''),
              valueOrDefault(currentUserDocument?.occupation, ''),
              (currentUserDocument?.interests?.toList() ?? []).toList(),
            );
            FFAppState().update(() {
              FFAppState().cHomeVisits = 0;
            });
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: Color(0x00000000),
              context: context,
              builder: (bottomSheetContext) {
                return GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_unfocusNode),
                  child: Padding(
                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                    child: DialogSignupCompleteWidget(),
                  ),
                );
              },
            ).then((value) => setState(() {}));

            FFAppState().update(() {
              FFAppState().preventIntroduction = true;
            });

            context.goNamed('CreateProfileView');
          }
        },
        startImmediately: true,
      );
    });
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
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 50.0,
                            icon: Icon(
                              Icons.chevron_left,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.pushNamedAuth(
                                'SignUpView',
                                mounted,
                                queryParams: {
                                  'email': serializeParam(
                                    widget.email,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 64.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                    child: Image.asset(
                      'assets/images/envelop.png',
                      width: 200.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: Text(
                              'Verify your Email',
                              style: FlutterFlowTheme.of(context).displaySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await authManager.sendEmailVerification();
                    },
                    child: Container(
                      width: 160.0,
                      height: 30.0,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Text(
                          'Resend verification link',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
