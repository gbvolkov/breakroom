import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommunityGuidlinesViewWidget extends StatefulWidget {
  const CommunityGuidlinesViewWidget({Key? key}) : super(key: key);

  @override
  _CommunityGuidlinesViewWidgetState createState() =>
      _CommunityGuidlinesViewWidgetState();
}

class _CommunityGuidlinesViewWidgetState
    extends State<CommunityGuidlinesViewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).alternate,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Community Guidlines',
          style: FlutterFlowTheme.of(context).subtitle1,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                        child: Text(
                          'Welcome to the break room. You are always be welcomed here if you are sincere, considerate, and respectful of other people. Our aim is to let users express themselves freely and break free from everyday life activities if it doesn\'t offend others. On the Breakroom, everyone is held to the same standard. We are requesting that you exercise consideration, examine your actions carefully, and follow our community rules both online and offline. Your Breakroom account could be terminated as a result for misuse of the app and conduct.\nA list of our community policies can be found below. You risk being barred from the Breakroom if you disobey any of these rules. After receiving a ban, you are not permitted to rejoin our community. We encourage you to read our Safety Tips and report any behavior that you believe to be in violation of our policies.',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
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
