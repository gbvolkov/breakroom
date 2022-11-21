import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyMatchesWidgetWidget extends StatefulWidget {
  const EmptyMatchesWidgetWidget({Key? key}) : super(key: key);

  @override
  _EmptyMatchesWidgetWidgetState createState() =>
      _EmptyMatchesWidgetWidgetState();
}

class _EmptyMatchesWidgetWidgetState extends State<EmptyMatchesWidgetWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
            child: SvgPicture.asset(
              'assets/images/hearts.svg',
              width: 130,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32, 32, 32, 0),
            child: Text(
              'You don\'t seem to have likes yet',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
