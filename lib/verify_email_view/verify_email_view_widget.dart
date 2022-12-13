import '../auth/auth_util.dart';
import '../components/dialog_signup_complete_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/instant_timer.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  InstantTimer? instantTimer;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().canResendVerification = true;
      });
      instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 3000),
        callback: (timer) async {
          if (currentUserEmailVerified) {
            instantTimer?.cancel();
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
            setState(() {
              FFAppState().cHomeVisits = 0;
            });
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: DialogSignupCompleteWidget(),
                );
              },
            ).then((value) => setState(() {}));

            setState(() {
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
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).alternate,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 50,
                          icon: Icon(
                            Icons.chevron_left,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 30,
                          ),
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            await signOut();

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
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 64),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                    child: Image.asset(
                      'assets/images/envelop.png',
                      width: 200,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                            child: Text(
                              'Verify your Email',
                              style: FlutterFlowTheme.of(context).title1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (FFAppState().canResendVerification)
                  Align(
                    alignment: AlignmentDirectional(1, 0),
                    child: InkWell(
                      onTap: () async {
                        await sendEmailVerification();
                        setState(() {
                          FFAppState().canResendVerification = false;
                        });
                        await Future.delayed(
                            const Duration(milliseconds: 60000));
                        setState(() {
                          FFAppState().canResendVerification = true;
                        });
                      },
                      child: Text(
                        'Resend verification link',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryColor,
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.underline,
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
