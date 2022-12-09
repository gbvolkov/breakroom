import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllowLocationNotiffWindowWidget extends StatefulWidget {
  const AllowLocationNotiffWindowWidget({Key? key}) : super(key: key);

  @override
  _AllowLocationNotiffWindowWidgetState createState() =>
      _AllowLocationNotiffWindowWidgetState();
}

class _AllowLocationNotiffWindowWidgetState
    extends State<AllowLocationNotiffWindowWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      onTap: () async {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(48, 0, 48, 200),
          child: InkWell(
            onTap: () async {
              await Future.delayed(const Duration(milliseconds: 10));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 2.7,
              height: 204,
              constraints: BoxConstraints(
                maxHeight: 204,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBtnText,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                height: 204,
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 106,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Icon(
                              Icons.location_on,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 80,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Text(
                            'Allow location',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
                          child: Text(
                            'Please go to settings in your phone and turn on the location access, so the app can work properly.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.97, -0.93),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 2,
                        borderWidth: 1,
                        buttonSize: 40,
                        icon: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
