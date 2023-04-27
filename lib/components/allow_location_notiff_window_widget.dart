import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'allow_location_notiff_window_model.dart';
export 'allow_location_notiff_window_model.dart';

class AllowLocationNotiffWindowWidget extends StatefulWidget {
  const AllowLocationNotiffWindowWidget({Key? key}) : super(key: key);

  @override
  _AllowLocationNotiffWindowWidgetState createState() =>
      _AllowLocationNotiffWindowWidgetState();
}

class _AllowLocationNotiffWindowWidgetState
    extends State<AllowLocationNotiffWindowWidget> {
  late AllowLocationNotiffWindowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllowLocationNotiffWindowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(48.0, 0.0, 48.0, 200.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await Future.delayed(const Duration(milliseconds: 10));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 2.7,
              height: 204.0,
              constraints: BoxConstraints(
                maxHeight: 204.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBtnText,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                height: 204.0,
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 106.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Icon(
                              Icons.location_on,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 80.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Text(
                            'Allow location',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          child: Text(
                            'Please go to settings in your phone and turn on the location access, so the app can work properly.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.97, -0.93),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 2.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
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
