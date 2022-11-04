import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestAgeWidget extends StatefulWidget {
  const TestAgeWidget({Key? key}) : super(key: key);

  @override
  _TestAgeWidgetState createState() => _TestAgeWidgetState();
}

class _TestAgeWidgetState extends State<TestAgeWidget> {
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
          child: StreamBuilder<List<UsersRecord>>(
            stream: queryUsersRecord(),
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
              List<UsersRecord> columnUsersRecordList = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children:
                    List.generate(columnUsersRecordList.length, (columnIndex) {
                  final columnUsersRecord = columnUsersRecordList[columnIndex];
                  return ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: SelectionArea(
                                child: Text(
                              columnUsersRecord.email!,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            )),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: SelectionArea(
                                child: Text(
                              columnUsersRecord.birthDay!.toString(),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            )),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: SelectionArea(
                                child: Text(
                              functions
                                  .getAge(columnUsersRecord.birthDay)
                                  .toString(),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            )),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: SelectionArea(
                                child: Text(
                              functions
                                  .addYearsToDate(
                                      getCurrentTimestamp,
                                      functions
                                          .getAge(columnUsersRecord.birthDay),
                                      -1,
                                      0)
                                  .toString(),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            )),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
