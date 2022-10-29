import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderIconWidget extends StatefulWidget {
  const GenderIconWidget({Key? key}) : super(key: key);

  @override
  _GenderIconWidgetState createState() => _GenderIconWidgetState();
}

class _GenderIconWidgetState extends State<GenderIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (valueOrDefault(currentUserDocument?.gender, '') == 'Male')
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
            child: AuthUserStreamWidget(
              child: Icon(
                FFIcons.kmale,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 20,
              ),
            ),
          ),
        if (valueOrDefault(currentUserDocument?.gender, '') != 'Male')
          AuthUserStreamWidget(
            child: Icon(
              FFIcons.kfemale,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 20,
            ),
          ),
      ],
    );
  }
}
