import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_matches_widget_model.dart';
export 'empty_matches_widget_model.dart';

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
  late EmptyMatchesWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyMatchesWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.search != null && widget.search != '')
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Text(
                'There is no user with this name',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: Image.asset(
                    'assets/images/hearts.png',
                    width: 130.0,
                    height: 100.0,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 0.0),
                  child: Text(
                    'You don\'t seem to have likes yet',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Here you can see users who likes you',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).secondaryText,
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
