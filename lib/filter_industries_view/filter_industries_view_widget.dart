import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_industries_view_model.dart';
export 'filter_industries_view_model.dart';

class FilterIndustriesViewWidget extends StatefulWidget {
  const FilterIndustriesViewWidget({
    Key? key,
    this.selectedIndustries,
  }) : super(key: key);

  final List<String>? selectedIndustries;

  @override
  _FilterIndustriesViewWidgetState createState() =>
      _FilterIndustriesViewWidgetState();
}

class _FilterIndustriesViewWidgetState
    extends State<FilterIndustriesViewWidget> {
  late FilterIndustriesViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterIndustriesViewModel());
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
            onPressed: () async {
              context.pop();
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
          child: StreamBuilder<List<IndustriesRecord>>(
            stream: queryIndustriesRecord(
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
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 64.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Industry',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                if (FFAppState().isSelectAllVisible) {
                                  FFAppState().update(() {
                                    FFAppState().isSelectAllVisible = false;
                                  });
                                  setState(() => _model
                                          .ccIndustriesValueController?.value =
                                      List.from(containerIndustriesRecordList
                                          .map((e) => e.industry)
                                          .withoutNulls
                                          .toList()));
                                } else {
                                  FFAppState().update(() {
                                    FFAppState().isSelectAllVisible = true;
                                  });
                                  setState(() => _model
                                      .ccIndustriesValueController?.value = []);
                                }
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
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Wrap(
                            spacing: 0.0,
                            runSpacing: 0.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              FlutterFlowChoiceChips(
                                options: containerIndustriesRecordList
                                    .map((e) => e.industry)
                                    .withoutNulls
                                    .toList()
                                    .map((label) => ChipData(label))
                                    .toList(),
                                onChanged: (val) => setState(
                                    () => _model.ccIndustriesValues = val),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                  iconColor: Colors.white,
                                  iconSize: 18.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 6.0, 8.0, 6.0),
                                  elevation: 0.0,
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle:
                                      FlutterFlowTheme.of(context).titleMedium,
                                  iconColor: Color(0xFF323B45),
                                  iconSize: 18.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 6.0, 8.0, 6.0),
                                  elevation: 0.0,
                                ),
                                chipSpacing: 20.0,
                                rowSpacing: 8.0,
                                multiselect: true,
                                initialized: _model.ccIndustriesValues != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.ccIndustriesValueController ??=
                                        FormFieldController<List<String>>(
                                  widget.selectedIndustries,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 48.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFEE837B),
                                    Color(0xFFF95A82),
                                    Color(0xFFEA3C7D)
                                  ],
                                  stops: [0.0, 0.6, 1.0],
                                  begin: AlignmentDirectional(0.0, -1.0),
                                  end: AlignmentDirectional(0, 1.0),
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().update(() {
                                    FFAppState().fltrIndusrtries =
                                        _model.ccIndustriesValues!.toList();
                                  });
                                  context.pop();
                                },
                                text: 'Save',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.transparent,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
