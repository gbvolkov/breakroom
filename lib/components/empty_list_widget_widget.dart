import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyListWidgetWidget extends StatefulWidget {
  const EmptyListWidgetWidget({Key? key}) : super(key: key);

  @override
  _EmptyListWidgetWidgetState createState() => _EmptyListWidgetWidgetState();
}

class _EmptyListWidgetWidgetState extends State<EmptyListWidgetWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/m12_Artboard_1.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32, 32, 32, 0),
            child: Text(
              'You don\'t seem to have chats yet',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
            child: Text(
              'All your correspondence and requests to send a message will be here.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).subtitle2,
            ),
          ),
        ],
      ),
    );
  }
}
