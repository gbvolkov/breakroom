import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NitificationsBellWidget extends StatefulWidget {
  const NitificationsBellWidget({Key? key}) : super(key: key);

  @override
  _NitificationsBellWidgetState createState() =>
      _NitificationsBellWidgetState();
}

class _NitificationsBellWidgetState extends State<NitificationsBellWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NotificationsRecord>>(
      stream: queryNotificationsRecord(
        queryBuilder: (notificationsRecord) => notificationsRecord
            .where('receiver', isEqualTo: currentUserReference)
            .where('timestamp', isGreaterThan: columnUsersRecord.notiffReadTS)
            .where('is_read', isEqualTo: false),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<NotificationsRecord> badgeNotificationsRecordList = snapshot.data!;
        return Badge(
          badgeContent: Text(
            badgeNotificationsRecordList.length.toString(),
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).alternate,
                ),
          ),
          showBadge: badgeNotificationsRecordList.length > 0,
          shape: BadgeShape.circle,
          badgeColor: FlutterFlowTheme.of(context).primaryColor,
          elevation: 4,
          padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
          position: BadgePosition.topEnd(),
          animationType: BadgeAnimationType.scale,
          toAnimate: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (badgeNotificationsRecordList.length > 0)
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 40,
                  icon: FaIcon(
                    FontAwesomeIcons.bell,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 16,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              if (badgeNotificationsRecordList.length <= 0)
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 40,
                  icon: FaIcon(
                    FontAwesomeIcons.bellSlash,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 16,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
