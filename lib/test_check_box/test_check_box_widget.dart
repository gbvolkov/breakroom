import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_check_box_model.dart';
export 'test_check_box_model.dart';

class TestCheckBoxWidget extends StatefulWidget {
  const TestCheckBoxWidget({Key? key}) : super(key: key);

  @override
  _TestCheckBoxWidgetState createState() => _TestCheckBoxWidgetState();
}

class _TestCheckBoxWidgetState extends State<TestCheckBoxWidget> {
  late TestCheckBoxModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestCheckBoxModel());
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
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: FutureBuilder<List<IndustriesRecord>>(
                  future: queryIndustriesRecordOnce(
                    queryBuilder: (industriesRecord) =>
                        industriesRecord.orderBy('industry'),
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
                    List<IndustriesRecord> containerIndustriesRecordList =
                        snapshot.data!;
                    return Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Industry',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    if (FFAppState().isSelectAllVisible) {
                                      FFAppState().update(() {
                                        FFAppState().isSelectAllVisible = false;
                                        FFAppState().fltrIndusrtries =
                                            containerIndustriesRecordList
                                                .map((e) => e.industry)
                                                .withoutNulls
                                                .toList();
                                      });
                                    } else {
                                      FFAppState().update(() {
                                        FFAppState().isSelectAllVisible = true;
                                        FFAppState().fltrIndusrtries = [];
                                      });
                                    }

                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(
                                      'testCheckBox',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  text: functions.getSelectAllButtonTitle(
                                      FFAppState().isSelectAllVisible),
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: 700.0,
                              child: custom_widgets.MyCheckBoxGroup(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: 700.0,
                                buttonLabels: containerIndustriesRecordList
                                    .map((e) => e.industry)
                                    .withoutNulls
                                    .toList(),
                                buttonValues: containerIndustriesRecordList
                                    .map((e) => e.industry)
                                    .withoutNulls
                                    .toList(),
                                horizontal: true,
                                buttonWidth: 150.0,
                                buttonHeight: 50.0,
                                defaultSelected:
                                    FFAppState().fltrIndusrtries.toList(),
                                onValue: () async {
                                  FFAppState().update(() {
                                    FFAppState().fltrIndusrtries =
                                        FFAppState().mcbSelectedValues.toList();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
