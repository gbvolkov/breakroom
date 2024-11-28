import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'community_guidlines_view_model.dart';
export 'community_guidlines_view_model.dart';

class CommunityGuidlinesViewWidget extends StatefulWidget {
  const CommunityGuidlinesViewWidget({Key? key}) : super(key: key);

  @override
  _CommunityGuidlinesViewWidgetState createState() =>
      _CommunityGuidlinesViewWidgetState();
}

class _CommunityGuidlinesViewWidgetState
    extends State<CommunityGuidlinesViewWidget> {
  late CommunityGuidlinesViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityGuidlinesViewModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).alternate,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Community Guidlines',
            style: FlutterFlowTheme.of(context).titleMedium,
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Text(
                          'Welcome to the break room. You are always be welcomed here if you are sincere, considerate, and respectful of other people. Our aim is to let users express themselves freely and break free from everyday life activities if it doesn\'t offend others. On the Breakroom, everyone is held to the same standard. We are requesting that you exercise consideration, examine your actions carefully, and follow our community rules both online and offline. Your Breakroom account could be terminated as a result for misuse of the app and conduct.\nA list of our community policies can be found below. You risk being barred from the Breakroom if you disobey any of these rules. After receiving a ban, you are not permitted to rejoin our community. We encourage you to read our Safety Tips and report any behavior that you believe to be in violation of our policies.',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                lineHeight: 1.5,
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
