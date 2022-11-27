import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyMatchesWidgetWidget extends StatefulWidget {
  const EmptyMatchesWidgetWidget({
    Key? key,
    this.search,
  }) : super(key: key);

  final String? search;

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
          if (widget.search != null && widget.search != '')
            Align(
              alignment: AlignmentDirectional(0, -1),
              child: Text(
                'There is no user with this name',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).trueBlack,
                      letterSpacing: 0.6,
                    ),
              ),
            ),
          if (widget.search == null || widget.search == '')
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                  child: Image.asset(
                    'assets/images/hearts.png',
                    width: 130,
                    height: 100,
                    fit: BoxFit.contain,
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
        ],
      ),
    );
  }
}
