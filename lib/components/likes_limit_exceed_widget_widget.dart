import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'likes_limit_exceed_widget_model.dart';
export 'likes_limit_exceed_widget_model.dart';

class LikesLimitExceedWidgetWidget extends StatefulWidget {
  const LikesLimitExceedWidgetWidget({
    Key? key,
    this.user,
    this.showTime,
    this.back,
  }) : super(key: key);

  final UsersRecord? user;
  final bool? showTime;
  final String? back;

  @override
  _LikesLimitExceedWidgetWidgetState createState() =>
      _LikesLimitExceedWidgetWidgetState();
}

class _LikesLimitExceedWidgetWidgetState
    extends State<LikesLimitExceedWidgetWidget> {
  late LikesLimitExceedWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LikesLimitExceedWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width * 3.43,
      height: 439.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBtnText,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Text(
                    'Switch to Premium Plus',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                if (widget.showTime ?? true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                    child: Text(
                      'Your daily 10 likes limit has been reached.\nPlease, subscribe to unlock the unlimited likes',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 110.0,
                            height: 120.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Container(
                                    width: 83.0,
                                    height: 22.0,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      '12 months',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 17.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Container(
                                    width: 83.0,
                                    height: 32.0,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    child: Container(
                                      width: 100.0,
                                      height: 32.0,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        maxHeight: double.infinity,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                revenue_cat
                                                    .offerings!
                                                    .current!
                                                    .annual!
                                                    .storeProduct
                                                    .priceString,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              '${formatNumber(
                                                functions.mdiv(
                                                    revenue_cat
                                                        .offerings!
                                                        .current!
                                                        .annual!
                                                        .storeProduct
                                                        .price,
                                                    12),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              )}/m',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 10.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (FFAppState().selectedPackage !=
                              revenue_cat
                                  .offerings!.current!.annual!.identifier)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().update(() {
                                  FFAppState().selectedPackage = revenue_cat
                                      .offerings!.current!.annual!.identifier;
                                });
                              },
                              child: Container(
                                width: 110.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: Color(0x7FF5F5F5),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 110.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFEE837B),
                                  Color(0xFFF95A82),
                                  Color(0xFFEA3C7D)
                                ],
                                stops: [0.13, 0.69, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Container(
                                    width: 83.0,
                                    height: 22.0,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      '3 months',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 17.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Container(
                                    width: 83.0,
                                    height: 32.0,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: AutoSizeText(
                                      'With a 50% savings',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    child: Container(
                                      width: 100.0,
                                      height: 32.0,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        maxHeight: double.infinity,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                revenue_cat
                                                    .offerings!
                                                    .current!
                                                    .threeMonth!
                                                    .storeProduct
                                                    .priceString,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              '${formatNumber(
                                                functions.mdiv(
                                                    revenue_cat
                                                        .offerings!
                                                        .current!
                                                        .threeMonth!
                                                        .storeProduct
                                                        .price,
                                                    3),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              )}/m',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 10.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (FFAppState().selectedPackage !=
                              revenue_cat
                                  .offerings!.current!.threeMonth!.identifier)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().update(() {
                                  FFAppState().selectedPackage = revenue_cat
                                      .offerings!
                                      .current!
                                      .threeMonth!
                                      .identifier;
                                });
                              },
                              child: Container(
                                width: 110.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: Color(0x7FF5F5F5),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 110.0,
                            height: 120.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Container(
                                    width: 83.0,
                                    height: 22.0,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      '1 month',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 17.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Container(
                                    width: 83.0,
                                    height: 32.0,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    child: Container(
                                      width: 100.0,
                                      height: 32.0,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        maxHeight: double.infinity,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                revenue_cat
                                                    .offerings!
                                                    .current!
                                                    .monthly!
                                                    .storeProduct
                                                    .priceString,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              '${formatNumber(
                                                functions.mdiv(
                                                    revenue_cat
                                                        .offerings!
                                                        .current!
                                                        .monthly!
                                                        .storeProduct
                                                        .price,
                                                    1),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              )}/m',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 10.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (FFAppState().selectedPackage !=
                              revenue_cat
                                  .offerings!.current!.monthly!.identifier)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().update(() {
                                  FFAppState().selectedPackage = revenue_cat
                                      .offerings!.current!.monthly!.identifier;
                                });
                              },
                              child: Container(
                                width: 110.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: Color(0x7FF5F5F5),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (widget.showTime ?? true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                    child: Text(
                      functions.getTimeToNoon(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                        stops: [0.13, 0.69, 1.0],
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
                        _model.didPurchase = await revenue_cat
                            .purchasePackage(FFAppState().selectedPackage);
                        if (_model.didPurchase!) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Congratulations! You unlock full features!',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 14.0,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          );
                        }
                        Navigator.pop(context, _model.didPurchase);

                        setState(() {});
                      },
                      text: 'Continue',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.transparent,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  if (FFAppState().selectedPackage == null ||
                      FFAppState().selectedPackage == '')
                    Container(
                      width: double.infinity,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Color(0x80F5F5F5),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
