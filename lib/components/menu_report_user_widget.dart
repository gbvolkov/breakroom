import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_report_user_model.dart';
export 'menu_report_user_model.dart';

class MenuReportUserWidget extends StatefulWidget {
  const MenuReportUserWidget({
    Key? key,
    this.isBlocked,
  }) : super(key: key);

  final bool? isBlocked;

  @override
  _MenuReportUserWidgetState createState() => _MenuReportUserWidgetState();
}

class _MenuReportUserWidgetState extends State<MenuReportUserWidget> {
  late MenuReportUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuReportUserModel());
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
      width: double.infinity,
      height: 270.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).noColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (false)
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context, 'unmatch');
                    },
                    text: 'Unmatch',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Color(0xB4F5F5F5),
                        width: 1.0,
                      ),
                    ),
                  ),
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context, 'report');
                  },
                  text: 'Report',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Color(0xB4F5F5F5),
                      width: 1.0,
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(
                        context,
                        valueOrDefault<String>(
                          widget.isBlocked! ? 'unblock' : 'block',
                          'block',
                        ));
                  },
                  text: valueOrDefault<String>(
                    widget.isBlocked! ? 'Unblock' : 'Block',
                    'Block',
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).alternate,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Color(0xB4F5F5F5),
                      width: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Cancel',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
