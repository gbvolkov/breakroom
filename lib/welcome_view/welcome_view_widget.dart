import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../sign_in_view/sign_in_view_widget.dart';
import '../sign_up_view/sign_up_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeViewWidget extends StatefulWidget {
  const WelcomeViewWidget({Key? key}) : super(key: key);

  @override
  _WelcomeViewWidgetState createState() => _WelcomeViewWidgetState();
}

class _WelcomeViewWidgetState extends State<WelcomeViewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                    child: Image.asset(
                      'assets/images/WelcomeImage.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                child: Text(
                  'Let’s connect your preferences partner or friends',
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Roboto',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFEE837B),
                            Color(0xFFF95A82),
                            Color(0xFFEA3C7D)
                          ],
                          stops: [0, 0.6, 1],
                          begin: AlignmentDirectional(0, -1),
                          end: AlignmentDirectional(0, 1),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 300),
                              reverseDuration: Duration(milliseconds: 300),
                              child: SignInViewWidget(),
                            ),
                          );
                        },
                        text: 'Login with email',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48,
                          color: Colors.transparent,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: SignUpViewWidget(),
                        ),
                      );
                    },
                    text: 'Create an account',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48,
                      color: Color(0xFFF3F3F3),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle1.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 32),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 0,
                      buttonSize: 60,
                      fillColor: FlutterFlowTheme.of(context).trueBlack,
                      icon: FaIcon(
                        FontAwesomeIcons.apple,
                        color: Color(0xFFEFEFEF),
                        size: 30,
                      ),
                      onPressed: () {
                        print('ibAppleLogin pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      buttonSize: 60,
                      fillColor: FlutterFlowTheme.of(context).trueBlack,
                      icon: FaIcon(
                        FontAwesomeIcons.google,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 30,
                      ),
                      onPressed: () {
                        print('ibGoogleLogin pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      fillColor: FlutterFlowTheme.of(context).trueBlack,
                      icon: FaIcon(
                        FontAwesomeIcons.facebookF,
                        color: Color(0xFFEFEFEF),
                        size: 30,
                      ),
                      onPressed: () {
                        print('ibFacebookLogin pressed ...');
                      },
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
