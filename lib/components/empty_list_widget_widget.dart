import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_list_widget_model.dart';
export 'empty_list_widget_model.dart';

class EmptyListWidgetWidget extends StatefulWidget {
  const EmptyListWidgetWidget({Key? key}) : super(key: key);

  @override
  _EmptyListWidgetWidgetState createState() => _EmptyListWidgetWidgetState();
}

class _EmptyListWidgetWidgetState extends State<EmptyListWidgetWidget> {
  late EmptyListWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListWidgetModel());
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
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
            child: Image.asset(
              'assets/images/m12_Artboard_1.png',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 0.0),
            child: Text(
              'You don\'t seem to have chats yet',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 32.0),
            child: Text(
              'All your correspondence and requests to send a message will be here.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
