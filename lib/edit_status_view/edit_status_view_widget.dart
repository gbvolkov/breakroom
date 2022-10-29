import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class EditStatusViewWidget extends StatefulWidget {
  const EditStatusViewWidget({Key? key}) : super(key: key);

  @override
  _EditStatusViewWidgetState createState() => _EditStatusViewWidgetState();
}

class _EditStatusViewWidgetState extends State<EditStatusViewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().mrbSelectedValue = FFAppState().usrIntention);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Text(
                    'Choose your status',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Roboto',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 64),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: custom_widgets.MyRadioButton(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      buttonLabels: FFAppState().intentions.toList(),
                      buttonValues: FFAppState().intentions.toList(),
                      horizontal: true,
                      buttonHeight: 50.0,
                      defaultSelected: FFAppState().usrIntention,
                      onValue: () async {},
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                            setState(() => FFAppState().usrIntention =
                                FFAppState().mrbSelectedValue);
                            Navigator.pop(context);
                          },
                          text: 'Save',
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
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(8),
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
      ),
    );
  }
}
