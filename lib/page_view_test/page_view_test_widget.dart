import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_view_test_model.dart';
export 'page_view_test_model.dart';

class PageViewTestWidget extends StatefulWidget {
  const PageViewTestWidget({Key? key}) : super(key: key);

  @override
  _PageViewTestWidgetState createState() => _PageViewTestWidgetState();
}

class _PageViewTestWidgetState extends State<PageViewTestWidget> {
  late PageViewTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageViewTestModel());
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Back',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Page Title',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Button',
                options: FFButtonOptions(
                  width: 130.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).customColor1,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Text(
                    FFAppState().firstName,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Text(
                    FFAppState().userHeight.toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ],
              ),
              Container(
                width: 100.0,
                height: MediaQuery.of(context).size.height * 0.4,
                child: custom_widgets.MyNumberPicker(
                  width: 100.0,
                  height: MediaQuery.of(context).size.height * 0.4,
                  personHeight: 60,
                  onValueChanged: () async {
                    FFAppState().update(() {
                      FFAppState().option = 1;
                    });
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 100.0,
                child: custom_widgets.CustomRangeSlider(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 100.0,
                  minValue: 18,
                  maxValue: 80,
                  rangeStart: 30,
                  rangeEnd: 50,
                  activeColor: FlutterFlowTheme.of(context).alternate,
                  onValueChanged: () async {
                    FFAppState().update(() {
                      FFAppState().option = 1;
                    });
                  },
                ),
              ),
              Text(
                FFAppState().rangeSliderStart.toString(),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Text(
                FFAppState().rangeSliderEnd.toString(),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
