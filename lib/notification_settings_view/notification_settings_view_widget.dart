import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationSettingsViewWidget extends StatefulWidget {
  const NotificationSettingsViewWidget({Key? key}) : super(key: key);

  @override
  _NotificationSettingsViewWidgetState createState() =>
      _NotificationSettingsViewWidgetState();
}

class _NotificationSettingsViewWidgetState
    extends State<NotificationSettingsViewWidget> {
  bool? switchAllNotificationsValue1;
  bool? switchAllNotificationsValue2;
  bool? switchReceivedLikeNotificationsValue;
  bool? switchMatchNotificationsValue;
  bool? switchMessagesNotificationsValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
          'Notifications',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Receive all notifications',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                    ),
                                    Expanded(
                                      child: SwitchListTile(
                                        value: switchAllNotificationsValue1 ??=
                                            true,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              switchAllNotificationsValue1 =
                                                  newValue!);
                                        },
                                        tileColor: Color(0xFFF5F5F5),
                                        activeColor: Color(0xFF27AE60),
                                        activeTrackColor: Color(0xFFA0E0BC),
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 16),
                  child: Text(
                    'Notify me when:',
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            alignment: AlignmentDirectional(0, 0),
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Receive all notifications',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                      Expanded(
                                        child: SwitchListTile(
                                          value:
                                              switchAllNotificationsValue2 ??=
                                                  true,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                switchAllNotificationsValue2 =
                                                    newValue!);
                                          },
                                          tileColor: Color(0xFFF5F5F5),
                                          activeColor: Color(0xFF27AE60),
                                          activeTrackColor: Color(0xFFA0E0BC),
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            alignment: AlignmentDirectional(0, 0),
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Received like',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                      Expanded(
                                        child: SwitchListTile(
                                          value:
                                              switchReceivedLikeNotificationsValue ??=
                                                  true,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                switchReceivedLikeNotificationsValue =
                                                    newValue!);
                                          },
                                          tileColor: Color(0xFFF5F5F5),
                                          activeColor: Color(0xFF27AE60),
                                          activeTrackColor: Color(0xFFA0E0BC),
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            alignment: AlignmentDirectional(0, 0),
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Match',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                      Expanded(
                                        child: SwitchListTile(
                                          value:
                                              switchMatchNotificationsValue ??=
                                                  true,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                switchMatchNotificationsValue =
                                                    newValue!);
                                          },
                                          tileColor: Color(0xFFF5F5F5),
                                          activeColor: Color(0xFF27AE60),
                                          activeTrackColor: Color(0xFFA0E0BC),
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Messages',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                    ),
                                    Expanded(
                                      child: SwitchListTile(
                                        value:
                                            switchMessagesNotificationsValue ??=
                                                true,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              switchMessagesNotificationsValue =
                                                  newValue!);
                                        },
                                        tileColor: Color(0xFFF5F5F5),
                                        activeColor: Color(0xFF27AE60),
                                        activeTrackColor: Color(0xFFA0E0BC),
                                        dense: false,
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
