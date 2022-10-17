import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TmpUserMgmtWidget extends StatefulWidget {
  const TmpUserMgmtWidget({Key? key}) : super(key: key);

  @override
  _TmpUserMgmtWidgetState createState() => _TmpUserMgmtWidgetState();
}

class _TmpUserMgmtWidgetState extends State<TmpUserMgmtWidget> {
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
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AuthUserStreamWidget(
                    child: Text(
                      valueOrDefault(currentUserDocument?.genderPreference, ''),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                  AuthUserStreamWidget(
                    child: Text(
                      valueOrDefault(currentUserDocument?.intention, ''),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                  AuthUserStreamWidget(
                    child: Text(
                      currentUserDocument!.filter.ageRange!.min!.toString(),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                  AuthUserStreamWidget(
                    child: Text(
                      currentUserDocument!.filter.ageRange!.max!.toString(),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: AuthUserStreamWidget(
                    child: StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord
                            .where('gender',
                                isEqualTo: valueOrDefault(
                                    currentUserDocument?.genderPreference, ''))
                            .where('intention',
                                isEqualTo: valueOrDefault(
                                    currentUserDocument?.intention, ''))
                            .where('birthDay',
                                isLessThanOrEqualTo: functions.addYearsToDate(
                                    getCurrentTimestamp,
                                    valueOrDefault<double>(
                                      currentUserDocument!.filter.ageRange?.min,
                                      0.0,
                                    ),
                                    -1))
                            .where('birthDay',
                                isGreaterThanOrEqualTo:
                                    functions.addYearsToDate(
                                        getCurrentTimestamp,
                                        valueOrDefault<double>(
                                          currentUserDocument!
                                              .filter.ageRange?.max,
                                          80.0,
                                        ),
                                        -1)),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> listViewUsersRecordList = snapshot
                            .data!
                            .where((u) => u.uid != currentUserUid)
                            .toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewUsersRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewUsersRecord =
                                listViewUsersRecordList[listViewIndex];
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  listViewUsersRecord.email!,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Text(
                                  dateTimeFormat(
                                      'd/M/y', listViewUsersRecord.birthDay!),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Text(
                                  dateTimeFormat(
                                      'd/M/y',
                                      functions.addYearsToDate(
                                          getCurrentTimestamp,
                                          currentUserDocument!
                                              .filter.ageRange!.max!,
                                          -1)),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Text(
                                  listViewUsersRecord.gender!,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Text(
                                  listViewUsersRecord.intention!,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) =>
                          usersRecord.orderBy('email'),
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
                      List<UsersRecord> listViewUsersRecordList = snapshot.data!
                          .where((u) => u.uid != currentUserUid)
                          .toList();
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewUsersRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewUsersRecord =
                              listViewUsersRecordList[listViewIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                listViewUsersRecord.email!,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                      'd/M/y', listViewUsersRecord.birthDay),
                                  'NA',
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              AuthUserStreamWidget(
                                child: Text(
                                  valueOrDefault<String>(
                                    dateTimeFormat(
                                        'd/M/y',
                                        functions.addYearsToDate(
                                            getCurrentTimestamp,
                                            currentUserDocument!
                                                .filter.ageRange!.max!,
                                            -1)),
                                    'NA',
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              Text(
                                listViewUsersRecord.gender!,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                listViewUsersRecord.intention!,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
