import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditLookingForViewWidget extends StatefulWidget {
  const EditLookingForViewWidget({Key? key}) : super(key: key);

  @override
  _EditLookingForViewWidgetState createState() =>
      _EditLookingForViewWidgetState();
}

class _EditLookingForViewWidgetState extends State<EditLookingForViewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            context.pop();
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
                    'What are you\nlooking for?',
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
                    height: 250,
                    child: custom_widgets.MyCheckBoxGroup(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      buttonLabels: FFAppState().lookingForList.toList(),
                      buttonValues: FFAppState().lookingForList.toList(),
                      horizontal: true,
                      buttonHeight: 50.0,
                      defaultSelected: FFAppState().usrLookingFor.toList(),
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
                            if (FFAppState().mcbSelectedValues.length > 0) {
                              setState(() {
                                FFAppState().usrLookingFor =
                                    FFAppState().mcbSelectedValues.toList();
                              });
                              context.pop();
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Value is not selected'),
                                    content: Text('Please make a selection'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
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
