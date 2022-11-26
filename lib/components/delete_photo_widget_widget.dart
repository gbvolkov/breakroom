import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeletePhotoWidgetWidget extends StatefulWidget {
  const DeletePhotoWidgetWidget({Key? key}) : super(key: key);

  @override
  _DeletePhotoWidgetWidgetState createState() =>
      _DeletePhotoWidgetWidgetState();
}

class _DeletePhotoWidgetWidgetState extends State<DeletePhotoWidgetWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(-1, 0),
            child: FFButtonWidget(
              onPressed: () async {
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Photo'),
                          content: Text('Do you want remove the photo?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, true),
                              child: Text('Confirm'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  Navigator.pop(context, true);
                }
              },
              text: 'Delete photo',
              options: FFButtonOptions(
                width: double.infinity,
                height: 50,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle1.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).alternate,
                      fontSize: 17,
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).trueBlack,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context, false);
                },
                text: 'Cancel',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).trueBlack,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
