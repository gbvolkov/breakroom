import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dialog_signup_complete_model.dart';
export 'dialog_signup_complete_model.dart';

class DialogSignupCompleteWidget extends StatefulWidget {
  const DialogSignupCompleteWidget({Key? key}) : super(key: key);

  @override
  _DialogSignupCompleteWidgetState createState() =>
      _DialogSignupCompleteWidgetState();
}

class _DialogSignupCompleteWidgetState
    extends State<DialogSignupCompleteWidget> {
  late DialogSignupCompleteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DialogSignupCompleteModel());
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
      height: 335.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBtnText,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Container(
                width: 106.0,
                height: 106.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Text(
                'Congratulations!',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
              child: Text(
                'Your account has been successfully created!\nLet’s login to your account',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodySmall,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                      text: 'let\'s get started',
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
          ],
        ),
      ),
    );
  }
}
