import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dialog_remove_profile_model.dart';
export 'dialog_remove_profile_model.dart';

class DialogRemoveProfileWidget extends StatefulWidget {
  const DialogRemoveProfileWidget({Key? key}) : super(key: key);

  @override
  _DialogRemoveProfileWidgetState createState() =>
      _DialogRemoveProfileWidgetState();
}

class _DialogRemoveProfileWidgetState extends State<DialogRemoveProfileWidget> {
  late DialogRemoveProfileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DialogRemoveProfileModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: 525.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBtnText,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
              child: Container(
                width: 106.0,
                height: 106.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Image.asset(
                    'assets/images/Asset_2@2x.png',
                    width: 30.0,
                    height: 30.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Text(
                'Warning!',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
              child: Text(
                'You are going to completely remove your profile from BreakRoom App. All your photos, chats and matches will be deleted with no possibility of restore.\n\nAre you really sure to do this?',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodySmall,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
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
                        stops: [0.13, 0.69, 1.0],
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
                        Navigator.pop(context);
                      },
                      text: 'not sure',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.transparent,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
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
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Function() _navigate = () {};
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('We\'ll miss you!'),
                              content: Text(
                                  'You are going to completely remove your profile from BreakRoom App. All your photos, chats and matches will be deleted with no possibility of restore.  Are you really sure to do this?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: Text('Confirm'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    if (confirmDialogResponse) {
                      await authManager.deleteUser(context);
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      _navigate =
                          () => context.goNamedAuth('WelcomeView', mounted);
                      FFAppState().update(() {
                        FFAppState().dislikedUsers = [];
                      });
                    }

                    _navigate();
                  },
                  text: 'Yes, delete my account',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.transparent,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
