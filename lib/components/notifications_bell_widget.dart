import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_bell_model.dart';
export 'notifications_bell_model.dart';

class NotificationsBellWidget extends StatefulWidget {
  const NotificationsBellWidget({
    Key? key,
    this.notiffTS,
  }) : super(key: key);

  final DateTime? notiffTS;

  @override
  _NotificationsBellWidgetState createState() =>
      _NotificationsBellWidgetState();
}

class _NotificationsBellWidgetState extends State<NotificationsBellWidget> {
  late NotificationsBellModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsBellModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<NotificationsRecord>>(
      stream: queryNotificationsRecord(
        queryBuilder: (notificationsRecord) => notificationsRecord
            .where('receiver', isEqualTo: currentUserReference)
            .where('timestamp', isGreaterThan: widget.notiffTS)
            .where('is_read', isEqualTo: false),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        List<NotificationsRecord> badgeNotificationsRecordList = snapshot.data!;
        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pushNamed('NotificationsView');
          },
          child: badges.Badge(
            badgeContent: Text(
              badgeNotificationsRecordList.length.toString(),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
            ),
            showBadge: badgeNotificationsRecordList.length > 0,
            shape: badges.BadgeShape.circle,
            badgeColor: FlutterFlowTheme.of(context).primary,
            elevation: 4.0,
            padding: EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
            position: badges.BadgePosition.topEnd(),
            animationType: badges.BadgeAnimationType.scale,
            toAnimate: true,
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('NotificationsView');
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (badgeNotificationsRecordList.length > 0)
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: FaIcon(
                        FontAwesomeIcons.bell,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 16.0,
                      ),
                      onPressed: () async {
                        context.goNamed('NotificationsView');
                      },
                    ),
                  if (badgeNotificationsRecordList.length <= 0)
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: FaIcon(
                        FontAwesomeIcons.bellSlash,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 16.0,
                      ),
                      onPressed: () async {
                        context.goNamed('NotificationsView');
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
